import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:locume/api/api_provider.dart';
import 'package:locume/api/auth_provider.dart';
import 'package:locume/app/screen/login/signup/model/register_res.dart';
import 'package:locume/app/screen/login/signup/model/specialtie_model.dart';
import 'package:locume/app/screen/login/signup/model/verify_res.dart';
import 'package:locume/app/screen/login/signup/model/state_model.dart'
    as allstate;

import 'package:locume/app/screen/login/signup/model/city_model.dart'
    as allcity;

class LoginController extends GetxController {
  Rx<List<allstate.Result?>> statedata = Rx<List<allstate.Result?>>([]);
  Rx<List<allcity.Result?>> citydata = Rx<List<allcity.Result?>>([]);

  TextEditingController phonenumber = TextEditingController();
  TextEditingController otpcontroller = TextEditingController();
  TextEditingController fullname = TextEditingController();

  TextEditingController medicalid = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController rate = TextEditingController();
  RxInt verifyID = 0.obs;
  RxBool verifyotp = false.obs;

  final RxList<String> availability =
      <String>["Morning", "Afternoon", "Evening", "Night"].obs;
  final RxList<String> selectedavailability = <String>[].obs;
  final RxList<String> selectedSpecialty = <String>[].obs;
  final RxString gender = ''.obs;

  final RxList<int> selectedShiftIds =
      <int>[].obs; // To store selected shift IDs

  final RxString otpButtonText = 'Send OTP'.obs; // Initialize with 'Send OTP'
  final RxBool isButtonEnabled = true.obs; // Initially enabled
  RxBool verify = false.obs;
  final RxList<Result> specialtiesList = <Result>[].obs;

  Timer? _timer;
  int _remainingTime = 30;
  RxBool isLoading = false.obs; // To control the loading spinner visibility
  RxString errorMessage = ''.obs; // To store error messages
  var isoCode = ''.obs; // Observable String

  void onInit() {
    super.onInit();
    getSpecialites();
    getallstate();
    getallcity(isoCode.value);
    _timer?.cancel();
  }

