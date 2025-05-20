import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:locume/api/api_provider.dart';
import 'package:locume/api/auth_provider.dart';
import 'package:locume/app/screen/clinics/modek/clinic_model.dart' as clinic;
import 'package:locume/app/screen/drprofile/model/drprofile_model.dart'
    as DrProfile;
import 'package:locume/app/screen/drprofile/model/drprofile_model.dart';
import 'package:locume/app/screen/login/signup/model/specialtie_model.dart'
    as specialtie;
import 'package:http/http.dart' as http;
import 'package:locume/app/screen/login/signup/model/state_model.dart'
    as allstate;

import 'package:locume/app/screen/hospitals/model/Hospital_model.dart'
    as hospital;

import 'package:locume/app/screen/login/signup/model/city_model.dart'
    as allcity;
import 'package:locume/app/screen/profile/view/Add_clinic.dart';

class ProfileController extends GetxController {
  Rx<List<allstate.Result?>> statedata = Rx<List<allstate.Result?>>([]);
  Rx<List<allcity.Result?>> citydata = Rx<List<allcity.Result?>>([]);
  final RxSet<String> selectedOptions = <String>{}.obs;

  var index = 1.obs;
  var clinicNameError = "".obs;
  var aboutError = "".obs;
  var slotError = "".obs;
  var contactNumberError = "".obs;
  var clinicAddressError = "".obs;
  var stateError = "".obs;
  var cityError = "".obs;
  var pincodeError = "".obs;
  var clinicImageError = "".obs;

  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController clinicName = TextEditingController();
  TextEditingController about = TextEditingController();
  TextEditingController contactNumber = TextEditingController();

  TextEditingController pincode = TextEditingController();

  TextEditingController clinicAddress = TextEditingController();
  TextEditingController hospitalName = TextEditingController();
  TextEditingController hospitalAddress = TextEditingController();
  TextEditingController addeducation = TextEditingController();
  Rx<List<DrProfile.Result>> dr_data = Rx<List<DrProfile.Result>>([]);
  RxBool isLoading = true.obs; // To track loading state
  RxBool addHosiptial = false.obs;
  RxBool addClinic = false.obs;
  RxList selectedSpecialties = [].obs;
  // var selectedOptions = <String>[].obs;
  var searchQuery = ''.obs;
  // Stores multiple selected values

  var selectedQualificationfile = Rx<File?>(null);
  var fileName = ''.obs;

  var selectIdentityfile = Rx<File?>(null);
  var IndentityName = ''.obs;
  var imageBytes = Rx<Uint8List?>(null);
  var isUploading = false.obs;
  RxList<clinic.Result> clinicList = <clinic.Result>[].obs;
  RxList<hospital.Result> hospitalList = <hospital.Result>[].obs;
  final RxList<specialtie.Result> specialtiesList = <specialtie.Result>[].obs;

  @override
  void onInit() {
    super.onInit();
    getDrData();
    getSpecialites();
  }

