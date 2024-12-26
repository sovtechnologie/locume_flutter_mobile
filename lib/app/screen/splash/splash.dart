import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jailbreak_root_detection/jailbreak_root_detection.dart';

import '../../../widget/reusedwidget.dart';

class Splash extends StatelessWidget {
  Splash({super.key}) {
    checkinternet();
    gettoken();
  }
  gettoken() async {
    await FirebaseMessaging.instance.requestPermission();

    // Get the FCM token
    String? token = await FirebaseMessaging.instance.getToken();
    print(token);
  }

  checkinternet() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result && Platform.isAndroid) {
      checkforsafety_android();
    } else if (result && Platform.isIOS) {
      checkforsafety_ios();
    } else {}
  }

  checkforsafety_android() async {
    Get.toNamed('/getstarted');
    // final isRealDevice = await JailbreakRootDetection.instance.isRealDevice;
    // final isJailBroken = await JailbreakRootDetection.instance.isJailBroken;
    // if (isRealDevice == false) {
    //   messagenotifications('device is not a real device', 'open again');
    //   SystemNavigator.pop();
    // } else if (isJailBroken) {
    //   messagenotifications('device cannot be trusted', 'open again');
    //   SystemNavigator.pop();
    // } else if (isRealDevice == true && isJailBroken == false) {
    //   Get.offAndToNamed('/getstarted');
    // } else {
    //   SystemNavigator.pop();
    // }
  }

  checkforsafety_ios() async {
    Get.toNamed('/getstarted');

    // final isJailBroken = await JailbreakRootDetection.instance.isJailBroken;
    // final isRealDevice = await JailbreakRootDetection.instance.isRealDevice;
    // final checkForIssues = await JailbreakRootDetection.instance.checkForIssues;
    //
    // if (checkForIssues.isNotEmpty) {
    //   messagenotifications(
    //       'there are issues with this phone', 'call the support team');
    //   SystemNavigator.pop();
    // } else if (isRealDevice == false) {
    //   messagenotifications('device is not a real device', 'open again');
    //   SystemNavigator.pop();
    // } else if (isJailBroken) {
    //   messagenotifications('device cannot be trusted', 'open again');
    //   SystemNavigator.pop();
    // } else if (isRealDevice == true &&
    //     checkForIssues.isEmpty &&
    //     isJailBroken == false) {
    //   Get.offAndToNamed('/getstarted');
    // } else {
    //   SystemNavigator.pop();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SvgPicture.asset('assets/logo.svg'),
      ),
    );
  }
}
