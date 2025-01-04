// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class HospitalController extends GetxController {
//   ScrollController scrollController = ScrollController();
//
// // Define `data` as an observable list
//   RxList data = <Map<String, String>>[].obs;
//
//   List<Map<String, String>> hospitals = [
//     {
//       "image": "assets/hospital1.png",
//       "name": "City Care Hospital",
//       "hospitalspecialty": "Multispeciality",
//       "location": "Mumbai, Maharashtra",
//       "distance": "2.3 km",
//       "doctors": "23 doctors",
//       "specialties": "Cardiology, Neurology, Pediatrics",
//     },
//     {
//       "image": "assets/hospital1.png",
//       "name": "Metro Health Center",
//       "hospitalspecialty": "Orthopedics",
//       "location": "Delhi, Delhi",
//       "distance": "5.6 km",
//       "doctors": "15 doctors",
//       "specialties": "Orthopedics, Rheumatology, Physiotherapy",
//     },
//     {
//       "image": "assets/hospital1.png",
//       "name": "Green Valley Clinic",
//       "hospitalspecialty": "Cardiology",
//       "location": "Bangalore, Karnataka",
//       "distance": "3.1 km",
//       "doctors": "18 doctors",
//       "specialties": "Cardiology, Cardiac Surgery",
//     },
//     {
//       "image": "assets/hospital1.png",
//       "name": "Sunrise Medical Center",
//       "hospitalspecialty": "Oncology",
//       "location": "Hyderabad, Telangana",
//       "distance": "4.8 km",
//       "doctors": "27 doctors",
//       "specialties": "Oncology, Radiation Therapy, Chemotherapy",
//     },
//     {
//       "image": "assets/hospital1.png",
//       "name": "Wellness Hospital",
//       "hospitalspecialty": "Neurology",
//       "location": "Chennai, Tamil Nadu",
//       "distance": "3.5 km",
//       "doctors": "30 doctors",
//       "specialties": "Neurology, Neurosurgery",
//     },
//     {
//       "image": "assets/hospital1.png",
//       "name": "Wellness Hospital",
//       "hospitalspecialty": "Neurology",
//       "location": "Chennai, Tamil Nadu",
//       "distance": "3.5 km",
//       "doctors": "30 doctors",
//       "specialties": "Neurology, Neurosurgery",
//     },
//     {
//       "image": "assets/hospital1.png",
//       "name": "Wellness Hospital",
//       "hospitalspecialty": "Neurology",
//       "location": "Chennai, Tamil Nadu",
//       "distance": "3.5 km",
//       "doctors": "30 doctors",
//       "specialties": "Neurology, Neurosurgery",
//     },
//     {
//       "image": "assets/hospital1.png",
//       "name": "Wellness Hospital",
//       "hospitalspecialty": "Neurology",
//       "location": "Chennai, Tamil Nadu",
//       "distance": "3.5 km",
//       "doctors": "30 doctors",
//       "specialties": "Neurology, Neurosurgery",
//     },
//     {
//       "image": "assets/hospital1.png",
//       "name": "Wellness Hospital",
//       "hospitalspecialty": "Neurology",
//       "location": "Chennai, Tamil Nadu",
//       "distance": "3.5 km",
//       "doctors": "30 doctors",
//       "specialties": "Neurology, Neurosurgery",
//     },
//   ];
// }

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../config.dart';

class HospitalController extends GetxController {
  ScrollController scrollController = ScrollController();

  RxList<Map<dynamic, dynamic>> data = <Map<dynamic, dynamic>>[].obs;
  var config = CONFIG.apiUrl();

  HospitalController() {
    getallhospitals();
  }

  getallhospitals() async {
    final headers = {
      'Content-Type': 'application/json',
    };
    Uri url = Uri.parse('$config/api/list/getHospital'); // Fix double slash
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      if (decodedResponse['result'] != null &&
          decodedResponse['result'] is List) {
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