  void setIndex(int value) {
    index.value = value;
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

  var clinicImage = Rx<File>(File(""));
  var profileImage = Rxn<File>(); // Observable profile image

  Future<void> pickImage(ImageSource source, [bool autoUplod = true]) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      profileImage.value = imageFile;
      clinicImage.value = imageFile;

      // Convert image to bytes and upload automatically
      imageBytes.value = await imageFile.readAsBytes();
      if (autoUplod == true) {
        uploadProfilePhoto();
      } // Auto-upload after selection
    }
  }

  Future<void> uploadProfilePhoto() async {
    if (imageBytes.value == null || imageBytes.value!.isEmpty) {
      print("❌ Error: Image bytes are empty");
      return;
    }

    try {
      isUploading.value = true; // Start showing loaderq

      final uri = Uri.parse(
          'https://19u1szcoq1.execute-api.ap-south-1.amazonaws.com/api/users/editProfileV2');
      final request = http.MultipartRequest('PUT', uri);

      // Get Bearer token from AuthProvider
      Rx<String?> token = Get.find<AuthProvider>().token;

      request.headers['Authorization'] = 'Bearer $token';
      request.headers['Content-Type'] = 'multipart/form-data';

      print("✅ Uploading image...");
      print("📂 Image Size: ${imageBytes.value!.length} bytes");

      request.files.add(http.MultipartFile.fromBytes(
        'profileImage', // API key
        imageBytes.value!,
        filename: 'profile_image.jpg',
      ));

      final response = await request.send();
      final responseData = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        print("✅ Upload Success: $responseData");
      } else {
        print(
            "❌ Upload Failed: ${response.statusCode}, Response: $responseData");
      }
    } catch (e) {
      print("❌ Error: $e");
    } finally {
      isUploading.value = false; // Hide loader after upload completes
    }
  }

  void clearImage() {
    profileImage.value = null;
  }

  Future<void> pickFile(String documentType) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null && result.files.single.path != null) {
        File selectedFile = File(result.files.single.path!);

        if (documentType == "qualification") {
          selectedQualificationfile.value = selectedFile;
          fileName.value = result.files.single.name;
        } else if (documentType == "identity") {
          selectIdentityfile.value = selectedFile;
          IndentityName.value = result.files.single.name;
        }

        print("📄 Selected File: ${result.files.single.name}");

        // Automatically Upload the File After Selection
        await uploadDocument(documentType, selectedFile);
      }
    } catch (e) {
      print("❌ Error picking file: $e");
      Get.snackbar("Error", "Failed to pick a file.");
    }
  }

  /// Upload Document with Bearer Token
  Future<void> uploadDocument(String documentType, File file) async {
    try {
      if (file.path.isEmpty) {
        Get.snackbar("Error", "No file selected.");
        print("❌ Error: No file selected");
        return;
      }

      final uri = Uri.parse(
          'https://19u1szcoq1.execute-api.ap-south-1.amazonaws.com/api/users/editProfileV2');
      final request = http.MultipartRequest('PUT', uri);

      // ✅ Fetch Token
      String? token = Get.find<AuthProvider>().token.value;

      if (token == null || token.isEmpty) {
        print("❌ Error: Token is missing");
        Get.snackbar("Error", "Authentication token is missing.");
        return;
      }

      // ✅ Add Headers
      request.headers.addAll({
        'Authorization': 'Bearer $token',
        'Content-Type': 'multipart/form-data',
      });

      print("✅ Uploading file: ${file.path}");

      // ✅ Attach File
      request.files.add(await http.MultipartFile.fromPath(
        'certificate', // API Parameter Key
        file.path,
        filename: file.path.split('/').last,
      ));

      // ✅ Add Document Type
      request.fields['documentType'] = documentType;

      final response = await request.send();
      final responseData = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        print("✅ Upload Success: $responseData");
        Get.snackbar("Success", "File uploaded successfully!");
      } else {
        print(
            "❌ Upload Failed: ${response.statusCode}, Response: $responseData");
        Get.snackbar("Error", "Upload failed: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ Error: $e");
      Get.snackbar("Error", "An unexpected error occurred.");
    }
  }

  void removeFile(String type) {
    if (type == "qualification") {
      selectedQualificationfile.value = null;
      fileName.value = '';
    } else if (type == "identity") {
      selectIdentityfile.value = null;
      IndentityName.value = "";
    }
  }

  void setProfileDetails(DrProfile.Result data) {
    name.text = data.firstName ?? "";
    number.text = data.idealNumber ?? "";
    location.text = data.location ?? "";
    experience.text = data.totalExp?.toString() ?? "";
    selectedSpecialties.value = data.category ?? [];
    // clinicName.text = data. ?? "";
  }

  final custom_id = Get.find<AuthProvider>().customId;
  getDrData() async {
    try {
      final response = await ApiProvider.get(
          '/api/users/getUserCompleteDataV2/$custom_id',
          head: {
            'Content-Type': 'application/json',
          });

      final map = jsonDecode(response.body);
      print("Profile data");
      print(map);
      Drprofile res = Drprofile.fromJson(map);

      if (res.status == 200) {
        dr_data.value = res.result ?? [];

        setProfileDetails(res.result![0]);
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false; // Set loading to false once the data is fetched
    }
  }

  Future<void> getSpecialites() async {
    final response = await ApiProvider.get("/api/list/specialties",
        head: {"Content-Type": "application/json"});
    final map = jsonDecode(response.body);
    specialtie.Specialties res = specialtie.Specialties.fromJson(map);

    if (res.status == 200) {
      specialtiesList.value = res.result ?? [];
    }
  }

  void toggleSpecialty(int id) {
    if (selectedSpecialties.contains(id)) {
      selectedSpecialties.remove(id);
    } else {
      selectedSpecialties.add(id);
    }
  }

  AddClinicImage(dynamic id) async {
    if (clinicImage.value == null) {
      print("❌ No image selected");
      return;
    }

    final response = await ApiProvider.putMultipartWithBytes(
      "/api/clinic/updateClinic",
      fileName: "Locume.jpg",
      fileBytes: await clinicImage.value.readAsBytes(),
      fileKey: "clinicImage",
      headers: {'Authorization': 'Bearer ${Get.find<AuthProvider>().token}'},
      data: {"clinicId": id},
    );

    final responseBody = await response.stream.bytesToString();
    final decodedResponse = jsonDecode(responseBody);

    if (response.statusCode == 200) {
      print("✅ Clinic updated successfully");

      Get.back();
    } else {
      print("❌ Error: ${decodedResponse['message']}");
    }
  }

  getClinicList() async {
    final response = await ApiProvider.get('/api/list/getClinic',
        head: {'content-type': 'application/json'});
    final map = jsonDecode(response.body);
    final res = clinic.ClinicData.fromJson(map);
    if (res.status == 200) {
      clinicList.value = res.result ?? [];
    }
  }

  getHospitalList() async {
    final response = await ApiProvider.get('/api/list/getHospital',
        head: {'content-type': 'application/json'});
    final map = jsonDecode(response.body);
    final res = hospital.HospitalRes.fromJson(map);
    if (res.status == 200) {
      hospitalList.value = res.result ?? [];
    }
  }

  AddClinic() async {
    print("object");
    final response = await ApiProvider.post("/api/clinic/addClinic", head: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Get.find<AuthProvider>().token}'
    }, data: {
      "clinicName": clinicName.text.trim(),
      "clinicTimeSlot": selectedOptions,
      "state": state.text.trim(),
      "city": city.text.trim(),
      "pincode": pincode.text.trim(),
      "about": about.text.trim(),
      "mobileNumber": contactNumber.text.trim(),
      "address": clinicAddress.text.trim(),
    });

    print(response.body);
    final map = jsonDecode(response.body);
    if (response.statusCode == 200) {
      AddClinicImage(map['result']);
    }
  }

  AddHospitalImage(dynamic id) async {
    final response = await ApiProvider.putMultipartWithBytes(
      "/api/hospital/updateHospital",
      fileName: "Hospital.jpg",
      fileBytes: await clinicImage.value.readAsBytes(),
      fileKey: "hospitalImage",
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Get.find<AuthProvider>().token}'
      },
      data: {"hospitalId": id},
    );
    final responseBody = await response.stream.bytesToString();
    final decodedResponse = jsonDecode(responseBody);

    if (response.statusCode == 200) {
      print("✅ Clinic updated successfully");
      Get.back();
    } else {
      print("❌ Error: ${decodedResponse['message']}");
    }
  }

  AddHospital() async {
    print("object");
    final response = await ApiProvider.post("/api/hospital/addHospital", head: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Get.find<AuthProvider>().token}'
    }, data: {
      "hospitalName": clinicName.text.trim(),
      "hospitalTimeSlot": selectedOptions,
      "state": state.text.trim(),
      "city": city.text.trim(),
      "pincode": pincode.text.trim(),
      "about": about.text.trim(),
      "mobileNumber": contactNumber.text.trim(),
      "address": clinicAddress.text.trim(),
    });
    print(response.body);
    final map = jsonDecode(response.body);
    if (response.statusCode == 200) {
      AddHospitalImage(map['result']);
    }
  }

  editProfile() async {
    print(name.text.trim());

    final response = await ApiProvider.put("/api/users/editProfileV2", head: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Get.find<AuthProvider>().token}'
    }, data: {
      "firstName": name.text.trim(),
      "totalExp": experience.text.trim(),
      "location": location.text.trim(),
    });

    print(response.body);
    getDrData();
  }

  editSpecialties(List sp) async {
    print(name.text.trim());

    final response = await ApiProvider.put("/api/users/editProfileV2", head: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Get.find<AuthProvider>().token}'
    }, data: {
      "category": sp
    });
    print(response.body);
    if (response.statusCode == 200) {
      getDrData();
      Get.back();
    }
  }

  List<specialtie.Result> getFilteredSpecialties(String query) {
    if (query.isEmpty) {
      return specialtiesList; // Return all specialties if query is empty
    }

    return specialtiesList.where((specialty) {
      return specialty.specialtiesName
              ?.toLowerCase()
              .contains(query.toLowerCase()) ??
          false;
    }).toList();
  }

  final List<String> weekdays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  final List<String> timeSlots = ['M', 'A', 'E'];

  bool isSlotSelectedForAllDays(String slot) {
    // Check if all weekdays with this slot are selected
    return weekdays.every((day) => selectedOptions.contains("${day}_$slot"));
  }

  void toggleSlotForAllDays(String slot) {
    if (isSlotSelectedForAllDays(slot)) {
      // Remove all for this slot
      weekdays.forEach((day) {
        selectedOptions.remove("${day}_$slot");
      });
    } else {
      // Add all for this slot
      weekdays.forEach((day) {
        selectedOptions.add("${day}_$slot");
      });
    }
  }
}
