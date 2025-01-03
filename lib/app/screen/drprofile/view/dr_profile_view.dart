import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locume/Theme/theme.dart';
import 'package:locume/app/screen/drprofile/controller/dr_profile_controller.dart';
import 'package:locume/widget/custom_button.dart';

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
          return Text("${data.firstName ?? 'N/A'} ${data.lastName ?? 'N/A'}");
        }),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const  Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.dr_data.value.isEmpty) {
          return const  Center(child: Text("No data available"));
        }
        final data = controller.dr_data.value[0];
        String? profileImage = data.profileImage;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Check if data is still loading

              // Safely access the first item of the list

              // Safely handle profileImage (in case it's null)

              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.all(20),
                padding:const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        width: 2,
                        color: const Color.fromRGBO(235, 235, 238, 1))),
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
                      height: 20,
                    ),
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(124, 175, 175, 175))),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            profileTextField("Your Name",
                                "${data.firstName ?? 'N/A'} ${data.lastName ?? 'N/A'}"),
                            profileTextField("Email", data.emailId ?? 'N/A'),
                            profileTextField(
                                "Phone Number", data.mobileNumber ?? "N/A"),
                            profileTextField(
                                "Location", data.location ?? 'N/A'),
                            profileTextField(
                                "Medical ID", data.medicalId ?? 'N/A')
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(124, 175, 175, 175))),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "About Sid",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: primaryColor),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                                "Lorem ipsum dolor sit amet consectetur. Erat auctor a aliquam vel congue luctus. Leo diam cras neque mauris ac arcu elit ipsum dolor sit amet consectetur.")
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(124, 175, 175, 175))),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Professional Details",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: primaryColor),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text("""These are the professional 
          details shown to users in the app.""")
                              ],
                            ),
                            Image.asset("assets/Stars.png")
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    // Availability Section
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
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
                                  runSpacing:
                                      10, // Vertical space between lines
                                  children:
                                      data.availability!.map((availability) {
                                    return boxfield(availability);
                                  }).toList(),
                                )
                              : Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: Text("No availability listed",
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
                                  boxfield(
                                      "${data.totalExp?.toString()} year" ??
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
                          mylabel("Preferred Specialities"),
                          data.preferredSpecialities != null &&
                                  data.preferredSpecialities!.isNotEmpty
                              ? Wrap(
                                  spacing: 10, // Horizontal space between items
                                  runSpacing:
                                      10, // Vertical space between lines
                                  children: controller.selectedSpecialtiesNames!
                                      .map((preferredSpecialities) {
                                    return boxfield(
                                        preferredSpecialities.toString());
                                  }).toList(),
                                )
                              : Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: Text("No availability listed",
                                      style: TextStyle(fontSize: 16)),
                                ),

                          const SizedBox(
                            height: 15,
                          ),
                          mylabel("Specified category"),
                          controller.selectedCategoriesNames != null &&
                                  controller.selectedCategoriesNames!.isNotEmpty
                              ? Wrap(
                                  spacing: 10, // Horizontal space between items
                                  runSpacing:
                                      10, // Vertical space between lines
                                  children: controller.selectedCategoriesNames!
                                      .map((category) {
                                    return boxfield(category.toString());
                                  }).toList(),
                                )
                              : Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: Text("No availability listed",
                                      style: TextStyle(fontSize: 16)),
                                ),
                        ],
                      ),
                    ),
                    Container(
                      width: 194,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: const Row(
                            children: [
                              Text("Download Resume "),
                              Icon(Icons.download)
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      mylabel('Communication preferences'),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                          "Medrecruit and our partner Medworld will occasionally email you about news and opportunities we think you'll be interested in Your profile is currently being created, please check back in 15-30 minutes if you would like to update your communication preferences. In the meantime, let's get a running start on the next step in your career"),
                      const SizedBox(
                        height: 15,
                      ),
                      mylabel('Register your account'),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                          "Register your account to unlock a world of possibilities! Signing up is simple and fast, allowing you to personalize your experience and enjoy exclusive benefits. Don’t miss out—create your account today and start exploring all that we have to offer."),
                      InkWell(
                          onTap: () {
                            print("object");
                          },
                          child: Text(
                            "Register your account",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: primaryColor),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      comment(
                          "Great experience. [Melissa] really dedicates time to make sure she understands your past and current skills and puts it to paper to make you as attractive as you really are. Thank you. My wife's CV is next.",
                          "Eyako Wurapa"),
                      comment(
                          "I found a job! Thanks to locum.com , a recruiter, who actually read my background, put me in touch with a client looking for someone with my qualifications. Given that I work in a very small health care niche the chances of my finding this employer on my own would be slim. Thanks for your help.",
                          "Susan Pearson"),
                      comment(
                          "Thank you for all that you do. I started getting interviews almost immediately after using your resume, and I now have an offer in hand that I have accepted. It's all thanks to your new and improved resume that I got the job.",
                          "Rebecca Dickerson")
                    ],
                  ))
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
