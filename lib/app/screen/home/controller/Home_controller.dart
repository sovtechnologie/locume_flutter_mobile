import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:locume/api/api_provider.dart';
import 'package:locume/api/auth_provider.dart';
import 'package:locume/app/screen/home/model/request_model.dart' as req;
import 'package:locume/app/screen/locums/model/locum_model.dart' as locum;
import '../../../../config.dart';

class HomeControlller extends GetxController {
  var index = 1.obs;
  var currentIndex = 0.obs;
  // RxList<locum.Result> data = <locum.Result>[].obs;
  RxList<locum.Result> data = RxList<locum.Result>([]);
  RxList<req.Result> request_data = RxList<req.Result>([]);
  var config = CONFIG.apiUrl();
  var isLoading = true.obs;

  void setIndex(int value) {
    index.value = value;
  }

  HomeControlller() {
    getalllocums();
    getRequest();
  }
  Future<void> getRequest() async {
    try {
      isLoading.value = true; // Show loader before API call

      final response = await ApiProvider.get(
        "/api/bookings/getBookingHomePage",
        head: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${Get.find<AuthProvider>().token}',
        },
      );

      final map = jsonDecode(response.body);
      final res = req.RequestRes.fromJson(map);

      if (res.status == 200) {
        request_data.value.assignAll(res.result ?? []);
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false; // Hide loader after API response
    }
  }

  final List<Map<String, dynamic>> carouselItems = [
    {
      "text": "Apollo international hospital",
      "date": "22-24 Jan 2025 (Sat-Mon)",
      "price": "₹100/hour"
    },
    {
      "text": "Apollo international hospital",
      "date": "22-24 Jan 2025 (Sat-Mon)",
      "price": "₹100/hour"
    },
    {
      "text": "Apollo international hospital",
      "date": "22-24 Jan 2025 (Sat-Mon)",
      "price": "₹100/hour"
    },
    {
      "text": "Apollo international hospital",
      "date": "22-24 Jan 2025 (Sat-Mon)",
      "price": "₹100/hour"
    },
  ];
  getalllocums() async {
    final response = await ApiProvider.get('/api/users/getAllDoctors',
        head: {'content-type': 'application/json'});
    final map = jsonDecode(response.body);
    final res = locum.LocumRes.fromJson(map);
    if (res.status == 200) {
      data.value = res.result ?? [];
      print(data);
    }
  }
}
