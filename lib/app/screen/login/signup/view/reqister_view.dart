import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:locume/app/screen/login/signup/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:locume/widget/custom_button.dart';
import 'package:locume/widget/custom_textField.dart';

class RegisterView extends GetView<LoginController> {
  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "assets/login_bg.png",
              width: double.infinity,
              fit: BoxFit.cover, // Ensure the image covers the entire screen
            ),
            Align(
              alignment: Alignment
                  .bottomCenter, // Align container at the bottom center
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300,
                  ),
                  Container(
                    width: 350, // Full width of the screen
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius:
                          BorderRadius.circular(20), // Optional rounded corners
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Sign up For Account",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomizableField(
                            controller: controller.otpcontroller,
                            heading: "Full Name",
                            hintText: "Your Full Name",
                            keyboardType: TextInputType.name,
                          ),
                          CustomizableField(
                            controller: controller.phonenumber,
                            heading: "Mobile Number",
                            hintText: "Enter mobile number",
                            suffixText:
                                Obx(() => Text(controller.otpButtonText.value)),
                            onSuffixTap: controller.sendOtp,
                            keyboardType: TextInputType.number,
                          ),
                          CustomizableField(
                            controller: controller.otpcontroller,
                            heading: "OTP",
                            hintText: "Enter OTP",
                            keyboardType: TextInputType.number,
                          ),
                          CustomizableField(
                            controller: controller.otpcontroller,
                            heading: "Medical ID",
                            hintText: "Medical ID",
                            keyboardType: TextInputType.number,
                          ),
                          CustomisableButton(text: "Sign Up", onTap: () {}),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                      color: Color.fromRGBO(50, 98, 149, 1),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/login');
                                  },
                                  child: const Text(
                                    " Log in",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
