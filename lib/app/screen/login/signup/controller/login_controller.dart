import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController phonenumber = TextEditingController();
  TextEditingController otpcontroller = TextEditingController();

  final RxString otpButtonText = 'Send OTP'.obs; // Initialize with 'Send OTP'
  final RxBool isButtonEnabled = true.obs; // Initially enabled

  Timer? _timer;
  int _remainingTime = 15;

  void startOtpTimer() {
    isButtonEnabled.value = false;
    otpButtonText.value = 'Resend OTP in $_remainingTime s';

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        _remainingTime--;
        otpButtonText.value = 'Resend OTP in $_remainingTime s';
      } else {
        _timer?.cancel();
        _remainingTime = 15;
        isButtonEnabled.value = true;
        otpButtonText.value = 'Resend OTP';
      }
    });
  }

  void sendOtp() {
    if (phonenumber.text.isEmpty) {
      Get.snackbar("Error", "Please enter a phone number",
          snackPosition: SnackPosition.TOP);
      return; // Stop execution if the phone number is empty
    }
    startOtpTimer();
    // Add code to send OTP here
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
