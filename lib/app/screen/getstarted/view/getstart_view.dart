import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controller/getstrat_controller.dart';

class Start1View extends GetView<Start1Controller> {
  Start1View({super.key});

  final List<Widget> items = [
    Column(
      children: [
        Image.asset(
          'assets/image.jpg',
          alignment: Alignment.topLeft,
          width: double.maxFinite,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
          child: Text(
            'Find Trusted Locum’s',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 28,
                color: HexColor('#333333')),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
          child: Text(
            textAlign: TextAlign.center,
            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
            style: GoogleFonts.rubik(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: HexColor('#677294').withOpacity(0.9)),
          ),
        ),
        // space(double.maxFinite, 42.0),
      ],
    ),
    Column(
      children: [
        Image.asset(
          'assets/image2.jpg',
          alignment: Alignment.topRight,
          width: double.maxFinite,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
          child: Text(
            'Choose Best Locum’s',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 28,
                color: HexColor('#333333')),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
          child: Text(
            textAlign: TextAlign.center,
            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
            style: GoogleFonts.rubik(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: HexColor('#677294').withOpacity(0.9)),
          ),
        ),
      ],
    ),
    Column(
      children: [
        Image.asset(
          'assets/image1.jpg',
          alignment: Alignment.topLeft,
          width: double.maxFinite,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
          child: Text(
            'Easy Locum’s Finding',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 28,
                color: HexColor('#333333')),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
          child: Text(
            textAlign: TextAlign.center,
            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
            style: GoogleFonts.rubik(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: HexColor('#677294').withOpacity(0.9)),
          ),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.translate(
              offset: const Offset(100, 30),
              child: Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  backgroundColor: HexColor('#0866C6').withOpacity(0.3),
                  radius: 150,
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 200, sigmaY: 100, tileMode: TileMode.mirror),
            child: Column(
              children: [
                CarouselSlider(
                  items: items,
                  options: CarouselOptions(
                    padEnds: false,
                    height: 660,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                    autoPlayInterval: const Duration(seconds: 7),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.easeIn,
                    enlargeCenterPage: false,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      controller.updateIndex(index);
                    },
                  ),
                ),
                // space(double.maxFinite, 10.0),
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(items.length, (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 600),
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          width: controller.currentIndex.value == index
                              ? 42.0
                              : 17.0,
                          height: 17.0,
                          decoration: BoxDecoration(
                            color: controller.currentIndex.value == index
                                ? HexColor('#0866C6')
                                : HexColor('#D9D9D9'),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        );
                      }),
                    )),

                Padding(
                  padding: const EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 5.0),
                  child: GestureDetector(
                    onTap: () async {
                      await SessionManager().set('ishint_viewd', true);
                      Get.toNamed('/login');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 54,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: HexColor('#0866C6'),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Text(
                        textAlign: TextAlign.center,
                        'Get Started',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: HexColor('#FFFFFF')),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
