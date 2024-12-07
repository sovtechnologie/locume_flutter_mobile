import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locume/api/api_provider.dart';
import 'package:locume/app/screen/login/signup/model/register_res.dart';
import 'package:locume/app/screen/login/signup/model/specialtie_model.dart';
import 'package:locume/app/screen/login/signup/model/verify_res.dart';

class LoginController extends GetxController {
  TextEditingController phonenumber = TextEditingController();
  TextEditingController otpcontroller = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController medicalid = TextEditingController();
  TextEditingController location = TextEditingController();
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

  void onInit() {
    super.onInit();
    getSpecialites();
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

  Future<void> getSpecialites() async {
    final response = await ApiProvider.get("/api/list/specialties",
        head: {"Content-Type": "application/json"});
    final map = jsonDecode(response.body);
    Specialties res = Specialties.fromJson(map);

    if (res.status == 200) {
      specialtiesList.value = res.result ?? [];
    }
  }

  List<String> getSpecialtyNames() {
    return specialtiesList
        .map((result) => result.specialtiesName ?? '')
        .toList();
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
    print("First Name: ${firstname.text}");
    print("Last Name: ${lastname.text}");
    print("Phone Number: ${phonenumber.text}");
    print("Medical ID: ${medicalid.text}");

    List<int> selectedSpecialtyIds = [];
    for (var specialtyName in selectedSpecialty) {
      var specialty = specialtiesList.firstWhere(
        (specialty) => specialty.specialtiesName == specialtyName,
      );
      if (specialty != null) {
        selectedSpecialtyIds.add(specialty.id ?? 0); // Add the specialty ID
      }
    }
    print("Selected Shift IDs: $selectedShiftIds");
    print("Selected Specialty IDs: $selectedSpecialtyIds");
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
    print("object");
    final response = await ApiProvider.post(
      "/api/users/userLogin",
      head: {"Content-Type": "application/json"},
      data: {
        "mobileNumber": phonenumber.text.trim(),
        "otp": otpcontroller.text.trim()
      },
    );
    final map = jsonDecode(response.body);
    Register res = Register.fromJson(map);
    print(map);
    print(res);
    if (res.status == 200) {
      Get.offAllNamed('/bottomnavigation');
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
      "/api/users/addUsers",
      head: {"Content-Type": "application/json"},
      data: {
        "firstName": firstname.text.trim(),
        "lastName": lastname.text.trim(),
        "mobileVerficationId": verifyID.value,
        "gender": gender.value,
        "availability": selectedShiftIds,
        "medicalId": medicalid.text.trim(),
        "location": location.text.trim(),
        "specialization": selectedSpecialtyIds,
        "hourlyRate": rate.text,
      },
    );
    print(response.body);
    final map = jsonDecode(response.body);
    Register res = Register.fromJson(map);
    if (res.status == 200) {
      Get.offAllNamed('/home');
    }
  }
}
