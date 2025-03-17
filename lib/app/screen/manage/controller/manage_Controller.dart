import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locume/api/api_provider.dart';
import 'package:locume/api/auth_provider.dart';
import 'package:locume/app/screen/manage/model/RequestRaised_model.dart'
    as raisedreq;
import 'package:locume/app/screen/manage/model/RequestRespond_model.dart'
    as respondedreq;

class ManageController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    getRequestRaised();
    getRequestResponded();
  }

  RxList<raisedreq.Result> raisedrequest = <raisedreq.Result>[].obs;
  RxList<respondedreq.Result> respondedrequest = <respondedreq.Result>[].obs;
  Future<void> getRequestRaised() async {
    try {
      final response = await ApiProvider.get(
        "/api/bookings/getActiveBookingData",
        head: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${Get.find<AuthProvider>().token}'
        },
      );

      if (response.statusCode == 200) {
        final map = jsonDecode(response.body);
        raisedreq.RequestRaised res = raisedreq.RequestRaised.fromJson(map);

        if (res.status == 200 && res.result != null) {
          raisedrequest.value = res.result!;
        } else {
          raisedrequest.clear();
        }
        print("Parsed Data: ${raisedrequest.length} items");
      } else {
        print("API Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching request raised: $e");
    }
  }

  Future<void> getRequestResponded() async {
    try {
      final response = await ApiProvider.get(
        "/api/bookings/getAppliedBookingData",
        head: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${Get.find<AuthProvider>().token}'
        },
      );

      if (response.statusCode == 200) {
        final map = jsonDecode(response.body);
        print(map);
        respondedreq.RequestRespondedRes res =
            respondedreq.RequestRespondedRes.fromJson(map);

        if (res.status == 200 && res.result != null) {
          respondedrequest.value = res.result!;
        } else {
          respondedrequest.clear();
        }
        print("Parsed Data: ${respondedrequest.length} items");
      } else {
        print("API Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching request raised: $e");
    }
  }
}
