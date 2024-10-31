import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClinicsController extends GetxController {
  ScrollController scrollController = ScrollController();

// Define `data` as an observable list
  RxList data = <Map<String, String>>[].obs;

  List<Map<String, String>> hospitals = [
    {
      "image": "assets/hospital1.png",
      "name": "City Care Hospital",
      "hospitalspecialty": "Multispeciality",
      "location": "Mumbai, Maharashtra",
      "distance": "2.3 km",
      "doctors": "23 doctors",
      "specialties": "Cardiology, Neurology, Pediatrics",
    },
    {
      "image": "assets/hospital1.png",
      "name": "Metro Health Center",
      "hospitalspecialty": "Orthopedics",
      "location": "Delhi, Delhi",
      "distance": "5.6 km",
      "doctors": "15 doctors",
      "specialties": "Orthopedics, Rheumatology, Physiotherapy",
    },
    {
      "image": "assets/hospital1.png",
      "name": "Green Valley Clinic",
      "hospitalspecialty": "Cardiology",
      "location": "Bangalore, Karnataka",
      "distance": "3.1 km",
      "doctors": "18 doctors",
      "specialties": "Cardiology, Cardiac Surgery",
    },
    {
      "image": "assets/hospital1.png",
      "name": "Sunrise Medical Center",
      "hospitalspecialty": "Oncology",
      "location": "Hyderabad, Telangana",
      "distance": "4.8 km",
      "doctors": "27 doctors",
      "specialties": "Oncology, Radiation Therapy, Chemotherapy",
    },
    {
      "image": "assets/hospital1.png",
      "name": "Wellness Hospital",
      "hospitalspecialty": "Neurology",
      "location": "Chennai, Tamil Nadu",
      "distance": "3.5 km",
      "doctors": "30 doctors",
      "specialties": "Neurology, Neurosurgery",
    },
    {
      "image": "assets/hospital1.png",
      "name": "Wellness Hospital",
      "hospitalspecialty": "Neurology",
      "location": "Chennai, Tamil Nadu",
      "distance": "3.5 km",
      "doctors": "30 doctors",
      "specialties": "Neurology, Neurosurgery",
    },
    {
      "image": "assets/hospital1.png",
      "name": "Wellness Hospital",
      "hospitalspecialty": "Neurology",
      "location": "Chennai, Tamil Nadu",
      "distance": "3.5 km",
      "doctors": "30 doctors",
      "specialties": "Neurology, Neurosurgery",
    },
    {
      "image": "assets/hospital1.png",
      "name": "Wellness Hospital",
      "hospitalspecialty": "Neurology",
      "location": "Chennai, Tamil Nadu",
      "distance": "3.5 km",
      "doctors": "30 doctors",
      "specialties": "Neurology, Neurosurgery",
    },
    {
      "image": "assets/hospital1.png",
      "name": "Wellness Hospital",
      "hospitalspecialty": "Neurology",
      "location": "Chennai, Tamil Nadu",
      "distance": "3.5 km",
      "doctors": "30 doctors",
      "specialties": "Neurology, Neurosurgery",
    },
  ];
}
