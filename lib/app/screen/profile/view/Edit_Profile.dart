import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locume/Theme/theme.dart';
import 'package:locume/app/screen/profile/controller/Profile_Controller.dart';
import 'package:locume/widget/custom_button.dart';
import 'package:locume/widget/reusedwidget.dart';

class EditProfilePage extends GetView<ProfileController> {
  final TextEditingController nameController;
  final TextEditingController numberController;
  final TextEditingController locationController;
  final TextEditingController experienceController;

  EditProfilePage({
    super.key,
    required this.nameController,
    required this.numberController,
    required this.locationController,
    required this.experienceController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mylabel2("Name"),
            mytextfield("Enter your name", nameController),
            mylabel2("Number"),
            mytextfield("Enter your number", numberController),
            mylabel2("Location"),
            mytextfield("Enter location", locationController),
            mylabel2("Total Experience"),
            mytextfield("Total Experience", experienceController),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: CustomisableButton(
                  text: "Save",
                  onTap: () {
                    controller.editProfile();
                    Get.back();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
