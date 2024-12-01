import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../config.dart';

class SpecialitiesController extends GetxController {
  RxList<Map<dynamic, dynamic>> data = <Map<dynamic, dynamic>>[].obs;
  var config = CONFIG.apiUrl();

  SpecialitiesController() {
    getalllocums();
  }

  getalllocums() async {
    final headers = {
      'Content-Type': 'application/json',
    };
    Uri url = Uri.parse('$config/api/list/specialties'); // Fix double slash
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      if (decodedResponse['result'] != null &&
          decodedResponse['result'] is List) {
        // Use `.assignAll()` to update reactive list
        data.assignAll(
            List<Map<dynamic, dynamic>>.from(decodedResponse['result']));
        print(data);
        print('Data fetched: ${data.length} items');
      } else {
        print('No valid data found.');
      }
    } else {
      print('Error: ${response.statusCode}');
    }
  }
}
