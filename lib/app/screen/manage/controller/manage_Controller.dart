import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locume/api/api_provider.dart';
import 'package:locume/api/auth_provider.dart';
import 'package:locume/app/screen/manage/model/RequestRaised_model.dart'
    as raisedreq;

class ManageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    print("ManageController initialized"); // ✅ Debugging print
    getRequestRaised(); // ✅ Ensure this is being called
  }

  RxList<raisedreq.Result> raisedrequest = <raisedreq.Result>[].obs;
  Future<void> getRequestRaised() async {
    print("Calling API...");
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
}
