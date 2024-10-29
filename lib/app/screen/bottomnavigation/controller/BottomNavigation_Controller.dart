import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomnavigationController extends GetxController {
  var currentStep = 0.obs;
  RxBool showBottom = false.obs;
  TextEditingController hospitalname = TextEditingController();
  RxString selectedType = "".obs;
}
