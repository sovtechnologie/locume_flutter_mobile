import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocumController extends GetxController {
  var index = 1.obs;

  void setIndex(int value) {
    index.value = value;
  }

  ScrollController scrollController = ScrollController();

  // Define `data` as an observable list
  RxList data = <Map<String, String>>[].obs;

  List<Map<String, String>> dummyData = [
    {
      "image": "assets/doctor1.png",
      "name": "Alice Johnson",
      "md": "MD",
      "work": "Cardiologist",
      "experience": "10 years",
      "location": "New York, NY"
    },
    {
      "image": "assets/doctor1.png",
      "name": "Bob Smith",
      "md": "MD",
      "work": "Neurologist",
      "experience": "12 years",
      "location": "Los Angeles, CA"
    },
    {
      "image": "assets/doctor1.png",
      "name": "Charlie Brown",
      "md": "MD",
      "work": "Orthopedic Surgeon",
      "experience": "8 years",
      "location": "Chicago, IL"
    },
    {
      "image": "assets/doctor1.png",
      "name": "Daisy Miller",
      "md": "MD",
      "work": "Pediatrician",
      "experience": "7 years",
      "location": "Houston, TX"
    },
    {
      "image": "assets/doctor1.png",
      "name": "Edward Wilson",
      "md": "MD",
      "work": "Dermatologist",
      "experience": "5 years",
      "location": "Phoenix, AZ"
    },
    {
      "image": "assets/doctor1.png",
      "name": "Fiona Davis",
      "md": "MD",
      "work": "Oncologist",
      "experience": "11 years",
      "location": "Philadelphia, PA"
    },
    {
      "image": "assets/doctor1.png",
      "name": "George Harris",
      "md": "MD",
      "work": "General Practitioner",
      "experience": "6 years",
      "location": "San Antonio, TX"
    },
    {
      "image": "assets/doctor1.png",
      "name": "Hannah Lee",
      "md": "MD",
      "work": "Psychiatrist",
      "experience": "9 years",
      "location": "San Diego, CA"
    },
    {
      "image": "assets/doctor1.png",
      "name": "Ian Clark",
      "md": "MD",
      "work": "Endocrinologist",
      "experience": "4 years",
      "location": "Dallas, TX"
    },
    {
      "image": "assets/doctor1.png",
      "name": "Julia Scott",
      "md": "MD",
      "work": "Gynecologist",
      "experience": "15 years",
      "location": "San Jose, CA"
    }
  ];

  LocumController() {
    Future.delayed(const Duration(seconds: 4), () {
      data.assignAll(dummyData); // Assigns all items to the observable list
    });
  }
}
