import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../../../config.dart';

class HomeControlller extends GetxController {
  var index = 1.obs;
  var currentIndex = 0.obs;

  RxList<Map<dynamic, dynamic>> data = <Map<dynamic, dynamic>>[].obs;
  var config = CONFIG.apiUrl();

  void setIndex(int value) {
    index.value = value;
  }

  HomeControlller() {
    getalllocums();
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
    final headers = {
      'Content-Type': 'application/json',
    };
    Uri url = Uri.parse('$config/api/users/getAllDoctors'); // Fix double slash
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      if (decodedResponse['result'] != null &&
          decodedResponse['result'] is List) {
        // Use `.assignAll()` to update reactive list
        data.assignAll(
            List<Map<dynamic, dynamic>>.from(decodedResponse['result']));
        if (kDebugMode) {
          // print(data);
          print('Data fetched: ${data.length} items');
        }
      } else {
        if (kDebugMode) {
          print('No valid data found.');
        }
      }
    } else {
      if (kDebugMode) {
        print('Error: ${response.statusCode}');
      }
    }
  }
}
