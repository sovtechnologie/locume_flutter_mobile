import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:locume/api/api_provider.dart';
import 'package:locume/api/auth_provider.dart';
import 'package:locume/app/screen/drprofile/model/drprofile_model.dart'
    as DrProfile;
import 'package:locume/app/screen/drprofile/model/drprofile_model.dart';
import 'package:locume/app/screen/login/signup/model/specialtie_model.dart'
    as specialtie;

class ProfileController extends GetxController {
  var index = 1.obs;
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController clinicName = TextEditingController();
  TextEditingController clinicAddress = TextEditingController();
  TextEditingController hospitalName = TextEditingController();
  TextEditingController hospitalAddress = TextEditingController();
  TextEditingController addeducation = TextEditingController();
  Rx<List<DrProfile.Result>> dr_data = Rx<List<DrProfile.Result>>([]);
  RxBool isLoading = true.obs; // To track loading state
  RxBool addHosiptial = false.obs;
  RxBool addClinic = false.obs;
  RxList selectedSpecialties = [].obs;
  var selectedOptions = <String>[].obs;
  var searchQuery = ''.obs;
  // Stores multiple selected values

  var selectedQualificationfile = Rx<File?>(null);
  var fileName = ''.obs;

  var selectIdentityfile = Rx<File?>(null);
  var IndentityName = ''.obs;

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

  var profileImage = Rxn<File>(); // Observable profile image

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      profileImage.value = File(pickedFile.path);
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
          selectedQualificationfile(selectedFile);
          fileName(result.files.single.name);
        } else if (documentType == "identity") {
          selectIdentityfile(selectedFile);
          IndentityName(result.files.single.name);
        }
      }
    } catch (e) {
      print("Error picking file: $e");
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
    number.text = data.mobileNumber ?? "";
    location.text = data.location ?? "";
    experience.text = data.totalExp?.toString() ?? "";
    selectedSpecialties.value = data.category ?? [];
  }

  final custom_id = Get.find<AuthProvider>().customId;
  getDrData() async {
    try {
      final response = await ApiProvider.get(
          '/api/users/getSingleUserById/$custom_id',
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
}
