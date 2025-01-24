import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageController extends GetxController {
  var requests = <Map<String, dynamic>>[].obs;

  void loadRequests() {
    // Simulating API data
    requests.value = [
      {
        "hospital": "Apollo International Hospital",
        "address": "Parsik Hill Road, Cbd Belapur, Navi Mumbai",
        "date": "22 Jan 2025 (Saturday)",
        "role": "OPD Nurse",
        "status": "Pending",
      },
      {
        "hospital": "Apollo International Hospital",
        "address": "Parsik Hill Road, Cbd Belapur, Navi Mumbai",
        "date": "22 Jan 2025 (Saturday)",
        "role": "OPD Nurse",
        "status": "Accepted",
      },
      {
        "hospital": "Apollo International Hospital",
        "address": "Parsik Hill Road, Cbd Belapur, Navi Mumbai",
        "date": "22 Jan 2025 (Saturday)",
        "role": "OPD Nurse",
        "status": "Completed",
      },
    ];
  }

  List<Map<String, dynamic>> getFilteredRequests(String status) {
    return requests.where((request) => request['status'] == status).toList();
  }
}
