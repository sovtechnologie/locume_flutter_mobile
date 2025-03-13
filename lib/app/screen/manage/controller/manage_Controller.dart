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
    getRequestRaised();
  }

  RxList<raisedreq.Result> raisedrequest = <raisedreq.Result>[].obs;

  Future<void> getRequestRaised() async {
    print("object");
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

        print("API Response: $map");

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

  // Future<void> getRequestResponded(int specialtyId) async {
  //   print("response");
  //   try {
  //     final response = await ApiProvider.post(
  //       "/api/filter/specialtiesFilters",
  //       data: {"specialtyId": specialtyId},
  //       head: {"Content-Type": "application/json"},
  //     );

  //     final map = jsonDecode(response.body);
  //     specialdoctors.SpecialtiesDoctors res =
  //         specialdoctors.SpecialtiesDoctors.fromJson(map);

  //     if (res.status == 200) {
  //       spedr.value = res.result ?? [];
  //     } else {
  //       spedr.clear();
  //     }
  //     print(res);
  //   } catch (e) {
  //     print("Error fetching special doctors: $e");
  //   }
  // }
}
