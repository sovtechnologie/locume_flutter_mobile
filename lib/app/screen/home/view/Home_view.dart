import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:hexcolor/hexcolor.dart';

import 'package:locume/Theme/theme.dart';
import 'package:locume/app/screen/manage/model/RequestRaised_model.dart';
import 'package:locume/app/screen/requestLocum/view/req-locum-view.dart';
import 'package:locume/app/screen/requestLocumDetails/binding/request_details_binding.dart';
import 'package:locume/app/screen/requestLocumDetails/view/request_details_view.dart';
import 'package:locume/app/screen/requestLocumDetails/view/request_raisedbyMe_details.dart';

import 'package:locume/widget/reusedwidget.dart';

import '../../../../api/auth_provider.dart';

import '../controller/Home_controller.dart';

class HomeView extends GetView<HomeControlller> {
  HomeView({super.key}) {
    // Instantiate the controller here
    Get.put(HomeControlller());
  }

  final firstName = Get.find<AuthProvider>().getUser?.firstName;
  final lastName = Get.find<AuthProvider>().getUser?.lastName;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: borderColor),
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: primaryColor, width: 1.3),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 65,
                              height: 65,
                              child: CircularProgressIndicator(
                                value: 0.6, // 60% progress
                                strokeWidth: 5,
                                backgroundColor: Colors.white,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(primaryColor),
                              ),
                            ),
                            ClipOval(
                              child: Image.network(
                                'https://locumedocument.s3.ap-south-1.amazonaws.com/1741586110601profile_image.jpg',
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Dr. Christopher",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: HexColor("#5E5C65"),
                                      fontWeight: FontWeight.w400),
                                ),
                                Spacer(),
                                Text("View Profile",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: primaryColor,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            const SizedBox(height: 3),
                            Row(
                              children: [
                                Text(
                                  "12 pending actions",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: primaryColor,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text("  (Updated 12 Days Ago)",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: HexColor("#ABAEBB"),
                                        fontWeight: FontWeight.w400)),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text("Request Raised",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: primaryColor)),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(RequestLocumView());
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: primaryColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Obx(() {
                  if (controller.isLoading.value) {
                    return Center(
                        child: CircularProgressIndicator()); // Show loader
                  }

                  if (controller.request_data.isEmpty) {
                    return Center(
                        child: Text(
                            "No data available")); // Show message when empty
                  }

                  return Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 100,
                          enlargeCenterPage: true,
                          autoPlay: false,
                          viewportFraction: 1,
                          autoPlayInterval: Duration(seconds: 10),
                          onPageChanged: (index, reason) {
                            controller.currentIndex.value = index;
                          },
                        ),
                        items: List.generate(
                          controller.request_data.length,
                          (index) {
                            final item = controller.request_data[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 4.0),
                              child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  color: HexColor('#FFFFFF'),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  border:
                                      Border.all(width: 1, color: borderColor),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 9.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  item.hospitalName ??
                                                      'No Name',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: primaryColor),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  'Multispeciality',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: HexColor("#ABAEBB"),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.to(RequestRaisedbymeDetails(),
                                                  binding:
                                                      RequestDetailsBinding(
                                                          id: item.id));
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5.0),
                                              child: Text(
                                                'View Details',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: primaryColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(Icons.calendar_month,
                                              size: 14, color: textColor),
                                          SizedBox(width: 4),
                                          Expanded(
                                            child: Text(
                                              "${formatDateRange(item.startDate?.toIso8601String(), item.endDate?.toIso8601String())}  |  ₹${item.id}Per Hour",
                                              style: TextStyle(fontSize: 12),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 2),
                                      Row(
                                        children: [
                                          Text(
                                            'Hot Requirement     (Raised By Dr.Christopher)',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: HexColor("#ABAEBB"),
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            '2 Days Ago',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: HexColor("#ABAEBB"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                controller.request_data.length, (index) {
                              return Container(
                                width: 5,
                                height: 5,
                                margin: EdgeInsets.symmetric(horizontal: 2),
                                child: controller.currentIndex.value == index
                                    ? SvgPicture.asset(
                                        "assets/currentindex.svg")
                                    : SvgPicture.asset("assets/otherindex.svg"),
                              );
                            }),
                          )),
                    ],
                  );
                }),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text("Request Received",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: primaryColor)),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(RequestLocumView());
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: primaryColor),
                      ),
                    ),
                  ],
                ),

                manage_card("Apollo international hospital",
                    "22-24 Jan 2025 (Sat-Mon)", "100", 20),
                manage_card("Apollo international hospital",
                    "22-24 Jan 2025 (Sat-Mon)", "100", 1),
                manage_card("Apollo international hospital",
                    "22-24 Jan 2025 (Sat-Mon)", "100", 1),
                manage_card("Apollo international hospital",
                    "22-24 Jan 2025 (Sat-Mon)", "100", 1),
                manage_card("Apollo international hospital",
                    "22-24 Jan 2025 (Sat-Mon)", "100", 1)

                // space(double.maxFinite, 20.0),
                // Container(
                //   decoration: BoxDecoration(
                //     boxShadow: [
                //       BoxShadow(
                //           offset: const Offset(0, 0),
                //           color: HexColor('#1B4584').withOpacity(0.05),
                //           blurRadius: 4.0,
                //           spreadRadius: 4.0,
                //           blurStyle: BlurStyle.normal)
                //     ],
                //     borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                //   ),
                //   child: TextField(
                //     strutStyle: const StrutStyle(
                //         fontSize: 10, fontWeight: FontWeight.bold),
                //     // style: GoogleFonts.inter(
                //     //     color: Colors.black, fontWeight: FontWeight.w300),
                //     keyboardType: TextInputType.text,
                //     decoration: InputDecoration(
                //       prefixIcon: Icon(
                //         Icons.search_rounded,
                //         color: HexColor('#2C72C0'),
                //       ),
                //       enabledBorder: const OutlineInputBorder(
                //           borderSide: BorderSide(color: Colors.transparent),
                //           borderRadius: BorderRadius.all(
                //             Radius.circular(15.0),
                //           )),
                //       disabledBorder: const OutlineInputBorder(
                //           borderSide: BorderSide(color: Colors.transparent),
                //           borderRadius: BorderRadius.all(
                //             Radius.circular(15.0),
                //           )),
                //       focusedBorder: const OutlineInputBorder(
                //           borderSide: BorderSide(color: Colors.transparent),
                //           borderRadius: BorderRadius.all(
                //             Radius.circular(15.0),
                //           )),
                //       border: const OutlineInputBorder(
                //           borderSide: BorderSide(color: Colors.transparent),
                //           borderRadius: BorderRadius.all(
                //             Radius.circular(15.0),
                //           )),
                //       fillColor: HexColor("#FFFFFF"),
                //       filled: true,
                //       hintText: "Text",
                //       hintStyle: TextStyle(
                //         fontSize: 12,
                //         color: HexColor('#AAAAAA').withOpacity(0.7),
                //         fontWeight: FontWeight.w400,
                //       ),
                //     ),
                //   ),
                // ),
                // space(double.maxFinite, 20.0),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Top Specialties',
                //       style: TextStyle(
                //           fontSize: 15,
                //           fontWeight: FontWeight.w600,
                //           color: HexColor('#0866C6')),
                //     ),
                //     InkWell(
                //       onTap: () {
                //         Get.toNamed('/specialities');
                //       },
                //       child: Text(
                //         'View All',
                //         style: TextStyle(
                //             fontSize: 12,
                //             fontWeight: FontWeight.w500,
                //             color: HexColor('#1E5A84')),
                //       ),
                //     ),
                //   ],
                // ),
                // space(double.maxFinite, 10.0),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Expanded(
                //         child: specialcard(
                //             'assets/type1.svg', 'Anesthesiology', 1)),
                //     space(20.0, 0.0),
                //     Expanded(
                //         child:
                //             specialcard('assets/type2.svg', 'Cardiology', 2)),
                //     space(20.0, 0.0),
                //     Expanded(
                //         child:
                //             specialcard('assets/type3.svg', 'Dermatology', 4)),
                //     space(20.0, 0.0),
                //     Expanded(
                //         child: specialcard(
                //             'assets/type4.svg', 'Emergency medicine', 5)),
                //   ],
                // ),
                // space(double.maxFinite, 30.0),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Expanded(
                //         child: specialcard(
                //             'assets/type4.svg', 'Endocrinology', 6)),
                //     space(20.0, 0.0),
                //     Expanded(
                //         child: specialcard(
                //             'assets/type6.svg', 'Gastroenterology', 7)),
                //     space(20.0, 0.0),
                //     Expanded(
                //         child: specialcard(
                //             'assets/type7.svg', 'Hospital Medicine', 8)),
                //     space(20.0, 0.0),
                //     Expanded(
                //         child: specialcard(
                //             'assets/type8.svg', 'Medical Oncology', 9)),
                //   ],
                // ),
                // space(double.maxFinite, 30.0),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Top Locum',
                //       style: TextStyle(
                //           fontSize: 15,
                //           fontWeight: FontWeight.w600,
                //           color: HexColor('#0866C6')),
                //     ),
                //     Text(
                //       'View All',
                //       style: TextStyle(
                //           fontSize: 12,
                //           fontWeight: FontWeight.w500,
                //           color: HexColor('#1E5A84')),
                //     ),
                //   ],
                // ),
                // space(double.maxFinite, 10.0),
                // Obx(() => controller.data.value.isEmpty
                //     ? const Center(
                //         child: CircularProgressIndicator(),
                //       )
                //     : ConstrainedBox(
                //         constraints: BoxConstraints(
                //           maxHeight: (controller.data.value.length > 4
                //                   ? 4
                //                   : controller.data.value.length) *
                //               160, // Dynamic height
                //         ),
                //         child: ListView.builder(
                //           shrinkWrap: true, // Prevents infinite expansion
                //           physics: const NeverScrollableScrollPhysics(),
                //           itemCount: controller.data.value.length > 4
                //               ? 4
                //               : controller.data.value.length,
                //           itemBuilder: (context, index) {
                //             final doctor = controller.data.value[index];
                //             return Padding(
                //               padding: const EdgeInsets.fromLTRB(
                //                   8.0, 0.0, 8.0, 16.0),
                //               child: doctorcard(
                //                 context,
                //                 doctor.profileImage ??
                //                     "https://locumedocument.s3.ap-south-1.amazonaws.com/Screenshot%202024-06-05%20144331.png",
                //                 '${doctor.firstName ?? ''} ${doctor.lastName ?? ''}',
                //                 doctor.medicalId?.toString() ?? '',
                //                 doctor.aboutMe?.toString() ??
                //                     'No details provided',
                //                 doctor.totalExp?.toString() ?? '0',
                //                 doctor.location ?? 'Not specified',
                //                 doctor.customId ?? '0',
                //               ),
                //             );
                //           },
                //         ),
                //       )),
                // SizedBox(
                //   height: 20,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Top Hospital',
                //       style: TextStyle(
                //           fontSize: 15,
                //           fontWeight: FontWeight.w600,
                //           color: HexColor('#0866C6')),
                //     ),
                //     Text(
                //       'View All',
                //       style: TextStyle(
                //           fontSize: 12,
                //           fontWeight: FontWeight.w500,
                //           color: HexColor('#1E5A84')),
                //     ),
                //   ],
                // ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       hospitalcard(
                //           'assets/hospital1.png',
                //           'Apollo international hospital',
                //           'Parsik Hill Road, Cbd Belapur, Navi Mumbai',
                //           '5km away from your location',
                //           '23',
                //           '13',
                //           '4.5',
                //           80),
                //       space(15.0, 0.0),
                //       hospitalcard(
                //           'assets/hospital1.png',
                //           'Apollo international hospital',
                //           'Parsik Hill Road, Cbd Belapur, Navi Mumbai',
                //           '5km away from your location',
                //           '23',
                //           '13',
                //           '4.5',
                //           80),
                //       space(15.0, 0.0),
                //       hospitalcard(
                //           'assets/hospital1.png',
                //           'Apollo international hospital',
                //           'Parsik Hill Road, Cbd Belapur, Navi Mumbai',
                //           '5km away from your location',
                //           '23',
                //           '13',
                //           '4.5',
                //           80),
                //       space(15.0, 0.0),
                //       hospitalcard(
                //           'assets/hospital1.png',
                //           'Apollo international hospital',
                //           'Parsik Hill Road, Cbd Belapur, Navi Mumbai',
                //           '5km away from your location',
                //           '23',
                //           '13',
                //           '4.5',
                //           80),
                //     ],
                //   ),
                // ),
                // space(double.maxFinite, 35.0),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Top Clinic',
                //       style: TextStyle(
                //           fontSize: 15,
                //           fontWeight: FontWeight.w600,
                //           color: HexColor('#0866C6')),
                //     ),
                //     InkWell(
                //       onTap: () {
                //         Get.toNamed('/clinics');
                //       },
                //       child: Text(
                //         'View All',
                //         style: TextStyle(
                //             fontSize: 12,
                //             fontWeight: FontWeight.w500,
                //             color: HexColor('#1E5A84')),
                //       ),
                //     ),
                //   ],
                // ),
                // space(double.maxFinite, 10.0),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       hospitalcard(
                //           'assets/hospital1.png',
                //           'Apollo international hospital',
                //           'Parsik Hill Road, Cbd Belapur, Navi Mumbai',
                //           '5km away from your location',
                //           '23',
                //           '13',
                //           '4.5',
                //           80),
                //       space(15.0, 0.0),
                //       hospitalcard(
                //           'assets/hospital1.png',
                //           'Apollo international hospital',
                //           'Parsik Hill Road, Cbd Belapur, Navi Mumbai',
                //           '5km away from your location',
                //           '23',
                //           '13',
                //           '4.5',
                //           80),
                //       space(15.0, 0.0),
                //       hospitalcard(
                //           'assets/hospital1.png',
                //           'Apollo international hospital',
                //           'Parsik Hill Road, Cbd Belapur, Navi Mumbai',
                //           '5km away from your location',
                //           '23',
                //           '13',
                //           '4.5',
                //           80),
                //       space(15.0, 0.0),
                //       hospitalcard(
                //           'assets/hospital1.png',
                //           'Apollo international hospital',
                //           'Parsik Hill Road, Cbd Belapur, Navi Mumbai',
                //           '5km away from your location',
                //           '23',
                //           '13',
                //           '4.5',
                //           80),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
