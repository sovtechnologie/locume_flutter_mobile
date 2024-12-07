import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locume/app/screen/login/signup/controller/login_controller.dart';
import 'package:locume/widget/custom_button.dart';
import 'package:locume/widget/custom_dropdown.dart';
import 'package:locume/widget/custom_textField.dart';

class RegisterView extends GetView<LoginController> {
  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _shiftController = TextEditingController();
    final TextEditingController specialties = TextEditingController();

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
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300,
                  ),
                  Container(
                    width: 350,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Register As Locum",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomizableField(
                            controller: controller.firstname,
                            heading: "First Name",
                            hintText: "Your first name",
                            keyboardType: TextInputType.name,
                          ),
                          CustomizableField(
                            controller: controller.lastname,
                            heading: "Last Name",
                            hintText: "Your last name",
                            keyboardType: TextInputType.name,
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
                                controller.sendOtp();
                              }
                            },
                            keyboardType: TextInputType.number,
                          ),
                          Obx(() {
                            if (controller.errorMessage.isNotEmpty) {
                              return Text(
                                controller.errorMessage.value,
                                style: TextStyle(color: Colors.red),
                              );
                            }
                            return SizedBox
                                .shrink(); // Empty widget if no error message
                          }),
                          CustomizableField(
                            controller: controller.otpcontroller,
                            heading: "OTP",
                            hintText: "Enter OTP",
                            keyboardType: TextInputType.number,
                            suffixText: Text("Verify OTP"),
                            onSuffixTap: () {},
                          ),
                          CustomizableField(
                            controller: controller.medicalid,
                            heading: "Medical ID",
                            hintText: "Medical ID",
                            keyboardType: TextInputType.number,
                          ),
                          CustomDropdown(
                            heading: "Availability",
                            options: controller.availability,
                            selectedValues: controller.selectedavailability,
                            controller: _shiftController,
                          ),
                          Obx(() {
                            if (controller.specialtiesList.isEmpty) {
                              return Center(child: CircularProgressIndicator());
                            }

                            return CustomDropdown(
                              heading: "Specialties",
                              options: controller.getSpecialtyNames(),
                              selectedValues: controller.selectedSpecialty,
                              controller: specialties,
                            );
                          }),
                          CustomisableButton(
                              text: "Sign Up",
                              onTap: () async {
                                await controller.register();
                                Get.toNamed('/home');
                              }),
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
