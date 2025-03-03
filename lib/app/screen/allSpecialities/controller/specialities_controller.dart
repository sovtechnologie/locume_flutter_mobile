import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:locume/api/api_provider.dart';
import '../../../../config.dart';
import 'package:locume/app/screen/login/signup/model/specialtie_model.dart'
    as specialtie;

class SpecialitiesController extends GetxController {
  final RxList<specialtie.Result> specialtiesList = <specialtie.Result>[].obs;

  @override
  void onInit() {
    super.onInit();
    getSpecialites();
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
}
