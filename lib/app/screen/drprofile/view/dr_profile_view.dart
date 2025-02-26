import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locume/Theme/theme.dart';
import 'package:locume/app/screen/drprofile/controller/dr_profile_controller.dart';
import 'package:locume/widget/custom_button.dart';
import 'package:locume/app/screen/login/signup/model/specialtie_model.dart'
    as specialtie;

class DrProfileView extends GetView<DrProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          // Check if data is loaded
          if (controller.isLoading.value) {
            return const Text('');
          }

          // Check if the data list is empty
          if (controller.dr_data.value.isEmpty) {
            return const Text('Doctor Profile');
          }

          // Safely access the first item of the list and its properties
          final data = controller.dr_data.value[0];
          return Text("${data.firstName ?? 'N/A'}");
        }),
      ),
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
                // margin: const EdgeInsets.all(20),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Circle Avatar with image or fallback to profile icon
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(50), // Rounded corners
                      child: profileImage != null && profileImage.isNotEmpty
                          ? CircleAvatar(
                              radius: 55, // Avatar size
                              backgroundImage: NetworkImage(profileImage),
                              onBackgroundImageError: (exception, stackTrace) {
                                // Handle image load failure
                                print('Error loading image');
                              },
                            )
                          : CircleAvatar(
                              radius: 60, // Avatar size
                              backgroundColor:
                                  Colors.grey[200], // Background color for icon
                              child: Icon(
                                Icons.person,
                                size: 40, // Icon size
                                color: Colors.grey[600], // Icon color
                              ),
                            ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 124,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4), // Reduce horizontal padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Optional: Adjust the border radius
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Center the content horizontally
                          children: [
                            Text(
                              "Download Resume",
                              style: TextStyle(fontSize: 10),
                            ),
                            SizedBox(
                                width:
                                    4), // Add small spacing between the text and the icon
                            Icon(
                              Icons.download,
                              color: Colors.white,
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          profileTextField("Your Name",
                              "${data.firstName ?? 'N/A'} ${data.lastName ?? 'N/A'}"),
                          profileTextField("Email", data.emailId ?? 'N/A'),
                          profileTextField(
                              "Phone Number", data.mobileNumber ?? "N/A"),
                          profileTextField("Location", data.location ?? 'N/A'),
                          profileTextField(
                              "Medical ID", data.medicalId ?? 'N/A')
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Container(
                    //   width: double.maxFinite,
                    //   decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.circular(12),
                    //       border: Border.all(
                    //           width: 1,
                    //           color: const Color.fromARGB(124, 175, 175, 175))),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(15.0),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           "About Sid",
                    //           style: TextStyle(
                    //               fontSize: 18,
                    //               fontWeight: FontWeight.w500,
                    //               color: primaryColor),
                    //         ),
                    //         const SizedBox(
                    //           height: 5,
                    //         ),
                    //         const Text(
                    //             "Lorem ipsum dolor sit amet consectetur. Erat auctor a aliquam vel congue luctus. Leo diam cras neque mauris ac arcu elit ipsum dolor sit amet consectetur.")
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    //           Container(
                    //             width: double.maxFinite,
                    //             decoration: BoxDecoration(
                    //                 color: Colors.white,
                    //                 borderRadius: BorderRadius.circular(12),
                    //                 border: Border.all(
                    //                     width: 1,
                    //                     color: const Color.fromARGB(124, 175, 175, 175))),
                    //             child: Padding(
                    //               padding: const EdgeInsets.all(15.0),
                    //               child: Row(
                    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                 children: [
                    //                   Column(
                    //                     crossAxisAlignment: CrossAxisAlignment.start,
                    //                     children: [
                    //                       Text(
                    //                         "Professional Details",
                    //                         style: TextStyle(
                    //                             fontSize: 18,
                    //                             fontWeight: FontWeight.w500,
                    //                             color: primaryColor),
                    //                       ),
                    //                       const SizedBox(
                    //                         height: 5,
                    //                       ),
                    //                       const Text("""These are the professional
                    // details shown to users in the app.""")
                    //                     ],
                    //                   ),
                    //                   Image.asset("assets/Stars.png")
                    //                 ],
                    //               ),
                    //             ),
                    //           ),
                    //           const SizedBox(height: 5),
                    // Availability Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Your Availability ",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: primaryColor),
                            ),
                            const Text(
                              "(Available time slot)",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),

                        // Wrap widget to display availability in rows and wrap when overflowed
                        data.availability != null &&
                                data.availability!.isNotEmpty
                            ? Wrap(
                                spacing: 10, // Horizontal space between items
                                runSpacing: 10, // Vertical space between lines
                                children:
                                    data.availability!.map((availability) {
                                  return boxfield(availability);
                                }).toList(),
                              )
                            : Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: const Text("No availability listed",
                                    style: TextStyle(fontSize: 16)),
                              ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                mylabel("Rate/Hourly  "),
                                boxfield(data.hourlyRate?.toString() ?? 'N/A')
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                mylabel("Total Experience"),
                                boxfield("${data.totalExp?.toString()} year" ??
                                    'N/A')
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        mylabel("Clinic Name"),

                        boxfield(data.clinicName ?? 'N/A'),
                        const SizedBox(
                          height: 15,
                        ),
                        mylabel("Clinic Address"),
                        boxfield(data.clinicLocation ?? 'N/A'),
                        const SizedBox(
                          height: 15,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize
                              .min, // Prevents extra space in column
                          children: [
                            mylabel("Preferred Specialities"),
                            const SizedBox(
                              height: 5,
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
                                        final specialty = controller
                                            .specialtiesList
                                            .firstWhere(
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
                            const SizedBox(
                              height: 15,
                            ),
                            // mylabel("Specified category"),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            // controller.selectedCategoriesNames != null &&
                            //         controller
                            //             .selectedCategoriesNames!.isNotEmpty
                            //     ? SizedBox(
                            //         width: double.infinity,
                            //         child: GridView.builder(
                            //           shrinkWrap: true,
                            //           padding: EdgeInsets
                            //               .zero, // Removes default padding
                            //           physics:
                            //               const NeverScrollableScrollPhysics(),
                            //           gridDelegate:
                            //               const SliverGridDelegateWithFixedCrossAxisCount(
                            //             crossAxisCount: 3,
                            //             crossAxisSpacing: 10,
                            //             childAspectRatio: 4,
                            //           ),
                            //           itemCount: controller
                            //                   .selectedCategoriesNames.length ??
                            //               0,
                            //           itemBuilder: (context, index) {
                            //             return Align(
                            //               alignment: Alignment.topLeft,
                            //               child: Text(
                            //                 controller
                            //                     .selectedCategoriesNames[index]
                            //                     .toString(),
                            //                 style: const TextStyle(
                            //                     fontSize: 12,
                            //                     fontWeight: FontWeight.w400),
                            //               ),
                            //             );
                            //           },
                            //         ),
                            //       )
                            //     : const Text("No availability listed",
                            //         style: TextStyle(fontSize: 16)),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
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
    return Text(
      label,
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w500, color: primaryColor),
    );
  }

  Widget boxfield(dynamic text) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: IntrinsicWidth(
        // This ensures the width is based on the content
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1,
              color: const Color.fromARGB(124, 175, 175, 175), // Border color
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
            maxLines: null, // Allows text to take multiple lines
            overflow: TextOverflow.visible, // Ensures text is not truncated
            softWrap: true, // Ensures text wraps to the next line
          ),
        ),
      ),
    );
  }
}
