import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class Splash extends StatelessWidget {
  Splash({super.key}) {
    checkinternet();
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
    // final isRealDevice = await JailbreakRootDetection.instance.isRealDevice;
    // final isJailBroken = await JailbreakRootDetection.instance.isJailBroken;
    // if (isRealDevice == false) {
    //   messagenotifications('device is not a real device', 'open again');
    //   SystemNavigator.pop();
    // } else if (isJailBroken) {
    //   messagenotifications('device cannot be trusted', 'open again');
    //   SystemNavigator.pop();
    // } else if (isRealDevice == true && isJailBroken == false) {
    //   loginpriority();
    // } else {
    //   SystemNavigator.pop();
    // }
  }

  checkforsafety_ios() async {
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
    //   navigatetohome();
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