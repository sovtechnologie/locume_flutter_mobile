import 'dart:io';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:locume/Theme/theme.dart';
import 'package:locume/app/screen/profile/controller/Profile_Controller.dart';
import 'package:flutter/material.dart';
import 'package:locume/app/screen/profile/view/AddSpecialities.dart';
import 'package:locume/widget/reusedwidget.dart';
import 'package:locume/app/screen/login/signup/model/specialtie_model.dart'
    as specialtie;

class AddClinic extends GetView<ProfileController> {
  final List<String> weekdays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  final List<String> timeSlots = ['M', 'A', 'E'];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_isFormModified()) {
          return await _showExitConfirmationDialog(context);
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Clinic'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () async {
              if (_isFormModified()) {
                bool shouldExit = await _showExitConfirmationDialog(context);
                if (shouldExit) {
                  _clearAllFields();
                  Get.back();
                }
              } else {
                Get.back();
              }
            },
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              /// **Form Section (Scrollable)**
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() {
                        return InkWell(
                          onTap: () {
                            controller.pickImage(ImageSource.gallery, false);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 5),
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              color: HexColor("#F8F7F7"),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: HexColor("#DCD7D7")),
                            ),
                            child: controller.clinicImage.value.path.isNotEmpty
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        // Image with a fixed size
                                        SizedBox(
                                          width: 100, // Fixed size
                                          height: 100,
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.file(
                                                  controller.clinicImage.value,
                                                  width:
                                                      100, // Ensure it fills the box
                                                  height: 100,
                                                  fit: BoxFit
                                                      .cover, // Ensure full coverage without distortion
                                                ),
                                              ),
                                              Positioned(
                                                top: 5,
                                                right:
                                                    5, // Position inside the image
                                                child: GestureDetector(
                                                  onTap: () {
                                                    controller
                                                            .clinicImage.value =
                                                        File(""); // Clear image
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      shape: BoxShape.circle,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black26,
                                                          blurRadius: 4,
                                                          offset: Offset(0, 2),
                                                        ),
                                                      ],
                                                    ),
                                                    child: Icon(
                                                      Icons.close,
                                                      color: Colors.red,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.image,
                                          size: 50, color: Colors.grey),
                                      SizedBox(height: 8),
                                      Text("Upload max 3 photo",
                                          style: TextStyle(color: Colors.grey)),
                                    ],
                                  ),
                          ),
                        );
                      }),
                      Obx(() => controller.clinicImageError.value.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                controller.clinicImageError.value,
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 12),
                              ),
                            )
                          : const SizedBox()),
                      mylabel2("Clinic Name"),
                      SearchableDropdown(
                        hint: "Enter Clinic Name",
                        options: controller.clinicList.value
                            .map((clinic) => clinic?.clinicName ?? "")
                            .toList(),
                        controller: controller.clinicName,
                        onChanged: (value) {
                          controller.clinicName.text = value ?? "";
                        },
                      ),
                      Obx(() => controller.clinicNameError.value.isNotEmpty
                          ? Text(
                              controller.clinicNameError.value,
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 12),
                            )
                          : const SizedBox()),
                      mylabel2("About Clinic"),
                      mybigtextfield(
                          "Enter About Your Clinic", controller.about),
                      Obx(() => controller.aboutError.value.isNotEmpty
                          ? Text(
                              controller.aboutError.value,
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 12),
                            )
                          : const SizedBox()),
                      // mylabel2("Clinic Time Slot"),
                      // const SizedBox(height: 5),
                      // Wrap(
                      //   spacing: 5,
                      //   runSpacing: 10,
                      //   children: [
                      //     selectableBoxField(text: "Morning"),
                      //     selectableBoxField(text: "Afternoon"),
                      //     selectableBoxField(text: "Night"),
                      //   ],
                      // ),
                      // Obx(() => controller.slotError.value.isNotEmpty
                      //     ? Padding(
                      //         padding: const EdgeInsets.only(top: 4.0),
                      //         child: Text(
                      //           controller.slotError.value,
                      //           style: const TextStyle(
                      //               color: Colors.red, fontSize: 12),
                      //         ),
                      //       )
                      //     : const SizedBox()),
                      // const SizedBox(height: 4),
                      // mylabel2("Contact Number"),
                      // mytextfield("Enter Contact Number",
                      //     controller.contactNumber, true),
                      // Obx(() => controller.contactNumberError.value.isNotEmpty
                      //     ? Text(
                      //         controller.contactNumberError.value,
                      //         style: const TextStyle(
                      //             color: Colors.red, fontSize: 12),
                      //       )
                      //     : const SizedBox()),
                      mylabel2("Clinic Address"),
                      mybigtextfield(
                          "Enter Clinic Address", controller.clinicAddress),
                      Obx(() => controller.clinicAddressError.value.isNotEmpty
                          ? Text(
                              controller.clinicAddressError.value,
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 12),
                            )
                          : const SizedBox()),
                      mylabel2("State"),
                      SearchableDropdown(
                        hint: "Select a state",
                        options: controller.statedata.value
                            .where((state) => state?.name != null)
                            .map((state) => state!.name!)
                            .toList(),
                        controller: controller.state,
                        onChanged: (value) {
                          controller.state.text = value ?? "";
                          if (value == null || value.isEmpty) {
                            controller.citydata.value = [];
                            controller.city.clear();
                            return;
                          }
                          final selectedState = controller.statedata.value
                              .where((state) => state?.name == value)
                              .toList()
                              .firstOrNull;

                          if (selectedState == null) {
                            controller.citydata.value = [];
                            controller.city.clear();
                            return;
                          }

                          String isoCode = selectedState.isoCode ?? "";
                          controller.citydata.value = [];
                          controller.city.clear();
                          controller.getallcity(isoCode);
                        },
                      ),
                      Obx(() => controller.stateError.value.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                controller.stateError.value,
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 12),
                              ),
                            )
                          : const SizedBox()),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                mylabel2("City"),
                                const SizedBox(height: 5),
                                Obx(() {
                                  return SearchableDropdown(
                                    hint: "Select a city",
                                    options: controller.citydata.value
                                        .map((city) => city?.name ?? "")
                                        .toList(),
                                    controller: controller.city,
                                    onChanged: (value) {
                                      controller.city.text = value ?? "";
                                    },
                                  );
                                }),
                                Obx(() => controller.cityError.value.isNotEmpty
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(top: 4.0),
                                        child: Text(
                                          controller.cityError.value,
                                          style: const TextStyle(
                                              color: Colors.red, fontSize: 12),
                                        ),
                                      )
                                    : const SizedBox()),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                mylabel2("Pincode"),
                                mytextfield(
                                    "Enter Pincode", controller.pincode, true),
                                Obx(() =>
                                    controller.pincodeError.value.isNotEmpty
                                        ? Text(
                                            controller.pincodeError.value,
                                            style: const TextStyle(
                                                color: Colors.red,
                                                fontSize: 12),
                                          )
                                        : const SizedBox()),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          mylabel2("Preferred Specialities"),
                          Spacer(),
                          InkWell(
                              onTap: () {
                                Get.to(Addspecialities());
                              },
                              child: Text(controller.selectedSpecialties !=
                                          null &&
                                      controller.selectedSpecialties!.isNotEmpty
                                  ? "+Add more"
                                  : "+Add Specialities"))
                        ],
                      ),
                      controller.selectedSpecialties != null &&
                              controller.selectedSpecialties!.isNotEmpty
                          ? SizedBox(
                              width: double.infinity,
                              child: GridView.builder(
                                shrinkWrap:
                                    true, // Important to wrap content inside a column
                                physics:
                                    const NeverScrollableScrollPhysics(), // Disable scrolling inside GridView
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 5,
                                ),
                                itemCount:
                                    controller.selectedSpecialties.length,
                                itemBuilder: (context, index) {
                                  // Find the corresponding specialty object from specialtiesList using the ID
                                  final specialty =
                                      controller.specialtiesList.firstWhere(
                                    (s) =>
                                        s.id ==
                                        controller.selectedSpecialties[index],
                                    orElse: () => specialtie.Result(
                                        id: 0,
                                        specialtiesName:
                                            "Unknown"), // Default object
                                  );

                                  return Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      specialty.specialtiesName ??
                                          'Unknown', // Show name or fallback
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : Container(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text("No Specialities listed",
                                  style: TextStyle(fontSize: 16)),
                            ),
                      mylabel2("Working Day/Time"),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 1),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ...timeSlots.map((slot) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 9.4),
                                      child: Obx(() {
                                        bool allSelected = controller
                                            .isSlotSelectedForAllDays(slot);
                                        return GestureDetector(
                                          onTap: () {
                                            controller
                                                .toggleSlotForAllDays(slot);
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Checkbox(
                                                value: allSelected,
                                                onChanged: (_) {
                                                  controller
                                                      .toggleSlotForAllDays(
                                                          slot);
                                                },
                                                activeColor: primaryColor,
                                                side: BorderSide(
                                                  color: allSelected
                                                      ? primaryColor
                                                      : Colors.grey,
                                                  width: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    );
                                  }).toList(),
                                ],
                              ),
                            ),

                            // Weekdays with individual checkboxes
                            ...weekdays.map((day) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    day,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: textColor,
                                    ),
                                  ),
                                  Spacer(),
                                  ...timeSlots.map((slot) {
                                    String key = "${day}_$slot";
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      child: selectableBoxField(
                                        text: key,
                                        controller: controller,
                                      ),
                                    );
                                  }).toList(),
                                ],
                              );
                            }).toList(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              /// **Bottom Full-Width Button**
              Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  color: Colors.white, // Ensure it has a background
                  child: ElevatedButton(
                    onPressed: () async {
                      bool isValid = true;
                      String errorMessage = "";

                      if (controller.clinicName.text.trim().isEmpty) {
                        controller.clinicNameError.value =
                            "Clinic Name is required";
                        isValid = false;
                      } else {
                        controller.clinicNameError.value = "";
                      }

                      if (controller.about.text.trim().isEmpty) {
                        controller.aboutError.value =
                            "About Clinic is required";
                        isValid = false;
                      } else {
                        controller.aboutError.value = "";
                      }
                      if (controller.selectedOptions.isEmpty) {
                        controller.slotError.value = "Select at least one slot";
                        isValid = false;
                      } else {
                        controller.slotError.value = "";
                      }

                      if (controller.contactNumber.text.trim().isEmpty) {
                        controller.contactNumberError.value =
                            "Contact Number is required";
                        isValid = false;
                      } else {
                        controller.contactNumberError.value = "";
                      }

                      if (controller.clinicAddress.text.trim().isEmpty) {
                        controller.clinicAddressError.value =
                            "Clinic Address is required";
                        isValid = false;
                      } else {
                        controller.clinicAddressError.value = "";
                      }

                      if (controller.state.text.trim().isEmpty) {
                        controller.stateError.value = "State is required";
                        isValid = false;
                      } else {
                        controller.stateError.value = "";
                      }

                      if (controller.city.text.trim().isEmpty) {
                        controller.cityError.value = "City is required";
                        isValid = false;
                      } else {
                        controller.cityError.value = "";
                      }

                      if (controller.pincode.text.trim().isEmpty) {
                        controller.pincodeError.value = "Pincode is required";
                        isValid = false;
                      } else {
                        controller.pincodeError.value = "";
                      }

                      if (controller.clinicImage.value.path.isEmpty) {
                        controller.clinicImageError.value =
                            "Clinic Image is required";
                        isValid = false;
                      } else {
                        controller.clinicImageError.value = "";
                      }

                      if (!isValid) {
                        return;
                      }

                      // Call API functions only if validation passes
                      // controller.AddClinicImage();
                      await controller.AddClinic()
                          .whenComplete(_clearAllFields);
                      controller.getDrData();
                    },
                    child: Text("ADD"),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      textStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  /// Check if any field is modified
  bool _isFormModified() {
    return controller.clinicName.text.isNotEmpty ||
        controller.about.text.isNotEmpty ||
        controller.clinicAddress.text.isNotEmpty ||
        controller.state.text.isNotEmpty ||
        controller.city.text.isNotEmpty ||
        controller.pincode.text.isNotEmpty ||
        controller.selectedOptions.isNotEmpty;
  }

  /// Show confirmation dialog
  Future<bool> _showExitConfirmationDialog(BuildContext context) async {
    return await Get.dialog(
          AlertDialog(
            title: Text("Discard Changes?"),
            content: Text("Your information will be cleared if you go back."),
            actions: [
              TextButton(
                onPressed: () => Get.back(result: false),
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  _clearAllFields();
                  Get.back(result: true);
                },
                child: Text("Yes, Discard"),
              ),
            ],
          ),
        ) ??
        false;
  }

  /// Clear all input fields
  void _clearAllFields() {
    controller.clinicName.clear();
    controller.about.clear();
    controller.clinicAddress.clear();
    controller.state.clear();
    controller.city.clear();
    controller.pincode.clear();
    controller.selectedOptions.clear();
    controller.citydata.value = [];
    controller.clinicImage.value = File("");
    controller.clinicNameError.value = "";
    controller.aboutError.value = "";
    controller.slotError.value = "";
    controller.contactNumberError.value = "";
    controller.clinicAddressError.value = "";
    controller.stateError.value = "";
    controller.cityError.value = "";
    controller.pincodeError.value = "";
    controller.clinicImageError.value = "";
  }

  /// Selectable Time Slot Box
  Widget selectableBoxField({
    required String text,
    required ProfileController controller,
  }) {
    return Obx(() {
      bool isSelected = controller.selectedOptions.contains(text);

      return GestureDetector(
        onTap: () {
          if (isSelected) {
            controller.selectedOptions.remove(text);
          } else {
            controller.selectedOptions.add(text);
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: isSelected,
              onChanged: (value) {
                if (value == true) {
                  controller.selectedOptions.add(text);
                } else {
                  controller.selectedOptions.remove(text);
                }
              },
              activeColor: primaryColor,
              side: BorderSide(
                color: isSelected ? primaryColor : Colors.grey,
                width: 1,
              ),
            ),
            Text(
              text.split('_').last,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: isSelected ? primaryColor : Colors.grey,
              ),
            ),
          ],
        ),
      );
    });
  }
}
