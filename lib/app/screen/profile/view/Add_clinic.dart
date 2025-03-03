import 'package:get/get.dart';
import 'package:locume/Theme/theme.dart';
import 'package:locume/app/screen/profile/controller/Profile_Controller.dart';
import 'package:flutter/material.dart';
import 'package:locume/widget/reusedwidget.dart';

class AddClinic extends GetView<ProfileController> {
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
                      mylabel2("Clinic Name"),
                      mytextfield("Enter Clinic Name", controller.clinicName),
                      mylabel2("About Clinic"),
                      mytextfield("Enter About Your Clinic", controller.about),
                      mylabel2("Clinic Time Slot"),
                      const SizedBox(height: 5),
                      Wrap(
                        spacing: 5,
                        runSpacing: 10,
                        children: [
                          selectableBoxField(text: "Morning"),
                          selectableBoxField(text: "Afternoon"),
                          selectableBoxField(text: "Night"),
                        ],
                      ),
                      const SizedBox(height: 5),
                      mylabel2("Contact Number"),
                      mytextfield("Enter Contact Number",
                          controller.contactNumber, true),
                      mylabel2("Clinic Address"),
                      mytextfield(
                          "Enter Clinic Address", controller.clinicAddress),
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
                              ],
                            ),
                          ),
                        ],
                      ),
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
                  onPressed: () {
                    // Add button action here
                  },
                  child: Text("ADD"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    textStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
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
  }

  /// Selectable Time Slot Box
  Widget selectableBoxField({required String text}) {
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
        child: Container(
          height: 40,
          width: 120,
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color:
                isSelected ? primaryColor.withOpacity(0.1) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1,
              color: isSelected ? primaryColor : Colors.grey,
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 25,
                child: Icon(
                  isSelected ? Icons.check_box : Icons.check_box_outline_blank,
                  color: isSelected ? primaryColor : Colors.grey,
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? primaryColor : Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
