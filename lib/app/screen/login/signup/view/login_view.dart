import 'package:get/get.dart';
import 'package:locume/app/screen/login/signup/controller/login_controller.dart';
import 'package:flutter/material.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [TextFormField(), TextFormField()],
    ));
  }
}