  void startOtpTimer() {
    isButtonEnabled.value = false;
    otpButtonText.value = 'Resend OTP in $_remainingTime s';

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        _remainingTime--;
        otpButtonText.value = 'Resend OTP in $_remainingTime s';
      } else {
        _timer?.cancel();
        _remainingTime = 30;
        isButtonEnabled.value = true;
        otpButtonText.value = 'Resend OTP';
      }
    });
  }

  Future getallstate() async {
    await ApiProvider.get("/api/list/getStateList",
        head: {"Content-Type": "application/json"}).then((value) async {
      final map = jsonDecode(value.body);

      allstate.StateList res = allstate.StateList.fromJson(map);
      if (res.status == 200) {
        statedata.value = res.result?.cast<allstate.Result>() ?? [];
      }
    });
  }

  Future getallcity(String? isoCode) async {
    await ApiProvider.post("/api/list/getCityList",
        data: {"isoCode": isoCode},
        head: {"Content-Type": "application/json"}).then((value) async {
      final map = jsonDecode(value.body);

      allcity.CityList res = allcity.CityList.fromJson(map);
      if (res.status == 200) {
        citydata.value = res.result?.cast<allcity.Result>() ?? [];
      }
    });
  }

  Future<void> getSpecialites() async {
    final response = await ApiProvider.get("/api/list/specialties",
        head: {"Content-Type": "application/json"});
    final map = jsonDecode(response.body);
    Specialties res = Specialties.fromJson(map);

    if (res.status == 200) {
      specialtiesList.value = res.result ?? [];
    }
  }

  void updateSelectedShiftIds() {
    selectedShiftIds.clear();
    for (var shift in selectedavailability) {
      switch (shift) {
        case "Morning":
          selectedShiftIds.add(1);
          break;
        case "Afternoon":
          selectedShiftIds.add(2);
          break;
        case "Evening":
          selectedShiftIds.add(3);
          break;
        case "Night":
          selectedShiftIds.add(4);
          break;
      }
    }
  }

  register() {
    List<int> selectedSpecialtyIds = [];
    for (var specialtyName in selectedSpecialty) {
      var specialty = specialtiesList.firstWhere(
        (specialty) => specialty.specialtiesName == specialtyName,
      );
      if (specialty != null) {
        selectedSpecialtyIds.add(specialty.id ?? 0); // Add the specialty ID
      }
    }
  }

  Future<void> userloginotp() async {
    if (phonenumber.text.isEmpty) {
      Get.snackbar("Error", "Please enter a phone number",
          snackPosition: SnackPosition.TOP);
      return; // Stop execution if the phone number is empty
    }

    isLoading.value = true; // Show loading indicator

    final response = await ApiProvider.post(
      "/api/users/generateOtp",
      head: {"Content-Type": "application/json"},
      data: {"mobileNumber": phonenumber.text.trim(), "otpType": 1},
    );

    isLoading.value = false; // Hide loading indicator
    print(response.body);
    if (response.statusCode == 200) {
      startOtpTimer();
      final Map<String, dynamic> responseData = json.decode(response.body);

      // Extract the OTP value
      final otp = responseData['otp'];
      Get.snackbar(
        "OTP", // Title of the snackbar
        "Your OTP is: $otp", // Message to display in snackbar
        snackPosition: SnackPosition.TOP,
      );
      errorMessage.value = "";
    } else if (response.statusCode == 409) {
      errorMessage.value =
          "This number already exists"; // Display error message
    } else {
      errorMessage.value = "An error occurred. Please try again.";
    }
    update();
  }

  Future<void> sendOtp() async {
    if (phonenumber.text.isEmpty) {
      Get.snackbar("Error", "Please enter a phone number",
          snackPosition: SnackPosition.TOP);
      return; // Stop execution if the phone number is empty
    }

    isLoading.value = true; // Show loading indicator

    final response = await ApiProvider.post(
      "/api/users/generateOtp",
      head: {"Content-Type": "application/json"},
      data: {"mobileNumber": phonenumber.text.trim(), "otpType": 2},
    );

    isLoading.value = false; // Hide loading indicator
    print(response.body);
    if (response.statusCode == 200) {
      startOtpTimer();
      errorMessage.value = "";
    } else if (response.statusCode == 409) {
      errorMessage.value =
          "This number already exists"; // Display error message
    } else {
      errorMessage.value = "An error occurred. Please try again.";
    }
    update();
  }

  Future<void> verifyOTP() async {
    print("object");
    final response = await ApiProvider.post(
      "/api/users/verifyOtp",
      head: {"Content-Type": "application/json"},
      data: {
        "mobileNumber": phonenumber.text.trim(),
        "otp": otpcontroller.text.trim()
      },
    );
    final map = jsonDecode(response.body);
    VerifyModel res = VerifyModel.fromJson(map);
    if (res.status == 200) {
      verifyID.value = res.result!.otpVerficationId!;
      verifyotp.value = true;
    }
  }

  Future<void> userLogin() async {
    final response = await ApiProvider.post(
      "/api/users/userLogin",
      head: {"Content-Type": "application/json"},
      data: {
        "mobileNumber": phonenumber.text.trim(),
        "otp": otpcontroller.text.trim()
      },
    );
    final map = jsonDecode(response.body);
    print(map);
    Register res = Register.fromJson(map);

    if (res.status == 200) {
      Get.find<AuthProvider>().setUser(res);
      await SessionManager().set('isloggedIn', true);
      await SessionManager().set('ishint_viewd', true);
      await SessionManager().set('token', res.token);
      Get.offAllNamed('/bottomnavigation');
    }
  }

  Future<void> userLoginwithToken(String token) async {
    final response = await ApiProvider.post(
      "/api/users/getUserDataUsingToken",
      head: {"Content-Type": "application/json"},
      data: {"token": token},
    );
    final map = jsonDecode(response.body);
    print(map);
    Register res = Register.fromJson(map);

    if (res.status == 200) {
      Get.find<AuthProvider>().setUser(res);
      await SessionManager().set('isloggedIn', true);
      await SessionManager().set('ishint_viewd', true);
      await SessionManager().set('token', res.token);
    }
  }

  Future<void> registerUser() async {
    List<int> selectedSpecialtyIds = [];
    for (var specialtyName in selectedSpecialty) {
      var specialty = specialtiesList.firstWhere(
        (specialty) => specialty.specialtiesName == specialtyName,
      );
      if (specialty != null) {
        selectedSpecialtyIds.add(specialty.id ?? 0); // Add the specialty ID
      }
    }
    final response = await ApiProvider.post(
      "/api/users/addUsersV2",
      head: {"Content-Type": "application/json"},
      data: {
        "fullName": fullname.text.trim(),
        "mobileVerficationId": verifyID.value,
        "gender": gender.value,
        // "registrationId": medicalid.text.trim(),
        "state": state.text.trim(),
        "city": city.text.trim()
      },
    );
    print(response.body);
    final map = jsonDecode(response.body);
    Register res = Register.fromJson(map);
    if (res.status == 200) {
      Get.offAllNamed('/bottomnavigation');
    }
  }
}
