import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:locume/Theme/theme.dart';
import 'package:locume/app/screen/profile/controller/Profile_Controller.dart';
import 'package:locume/app/screen/profile/view/AddSpecialities.dart';
import 'package:locume/app/screen/profile/view/Add_clinic.dart';
import 'package:locume/app/screen/profile/view/Edit_Profile.dart';
import 'package:locume/app/screen/login/signup/model/specialtie_model.dart'
    as specialtie;
import 'package:locume/app/screen/profile/view/profileimageview.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({super.key}) {
    Get.lazyPut(() => ProfileController());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (controller.dr_data.value.isEmpty) {
            return const Center(child: Text("No data available"));
          }
          final data = controller.dr_data.value[0];
          String? profileImage = data.profileImage;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Obx(() {
                            return Stack(
                              alignment: Alignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (!controller.isUploading.value &&
                                        (controller.profileImage.value !=
                                                null ||
                                            (profileImage != null &&
                                                profileImage.isNotEmpty))) {
                                      Get.to(() => ProfileImageView(
                                            imageUrl: controller
                                                        .profileImage.value !=
                                                    null
                                                ? controller.profileImage.value!
                                                    .path // Local file path
                                                : profileImage, // Network image URL
                                            personName:
                                                "${data.firstName ?? 'N/A'} ${data.lastName ?? ''}"
                                                    .trim(), // ✅ Pass full name

                                            isLocalImage:
                                                controller.profileImage.value !=
                                                    null,
                                          ));
                                    }
                                  },
                                  child: CircleAvatar(
                                    radius: 55,
                                    backgroundColor: Colors.grey[200],
                                    backgroundImage:
                                        (!controller.isUploading.value &&
                                                controller.profileImage.value !=
                                                    null)
                                            ? FileImage(
                                                controller.profileImage.value!)
                                            : (profileImage != null &&
                                                    profileImage.isNotEmpty
                                                ? NetworkImage(profileImage)
                                                : null),
                                    child: (!controller.isUploading.value &&
                                            controller.profileImage.value ==
                                                null &&
                                            (profileImage == null ||
                                                profileImage.isEmpty))
                                        ? Icon(Icons.person,
                                            size: 40, color: Colors.grey[600])
                                        : null,
                                  ),
                                ),

                                // Show round loader while uploading
                                if (controller.isUploading.value)
                                  Positioned.fill(
                                    child: ClipOval(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black.withOpacity(0.4),
                                        ),
                                        child: Center(
                                          child: CircularProgressIndicator(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          }),
                          Positioned(
                            right: 4,
                            bottom: 4,
                            child: GestureDetector(
                              onTap: () => _showImageOptions(context),
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.white,
                                child: Icon(Icons.add_a_photo_rounded,
                                    size: 18, color: textColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.maxFinite,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                profileTextField("Your Name",
                                    "${data.firstName ?? 'N/A'} ${data.lastName ?? ''}"),
                                profileTextField(
                                    "Phone Number", data.mobileNumber ?? "N/A"),
                                profileTextField(
                                    "Location", data.location ?? 'N/A'),
                                profileTextField("Total Experience",
                                    data.totalExp.toString() ?? 'N/A'),
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: InkWell(
                                  onTap: () {
                                    Get.to(EditProfilePage(
                                      nameController: controller.name,
                                      numberController: controller.number,
                                      locationController: controller.location,
                                      experienceController:
                                          controller.experience,
                                    ));
                                  },
                                  child: const Text("Edit Profile")),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                        color: const Color.fromARGB(182, 158, 158, 158),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                            child: Row(
                              children: [
                                Text(
                                  "Preferred Specialities",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: primaryColor),
                                ),
                                Spacer(),
                                InkWell(
                                    onTap: () {
                                      Get.to(Addspecialities());
                                    },
                                    child: Text(
                                        controller.selectedSpecialties !=
                                                    null &&
                                                controller.selectedSpecialties!
                                                    .isNotEmpty
                                            ? "+Add more"
                                            : "+Add Specialities"))
                              ],
                            ),
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
                                      childAspectRatio: 4,
                                    ),
                                    itemCount:
                                        controller.selectedSpecialties.length,
                                    itemBuilder: (context, index) {
                                      // Find the corresponding specialty object from specialtiesList using the ID
                                      final specialty =
                                          controller.specialtiesList.firstWhere(
                                        (s) =>
                                            s.id ==
                                            controller
                                                .selectedSpecialties[index],
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
                          mylabel("Education Qualifications & Proof"),
                          mytextfield("Add Education", controller.addeducation),
                          mylabel2(
                              "Upload image or PDF of qualification proofs*"),
                          Text(
                              "Non allied practitioners should submit council registration proof with metioned degree name. Allied practitioners should submit mark sheets or passing certificated from UGC approved university."),
                          SizedBox(
                            height: 15,
                          ),
                          buildFilePickerCard(
                            selectedFile: controller.selectedQualificationfile,
                            fileName: controller.fileName,
                            onRemove: () =>
                                controller.removeFile('qualification'),
                            onPickFile: () =>
                                controller.pickFile('qualification'),
                          ),

                          SizedBox(height: 10),
                          mylabel("Identity Proof"),
                          mytextfield("Documents to be uploaded",
                              controller.addeducation),
                          Text("Upload image or PDF of identity proofs*"),
                          SizedBox(
                            height: 10,
                          ),
                          buildFilePickerCard(
                            selectedFile: controller.selectIdentityfile,
                            fileName: controller.IndentityName,
                            onRemove: () => controller.removeFile('identity'),
                            onPickFile: () => controller.pickFile('identity'),
                          ),
                          SizedBox(
                            height: 20,
                          ), // data.category != null && data.category!.isNotEmpty
                          //     ? SizedBox(
                          //         width: double.infinity,
                          //         child: GridView.builder(
                          //           shrinkWrap:
                          //               true, // Important to wrap content inside a column
                          //           physics:
                          //               const NeverScrollableScrollPhysics(), // Disable scrolling inside GridView
                          //           gridDelegate:
                          //               const SliverGridDelegateWithFixedCrossAxisCount(
                          //             crossAxisCount: 3,
                          //             crossAxisSpacing: 10,
                          //             childAspectRatio: 4,
                          //           ),
                          //           itemCount: data.category!.length,
                          //           itemBuilder: (context, index) {
                          //             return Align(
                          //               alignment: Alignment.topLeft,
                          //               child: Text(
                          //                 data.category![index].toString() ??
                          //                     'N/A',
                          //                 style: TextStyle(
                          //                   fontSize: 12,
                          //                   fontWeight: FontWeight.w400,
                          //                 ),
                          //                 // Center align text inside the grid
                          //               ),
                          //             );
                          //           },
                          //         ),
                          //       )
                          //     : Container(
                          //         padding: EdgeInsets.only(top: 10),
                          //         child: Text("No availability listed",
                          //             style: TextStyle(fontSize: 16)),
                          //       ),
                          if (data.clinicName == null)
                            InkWell(
                                onTap: () async {
                                  await controller.getallstate();
                                  Get.to(AddClinic());
                                },
                                child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: primaryColor),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Row(children: [
                                      Icon(
                                        Icons.add,
                                        color: primaryColor,
                                      ),
                                      Text(
                                        " Add Your Clinic",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: primaryColor),
                                      )
                                    ]))),
                          if (controller.addClinic == true) ClinicDetails(),
                          if (data.hospitalName == null)
                            InkWell(
                                onTap: () => addclinic(context),
                                child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: primaryColor),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Row(children: [
                                      Icon(
                                        Icons.add,
                                        color: primaryColor,
                                      ),
                                      Text(
                                        " Add Your Hospital",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: primaryColor),
                                      )
                                    ]))),
                          if (controller.addHosiptial == true) addHospital(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget profileTextField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label text
          Text(
            label,
            style: TextStyle(
                color: primaryColor, fontSize: 14, fontWeight: FontWeight.w400),
          ),
          // Value text
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              value.isNotEmpty ? value : 'N/A', // If value is empty, show 'N/A'
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget comment(String dec, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(39, 81, 150, 229),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(dec),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Spacer(),
                    Text(
                      name,
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget mylabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 5),
      child: Text(
        label,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w500, color: primaryColor),
      ),
    );
  }

  Widget mylabel2(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 5),
      child: Text(
        label,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500, color: primaryColor),
      ),
    );
  }

  Widget buildFilePickerCard({
    required Rx<File?> selectedFile,
    required RxString fileName,
    required VoidCallback onRemove,
    required VoidCallback onPickFile,
  }) {
    return Obx(() => GestureDetector(
          onTap: selectedFile.value == null ? onPickFile : null,
          child: Container(
            width: selectedFile.value == null ? 60 : 200,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: primaryColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: selectedFile.value == null
                ? Icon(Icons.add, size: 40, color: primaryColor)
                : Row(
                    children: [
                      Icon(
                        selectedFile.value!.path.endsWith('.pdf')
                            ? Icons.picture_as_pdf
                            : Icons.image,
                        color: primaryColor,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          fileName.value,
                          style: TextStyle(color: primaryColor),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.clear, color: Colors.red),
                        onPressed: onRemove,
                      ),
                    ],
                  ),
          ),
        ));
  }

  Widget ClinicDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            mylabel("Clinic Name"),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 5),
              child: InkWell(
                  onTap: () {
                    controller.addClinic.value = true;
                  },
                  child: Text("Add More +")),
            )
          ],
        ),
        mytextfield("Enter Clinic Name", controller.clinicName),
        mylabel("Clinic Address"),
        mytextfield("Enter Clininc Address", controller.clinicAddress),
        mylabel("Clinic Time Slot"),
        const SizedBox(
          height: 5,
        ),
        Wrap(
          spacing: 5, // Horizontal space between items
          runSpacing: 10, // Vertical space between lines
          children: [
            selectableBoxField(text: "9:00 am - 1.00 pm"),
            selectableBoxField(text: "10:00 am - 2.00 pm"),
            selectableBoxField(text: "1:00 am - 2.00 pm")
          ],
        ),
      ],
    );
  }

  Widget addHospital() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            mylabel("Hospital Name"),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 5),
              child: InkWell(
                  onTap: () {
                    controller.addHosiptial.value = false;
                  },
                  child: Text("Cancel")),
            )
          ],
        ),
        mytextfield("Enter Hospital Name", controller.hospitalName),
        mylabel("Hospital Address"),
        mytextfield("Enter Hospital Address", controller.hospitalAddress),
      ],
    );
  }

  Widget HospitalDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            mylabel("Hospital Name"),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 5),
              child: InkWell(
                  onTap: () {
                    controller.addHosiptial.value = true;
                  },
                  child: Text("Add More +")),
            )
          ],
        ),
        mytextfield("Enter Hospital Name", controller.hospitalName),
        mylabel("Hospital Address"),
        mytextfield("Enter Hospital Address", controller.hospitalAddress),
      ],
    );
  }

  Widget mytextfield(String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: EdgeInsets.symmetric(
              vertical: 5, horizontal: 12), // Adjust padding
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20), // Rounded corners
            borderSide: BorderSide(
                color: const Color.fromARGB(124, 175, 175, 175),
                width: 1), // Gray when disabled
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20), // Rounded corners
            borderSide:
                BorderSide(color: primaryColor, width: 1), // Blue when enabled
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20), // Rounded corners
            borderSide: BorderSide(
                color: Color.fromARGB(124, 175, 175, 175),
                width: 1), // Default border
          ),
        ),
        style: TextStyle(fontSize: 14), // Adjust text size if needed
      ),
    );
  }

  Widget selectableBoxField({
    required String text,
  }) {
    return Obx(() {
      bool isSelected = controller.selectedOptions.contains(text);

      return GestureDetector(
        onTap: () {
          if (isSelected) {
            controller.selectedOptions.remove(text); // Unselect
          } else {
            controller.selectedOptions.add(text); // Select
          }
        },
        child: Container(
          height: 40,
          width: 120, // Increased width for better UI
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color:
                isSelected ? primaryColor.withOpacity(0.1) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1.5,
              color: isSelected
                  ? primaryColor
                  : Colors.grey, // Change border color
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

  void _showImageOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Obx(() {
          bool hasImage = controller.profileImage.value != null;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 120, // Keeps bottom sheet height consistent
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (hasImage)
                    _buildImageOption(
                      icon: Icons.remove_red_eye,
                      label: "View",
                      onTap: () {
                        Get.back();
                        _viewImage(context);
                      },
                    ),
                  _buildImageOption(
                    icon: Icons.camera_alt,
                    label: "Capture",
                    onTap: () {
                      controller.pickImage(ImageSource.camera);
                      Get.back();
                    },
                  ),
                  _buildImageOption(
                    icon: Icons.photo,
                    label: "Gallery",
                    onTap: () {
                      controller.pickImage(ImageSource.gallery);
                      Get.back();
                    },
                  ),
                  if (hasImage)
                    _buildImageOption(
                      icon: Icons.delete,
                      label: "Delete",
                      onTap: () {
                        controller.profileImage.value = null;
                        Get.back();
                      },
                    ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  Widget _buildImageOption(
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[200],
              child: Icon(icon, size: 24, color: textColor),
            ),
            const SizedBox(height: 8),
            Text(label,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  void _viewImage(BuildContext context) {
    Get.dialog(
      Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.file(controller.profileImage.value!),
            TextButton(
              onPressed: () => Get.back(),
              child: Text("Close"),
            ),
          ],
        ),
      ),
    );
  }

  void addclinic(BuildContext context) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          "Add Clinic details",
          style: TextStyle(color: primaryColor, fontSize: 20),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Ensures minimal height
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              mylabel("Clinic Name"),
              mytextfield("Enter Clinic Name", controller.clinicName),
              mylabel("Clinic Address"),
              mytextfield("Enter Clinic Address", controller.clinicAddress),
              mylabel("Clinic Time Slot"),
              const SizedBox(height: 5),
              Wrap(
                spacing: 5, // Horizontal space between items
                runSpacing: 10, // Vertical space between lines
                children: [
                  selectableBoxField(text: "Morning"),
                  selectableBoxField(text: "Afternoon"),
                  selectableBoxField(text: "Night"),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              // Save data logic (API call if needed)
              Get.back(); // Close dialog
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }

  Widget boxfield(dynamic text) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 35,
        width: 120, // Fixed height for each availability container
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              width: 1, color: const Color.fromARGB(124, 175, 175, 175)
              // Border color
              ),
        ),
        alignment: Alignment.center,
        child: Text(
          text ?? 'N/A', // Provide fallback for null values
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
