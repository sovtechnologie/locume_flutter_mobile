import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:locume/Theme/textTheme.dart';
import 'package:locume/app/screen/login/signup/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:locume/widget/custom_button.dart';
import 'package:locume/widget/custom_textField.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});

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
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(20), // Optional rounded corners
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset("assets/waving-hand.svg"),
                          Text(
                            "Welcome back!",
                            style: MyTextTheme.poppinsHeadline(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const Text("Please login to access your account."),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomizableField(
                            controller: controller.phonenumber,
                            heading: "Mobile Number",
                            hintText: "Enter mobile number",
                            suffixText: Obx(() => controller.isLoading.value
                                ? CircularProgressIndicator()
                                : Text(controller.otpButtonText.value)),
                            onSuffixTap: () {
                              if (controller.isButtonEnabled == true) {
                                controller.userloginotp();
                              }
                            },
                            keyboardType: TextInputType.number,
                          ),
                          CustomizableField(
                            controller: controller.otpcontroller,
                            heading: "OTP",
                            hintText: "Enter OTP",
                            keyboardType: TextInputType.number,
                          ),
                          CustomisableButton(
                              text: "Log in",
                              onTap: () {
                                controller.userLogin();
                              }),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                      color: Color.fromRGBO(50, 98, 149, 1),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print("object");
                                    Get.toNamed('/signup');
                                  },
                                  child: const Text(
                                    " Register Now",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
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
