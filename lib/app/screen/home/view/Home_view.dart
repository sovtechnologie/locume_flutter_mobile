import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:locume/Theme/theme.dart';
import 'package:locume/app/screen/requestLocum/view/req-locum-view.dart';
import 'package:locume/app/screen/statics/about.dart';
import 'package:locume/app/screen/statics/contact.dart';
import 'package:locume/widget/reusedwidget.dart';

import '../../../../api/auth_provider.dart';
import '../../locums/controller/Locum_Controller.dart';
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
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              children: [
                Row(
                  children: [
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
                            color: HexColor('#1E5A84')),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 90, // Adjust height
                    enlargeCenterPage: true,
                    autoPlay: false,
                    viewportFraction: 1,
                    autoPlayInterval: const Duration(seconds: 10),
                    onPageChanged: (index, reason) {
                      controller.currentIndex.value = index;
                      print(
                          'Current index: ${controller.currentIndex.value}'); // Debug line
                    },
                  ),
                  items: controller.carouselItems.map((item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          // color: item["color"],
                          color: HexColor('#FFFFFF'),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 0),
                                color: HexColor('#1B4584').withOpacity(0.05),
                                blurRadius: 4.0,
                                spreadRadius: 4.0,
                                blurStyle: BlurStyle.normal)
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 9.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    item["text"],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed('/request-details');
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          'View Details ',
                                          style: TextStyle(
                                              fontSize: 8,
                                              color: secondaryColor),
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          size: 8,
                                          color: secondaryColor,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.calendar_month,
                                      size: 12, color: textColor),
                                  Text("  ${item["date"]}  |  ${item["price"]}",
                                      style: TextStyle(fontSize: 10.50)),
                                  Spacer(),
                                  Icon(
                                    Icons.radio_button_checked,
                                    color: HexColor("#C60808"),
                                    size: 12,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                // Dots Indicator
                // Dots Indicator
                SizedBox(height: 10),
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(controller.carouselItems.length,
                          (index) {
                        return Container(
                          width: 5,
                          height: 5,
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          child: controller.currentIndex.value == index
                              ? SvgPicture.asset("assets/currentindex.svg")
                              : SvgPicture.asset("assets/otherindex.svg"),
                        );
                        // Container(
                        //   width:
                        //       controller.currentIndex.value == index ? 12 : 8,
                        //   height:
                        //       controller.currentIndex.value == index ? 12 : 8,
                        //   margin: EdgeInsets.symmetric(horizontal: 4),
                        //   decoration: BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     color: controller.currentIndex.value == index
                        //         ? Colors.blue
                        //         : Colors.grey,
                        //   ),
                        // );
                      }),
                    )),

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
                space(double.maxFinite, 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Top Specialties',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: HexColor('#0866C6')),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed('/specialities');
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: HexColor('#1E5A84')),
                      ),
                    ),
                  ],
                ),
                space(double.maxFinite, 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: specialcard(
                            'assets/type1.svg', 'Anesthesiology', 1)),
                    space(20.0, 0.0),
                    Expanded(
                        child:
                            specialcard('assets/type2.svg', 'Cardiology', 2)),
                    space(20.0, 0.0),
                    Expanded(
                        child:
                            specialcard('assets/type3.svg', 'Dermatology', 4)),
                    space(20.0, 0.0),
                    Expanded(
                        child: specialcard(
                            'assets/type4.svg', 'Emergency medicine', 5)),
                  ],
                ),
                space(double.maxFinite, 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: specialcard(
                            'assets/type4.svg', 'Endocrinology', 6)),
                    space(20.0, 0.0),
                    Expanded(
                        child: specialcard(
                            'assets/type6.svg', 'Gastroenterology', 7)),
                    space(20.0, 0.0),
                    Expanded(
                        child: specialcard(
                            'assets/type7.svg', 'Hospital Medicine', 8)),
                    space(20.0, 0.0),
                    Expanded(
                        child: specialcard(
                            'assets/type8.svg', 'Medical Oncology', 9)),
                  ],
                ),
                space(double.maxFinite, 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Top Locum',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: HexColor('#0866C6')),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: HexColor('#1E5A84')),
                    ),
                  ],
                ),
                space(double.maxFinite, 10.0),
                Obx(() => controller.data.isEmpty
                    ? Text('hello ${controller.data.length}')
                    : LimitedBox(
                        maxHeight: 680,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            final doctor = controller.data[index];
                            final imagePath =
                                doctor['profile_image']?.toString();
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  8.0, 0.0, 8.0, 16.0),
                              child: doctorcard(
                                imagePath.toString(),
                                '${doctor['first_name'] ?? ''} ${doctor['last_name'] ?? ''}',
                                doctor['medical_id']?.toString() ?? '',
                                doctor['about_me']?.toString() ??
                                    'No details provided',
                                doctor['total_exp']?.toString() ?? '0',
                                doctor['location']?.toString() ??
                                    'Not specified',
                                doctor['custom_id']?.toString() ?? '0',
                              ),
                            );
                          },
                        ),
                      )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Top Hospital',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: HexColor('#0866C6')),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: HexColor('#1E5A84')),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      hospitalcard(
                          'assets/hospital1.png',
                          'Apollo international hospital',
                          'Parsik Hill Road, Cbd Belapur, Navi Mumbai',
                          '5km away from your location',
                          '23',
                          '13',
                          '4.5'),
                      space(15.0, 0.0),
                      hospitalcard(
                          'assets/hospital1.png',
                          'Apollo international hospital',
                          'Parsik Hill Road, Cbd Belapur, Navi Mumbai',
                          '5km away from your location',
                          '23',
                          '13',
                          '4.5'),
                      space(15.0, 0.0),
                      hospitalcard(
                          'assets/hospital1.png',
                          'Apollo international hospital',
                          'Parsik Hill Road, Cbd Belapur, Navi Mumbai',
                          '5km away from your location',
                          '23',
                          '13',
                          '4.5'),
                      space(15.0, 0.0),
                      hospitalcard(
                          'assets/hospital1.png',
                          'Apollo international hospital',
                          'Parsik Hill Road, Cbd Belapur, Navi Mumbai',
                          '5km away from your location',
                          '23',
                          '13',
                          '4.5'),
                    ],
                  ),
                ),
                space(double.maxFinite, 35.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Top Clinic',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: HexColor('#0866C6')),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed('/clinics');
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: HexColor('#1E5A84')),
                      ),
                    ),
                  ],
                ),
                space(double.maxFinite, 10.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      hospitalcard(
                          'assets/hospital1.png',
                          'Apollo international hospital',
                          'Parsik Hill Road, Cbd Belapur, Navi Mumbai',
                          '5km away from your location',
                          '23',
                          '13',
                          '4.5'),
                      space(15.0, 0.0),
                      hospitalcard(
                          'assets/hospital1.png',
                          'Apollo international hospital',
                          'Parsik Hill Road, Cbd Belapur, Navi Mumbai',
                          '5km away from your location',
                          '23',
                          '13',
                          '4.5'),
                      space(15.0, 0.0),
                      hospitalcard(
                          'assets/hospital1.png',
                          'Apollo international hospital',
                          'Parsik Hill Road, Cbd Belapur, Navi Mumbai',
                          '5km away from your location',
                          '23',
                          '13',
                          '4.5'),
                      space(15.0, 0.0),
                      hospitalcard(
                          'assets/hospital1.png',
                          'Apollo international hospital',
                          'Parsik Hill Road, Cbd Belapur, Navi Mumbai',
                          '5km away from your location',
                          '23',
                          '13',
                          '4.5'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
