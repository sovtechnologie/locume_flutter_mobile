import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:locume/api/api_provider.dart';
import '../../../../config.dart';
import 'package:locume/app/screen/locums/model/locum_model.dart' as locum;

class LocumController extends GetxController {
  ScrollController scrollController = ScrollController();

  Rx<List<locum.Result>> data = Rx<List<locum.Result>>([]);
  var config = CONFIG.apiUrl();

  LocumController() {
    getalllocums();
  }

  getalllocums() async {
    final response = await ApiProvider.get('/api/users/getAllDoctors',
        head: {'content-type': 'application/json'});
    final map = jsonDecode(response.body);
    final res = locum.LocumRes.fromJson(map);
    if (res.status == 200) {
      data.value = res.result ?? [];
    }
  }
}
