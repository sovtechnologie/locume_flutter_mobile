import 'dart:convert';

import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locume/Theme/theme.dart';
import 'package:locume/api/api_provider.dart';
import 'package:locume/app/screen/bottomnavigation/model/DropDown_res.dart'
    as allCH;
import 'package:locume/app/screen/login/signup/model/specialtie_model.dart'
    as s;
import 'package:locume/app/screen/login/signup/model/category_model.dart' as c;

import '../../../../api/auth_provider.dart';

import 'package:intl/intl.dart';

class BottomnavigationController extends GetxController {
  final firstName = Get.find<AuthProvider>().getUser?.firstName;
  final lastName = Get.find<AuthProvider>().getUser?.lastName;
  final profileimage = Get.find<AuthProvider>().user.value?.user?.profileImage;

  var currentStep = 0.obs;
  RxBool showBottom = false.obs;
  RxBool isLoading = false.obs;
  RxInt selectedid = 0.obs;
  RxInt isHospitalorClinic = 0.obs;
  TextEditingController hospitalname = TextEditingController();
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();

  RxString selectedType = "".obs;
  RxInt category = 0.obs;
  RxString shift = "".obs;
  RxInt minRate = 0.obs;
  RxInt maxRate = 0.obs;
  RxList<String> allName = <String>[].obs;
  RxList<allCH.Result> dropDownList = <allCH.Result>[].obs;
  final RxList<s.Result> specialtiesList = <s.Result>[].obs;

  final RxList<c.Result> categoryList = <c.Result>[].obs;
  @override
  void onInit() {
    super.onInit();
    getCatgory();
  }

  Future<void> getSpecialites() async {
    final response = await ApiProvider.get("/api/list/specialties",
        head: {"Content-Type": "application/json"});
    final map = jsonDecode(response.body);
    s.Specialties res = s.Specialties.fromJson(map);

    if (res.status == 200) {
      specialtiesList.value = res.result ?? [];
    }
  }

  Future<void> getCatgory() async {
    final response = await ApiProvider.get("/api/list/category",
        head: {"Content-Type": "application/json"});
    final map = jsonDecode(response.body);
    c.CategoryModel res = c.CategoryModel.fromJson(map);

    if (res.status == 200) {
      categoryList.value = res.result ?? [];
    }
  }

  Future<void> getDropDownList() async {
    final response =
        await ApiProvider.get("/api/bookings/getDropDownList", head: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer ${Get.find<AuthProvider>().token}'
    });
    final map = jsonDecode(response.body);
    allCH.DropDownRes res = allCH.DropDownRes.fromJson(map);
    if (res.status == 200) {
      dropDownList.value = res.result ?? [];
      allName.value = dropDownList.map((e) => e.name!).toList();
    }
  }

  Future<void> requestLocum() async {
    isLoading.value = true;

    final response = await ApiProvider.post("/api/bookings/addbookings", head: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer ${Get.find<AuthProvider>().token}'
    }, data: {
      "name": hospitalname.value.text.trim(),
      "rateRange1": minRate.value,
      "rateRage2": maxRate.value,
      "specifiedCategory": [category.value],
      "shift": shift.value,
      "hospital_clinic_id": selectedid.value,
      "is_hospital_or_clinic": isHospitalorClinic.value,
      "type": (selectedType.value == "Schedule") ? 0 : 1,
      "startDate": startDate.value.text,
      "endDate": endDate.value.text
    });

    print(response.body);

    if (response.statusCode == 200) {
      isLoading.value = false;
      showBottom.value = false;

      // Clear all input fields
      hospitalname.clear();
      minRate.value = 0;
      maxRate.value = 0;
      category.value = 0;
      shift.value = "";
      selectedid.value = 0;
      isHospitalorClinic.value = 0;
      selectedType.value = "";
      startDate.clear();
      endDate.clear();

      // Optionally update the UI
      isLoading.refresh();
    }
  }

  Future<void> selectDateRange(BuildContext context) async {
    showCustomDateRangePicker(
      context,
      dismissible: true,
      minimumDate: DateTime.now(),
      maximumDate: DateTime(2100),
      onApplyClick: (start, end) {
        // Get the current time and apply it to selected dates
        DateTime now = DateTime.now();

        DateTime startWithTime = DateTime(start.year, start.month, start.day,
            now.hour, now.minute, now.second, now.millisecond);

        DateTime endWithTime = DateTime(end.year, end.month, end.day, now.hour,
            now.minute, now.second, now.millisecond);

        // Format with full date & time
        startDate.text =
            DateFormat('yyyy-MM-dd HH:mm:ss.SSS').format(startWithTime);
        endDate.text =
            DateFormat('yyyy-MM-dd HH:mm:ss.SSS').format(endWithTime);

        update(); // Notify UI to update in GetX
      },
      onCancelClick: () {},
      backgroundColor: Colors.white,
      primaryColor: primaryColor,
    );
  }
}
