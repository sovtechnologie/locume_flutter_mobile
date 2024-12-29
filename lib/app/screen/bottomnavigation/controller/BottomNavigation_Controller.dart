import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locume/api/api_provider.dart';
import 'package:locume/app/screen/login/signup/model/specialtie_model.dart'
    as s;
import 'package:locume/app/screen/login/signup/model/category_model.dart' as c;

class BottomnavigationController extends GetxController {
  var currentStep = 0.obs;
  RxBool showBottom = false.obs;
  RxBool isLoading = false.obs;
  TextEditingController hospitalname = TextEditingController();
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
}
