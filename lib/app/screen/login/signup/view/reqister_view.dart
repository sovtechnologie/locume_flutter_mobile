import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locume/Theme/textTheme.dart';
import 'package:locume/Theme/theme.dart';
import 'package:locume/app/screen/login/signup/controller/login_controller.dart';
import 'package:locume/widget/custom_button.dart';
import 'package:locume/widget/custom_textField.dart';
import 'package:locume/widget/reusedwidget.dart';

class RegisterView extends GetView<LoginController> {
  RegisterView({super.key});

  RxBool isChecked = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sign up For Account",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: primaryColor),
                  ),
                ),
                const SizedBox(height: 20),
                NewCustomizableField(
                  controller: controller.fullname,
                  heading: "Full Name",
                  hintText: "Enter Full Name",
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                NewCustomizableField(
                  controller: controller.phonenumber,
                  heading: "Mobile Number",
                  hintText: "Enter mobile number",
                  suffixText: Obx(() => controller.isLoading.value
                      ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(strokeWidth: 1.5),
                        )
                      : Text(
                          controller.otpButtonText.value,
                          style: const TextStyle(
                              color: Color(0xFF0866C6), fontSize: 12),
                        )),
                  onSuffixTap: () {
                    if (controller.isButtonEnabled == true) {
                      controller.userloginotp();
                    }
                  },
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                NewCustomizableField(
                  controller: controller.otpcontroller,
                  heading: "OTP",
                  hintText: "Enter OTP",
                  numbnerlenght: 6,
                  keyboardType: TextInputType.number,
                  suffixText: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Verify OTP',
                      style: TextStyle(color: Color(0xFF0866C6), fontSize: 12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                NewCustomizableField(
                  controller: controller.medicalid,
                  heading: "Medical ID",
                  hintText: "Medical ID",
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                Obx(() => Row(
                      children: [
                        Checkbox(
                          value: isChecked.value,
                          onChanged: (value) {
                            isChecked.value = value ?? false;
                          },
                        ),
                        const Expanded(
                          child: Text(
                            "I accept all terms and condition",
                            style: const TextStyle(
                              color: Color(0xFF0866C6),
                              fontSize: 14,
                              // fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    )),
                const SizedBox(height: 20),
                CustomisableButton(
                  text: "Sign Up",
                  onTap: () async {
                    if (isChecked.value) {
                      await controller.register();
                      await controller.registerUser();
                    } else {
                      Get.snackbar(
                        "Error",
                        "Please accept the terms and conditions.",
                        backgroundColor: Colors.redAccent,
                        colorText: Colors.white,
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Color(0xFF0866C6),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
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
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:locume/app/screen/login/signup/controller/login_controller.dart';
// import 'package:locume/widget/custom_button.dart';
// import 'package:locume/widget/custom_dropdown.dart';
// import 'package:locume/widget/custom_textField.dart';

// class RegisterView extends GetView<LoginController> {
//   RegisterView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController _shiftController = TextEditingController();
//     final TextEditingController specialties = TextEditingController();
//     final TextEditingController genderController = TextEditingController();

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             Image.asset(
//               "assets/login_bg.png",
//               width: double.infinity,
//               fit: BoxFit.cover, // Ensure the image covers the entire screen
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 300,
//                   ),
//                   Container(
//                     width: 350,
//                     decoration: BoxDecoration(
//                       color: const Color.fromRGBO(255, 255, 255, 1),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             "Register As Locum",
//                             style: TextStyle(
//                                 color: Colors.blue,
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.w700),
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           CustomizableField(
//                             controller: controller.fullname,
//                             heading: "Full Name",
//                             hintText: "Your full name",
//                             keyboardType: TextInputType.name,
//                           ),
//                           // CustomizableField(
//                           //   controller: controller.lastname,
//                           //   heading: "Last Name",
//                           //   hintText: "Your last name",
//                           //   keyboardType: TextInputType.name,
//                           // ),
//                           CustomizableField(
//                             controller: controller.phonenumber,
//                             heading: "Mobile Number",
//                             hintText: "Enter mobile number",
//                             suffixText: Obx(() => controller.isLoading.value
//                                 ? CircularProgressIndicator()
//                                 : Text(controller.otpButtonText.value)),
//                             onSuffixTap: () {
//                               if (controller.isButtonEnabled == true) {
//                                 controller.sendOtp();
//                               }
//                             },
//                             keyboardType: TextInputType.number,
//                           ),
//                           Obx(() {
//                             if (controller.errorMessage.isNotEmpty) {
//                               return Text(
//                                 controller.errorMessage.value,
//                                 style: TextStyle(color: Colors.red),
//                               );
//                             }
//                             return SizedBox
//                                 .shrink(); // Empty widget if no error message
//                           }),
//                           Obx(() {
//                             return CustomizableField(
//                               controller: controller.otpcontroller,
//                               heading: "OTP",
//                               hintText: "Enter OTP",
//                               keyboardType: TextInputType.number,
//                               suffixText: controller.verifyotp.value
//                                   ? Icon(
//                                       Icons.verified,
//                                       color: Colors.green,
//                                     )
//                                   : Text("Verify OTP"),
//                               onSuffixTap: () {
//                                 controller.verifyOTP();
//                               },
//                             );
//                           }),
//                           // CustomizableField(
//                           //   controller: controller.medicalid,
//                           //   heading: "Medical ID",
//                           //   hintText: "Medical ID",
//                           //   keyboardType: TextInputType.number,
//                           // ),
//                           Obx(() {
//                             return SingleSelectionDropdown(
//                               heading: "State",
//                               options: controller.statedata.value
//                                   .where((state) =>
//                                       state?.name !=
//                                       null) // Ensure non-null states
//                                   .map((state) => state!.name!) // Map safely
//                                   .toList(),
//                               controller: controller.state,
//                               onChanged: (value) {
//                                 controller.state.text = value ?? "";

//                                 if (value == null || value.isEmpty) {
//                                   print("No state selected");
//                                   controller.citydata.value =
//                                       []; // ✅ Clear city list
//                                   controller.city
//                                       .clear(); // ✅ Clear selected city name
//                                   return;
//                                 }

//                                 print("Selected State Name: $value");

//                                 // Find the selected state
//                                 final selectedState = controller.statedata.value
//                                     .where((state) => state?.name == value)
//                                     .toList()
//                                     .firstOrNull;

//                                 if (selectedState == null) {
//                                   print("No matching state found!");
//                                   controller.citydata.value =
//                                       []; // ✅ Clear city list
//                                   controller.city
//                                       .clear(); // ✅ Clear selected city name
//                                   return;
//                                 }

//                                 String isoCode = selectedState.isoCode ?? "";
//                                 print("ISO Code: $isoCode");

//                                 // ✅ Clear city list before fetching new data
//                                 controller.citydata.value = [];
//                                 controller.city.clear();

//                                 controller.getallcity(
//                                     isoCode); // Fetch cities for selected state
//                               },
//                             );
//                           }),

//                           Obx(() {
//                             return SingleSelectionDropdown(
//                               heading: "City",
//                               options: controller.citydata.value
//                                   .map((city) => city?.name ?? "")
//                                   .toList(),
//                               controller: controller.city,
//                               enabled: controller.citydata.value
//                                   .isNotEmpty, // Disable if no cities
//                               onChanged: (value) {
//                                 controller.city.text = value ?? "";
//                               },
//                             );
//                           }),
// // CustomDropdown(
//                           //   heading: "Availability",
//                           //   options: controller.availability,
//                           //   selectedValues: controller.selectedavailability,
//                           //   controller: _shiftController,
//                           // ),
//                           // Obx(() {
//                           //   if (controller.specialtiesList.isEmpty) {
//                           //     return Center(child: CircularProgressIndicator());
//                           //   }

//                           //   return CustomDropdown(
//                           //     heading: "Specialties",
//                           //     options: controller.getSpecialtyNames(),
//                           //     selectedValues: controller.selectedSpecialty,
//                           //     controller: specialties,
//                           //   );
//                           // }),
//                           SingleSelectionDropdown(
//                             heading: "Gender",
//                             options: ["Male", "Female"],
//                             controller: genderController,
//                             onChanged: (value) {
//                               controller.gender.value = value!;
//                             },
//                           ),
//                           // CustomizableField(
//                           //   controller: controller.rate,
//                           //   heading: "Rate/Hourly",
//                           //   hintText: "Rate/Hourly",
//                           //   keyboardType: TextInputType.number,
//                           // ),
//                           CustomisableButton(
//                               text: "Sign Up",
//                               onTap: () async {
//                                 await controller.register();
//                                 await controller.registerUser();
//                               }),
//                           Padding(
//                             padding: EdgeInsets.symmetric(vertical: 10),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Text(
//                                   "Already have an account?",
//                                   style: TextStyle(
//                                       color: Color.fromRGBO(50, 98, 149, 1),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                                 GestureDetector(
//                                   onTap: () {
//                                     Get.toNamed('/login');
//                                   },
//                                   child: const Text(
//                                     " Log in",
//                                     style: TextStyle(
//                                         color: Colors.red,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
