import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../../../config.dart';

class HomeControlller extends GetxController {
  var index = 1.obs;

  RxList<Map<dynamic, dynamic>> data = <Map<dynamic, dynamic>>[].obs;
  var config = CONFIG.apiUrl();

  void setIndex(int value) {
    index.value = value;
  }

  HomeControlller() {
    getalllocums();
  }

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
        data.assignAll(List<Map<dynamic, dynamic>>.from(decodedResponse['result']));
        if (kDebugMode) {
          print(data);
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
