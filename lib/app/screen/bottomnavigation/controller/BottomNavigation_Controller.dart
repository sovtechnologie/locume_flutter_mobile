import 'dart:convert';

import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locume/Theme/theme.dart';
import 'package:locume/api/api_provider.dart';
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
  TextEditingController hospitalname = TextEditingController();
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();

  RxString selectedType = "".obs;
  RxString category = "".obs;
  RxString shift = "".obs;
  RxString minRate = "".obs;
  RxString maxRate = "".obs;
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

  Future<void> requestLocum() async {
    isLoading.value = true;
    print(hospitalname.text);
    print(minRate);
    print(maxRate);
    print(category);
    print(shift);
    print(selectedType);
    final response = await ApiProvider.post("/users/sendNotification", head: {
      "Content-Type": "application/json"
    }, data: {
      "name": hospitalname.text.trim(),
      "rateRange1": minRate,
      "rateRage2": maxRate,
      "specifiedCategory": category,
      "shift": shift,
      "type": selectedType,
      "startDate": null,
      "endDate": null
    });

    print(response.body);
    if (response.statusCode == 200) {
      isLoading.value = false;
      showBottom.value = false;
    }
  }

  Future<void> selectDateRange(BuildContext context) async {
    showCustomDateRangePicker(
      context,
      dismissible: true,
      minimumDate: DateTime.now(),
      maximumDate: DateTime(2100),
      onApplyClick: (start, end) {
        startDate.text = DateFormat('dd-MM-yyyy').format(start);
        endDate.text = DateFormat('dd-MM-yyyy').format(end);
        update(); // Notify UI to update in GetX
      },
      onCancelClick: () {},
      backgroundColor: Colors.white,
      primaryColor: primaryColor,
    );
  }
}
