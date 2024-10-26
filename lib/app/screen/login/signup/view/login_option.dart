import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:locume/app/screen/login/signup/controller/login_controller.dart';

class LoginOptionView extends GetView<LoginController> {
  LoginOptionView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform.translate(
                offset: const Offset(-100, -20),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      backgroundColor: HexColor('#0866C6').withOpacity(0.3),
                      radius: 150,
                    )),
              ),
              Transform.translate(
                offset: const Offset(100, 30),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: HexColor('#0866C6').withOpacity(0.3),
                      radius: 150,
                    )),
              ),
            ],
          ),
          Align(
              alignment: Alignment.center,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 200, sigmaY: 200, tileMode: TileMode.mirror),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/logo.svg'),
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(52.0, 50.0, 40.0, 50.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: HexColor('#070707')),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
                      child: GestureDetector(
                        onTap: () {
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
                            'Login',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: HexColor('#FFFFFF')),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 5.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed('/signup');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 54,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: HexColor('#0866C6'),
                                  width: 1.0,
                                  strokeAlign: BorderSide.strokeAlignOutside),
                              color: HexColor('#FFFFFF'),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Sign up',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: HexColor('#0866C6')),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ]),
      ),
    );
  }
}
