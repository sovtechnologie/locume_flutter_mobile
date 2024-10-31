import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HospitalController extends GetxController {
  ScrollController scrollController = ScrollController();

// Define `data` as an observable list
  RxList data = <Map<String, String>>[].obs;

  List<Map<String, String>> dummyData = [
    {
      "image": "assets/hospital1.png",
      "name": "Greenwood Medical Center",
      "location": "New York, NY",
      "distance": "2 miles"
    },
    {
      "image": "assets/hospital1.png",
      "name": "Sunset Valley Hospital",
      "location": "Los Angeles, CA",
      "distance": "5 miles"
    },
    {
      "image": "assets/hospital1.png",
      "name": "Lakeview Medical Facility",
      "location": "Chicago, IL",
      "distance": "3 miles"
    },
    {
      "image": "assets/hospital1.png",
      "name": "Starlight Children's Hospital",
      "location": "Houston, TX",
      "distance": "7 miles"
    },
    {
      "image": "assets/hospital1.png",
      "name": "Desert Springs Hospital",
      "location": "Phoenix, AZ",
      "distance": "1 mile"
    },
    {
      "image": "assets/hospital1.png",
      "name": "Riverbend Health Center",
      "location": "Philadelphia, PA",
      "distance": "8 miles"
    },
    {
      "image": "assets/hospital1.png",
      "name": "Hillcrest Hospital",
      "location": "San Antonio, TX",
      "distance": "10 miles"
    },
    {
      "image": "assets/hospital1.png",
      "name": "Seaside Medical Institute",
      "location": "San Diego, CA",
      "distance": "12 miles"
    },
    {
      "image": "assets/hospital1.png",
      "name": "Springfield Health Clinic",
      "location": "Dallas, TX",
      "distance": "4 miles"
    },
    {
      "image": "assets/hospital1.png",
      "name": "Bayview Hospital",
      "location": "San Jose, CA",
      "distance": "15 miles"
    }
  ];

  HospitalController() {
    Future.delayed(const Duration(seconds: 4), () {
      data.assignAll(dummyData); // Assigns all items to the observable list
    });
  }
}
