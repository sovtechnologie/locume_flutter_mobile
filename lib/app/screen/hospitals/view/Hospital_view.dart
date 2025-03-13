import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../Theme/theme.dart';
import '../../../../widget/reusedwidget.dart';
import '../controller/Hospital_Controller.dart';

class HospitalView extends GetView<HospitalController> {
  HospitalView({super.key}) {
    // Instantiate the controller here
    Get.put(HospitalController());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: Column(
            children: [
              space(double.maxFinite, 20.0),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 0),
                        color: HexColor('#1B4584').withOpacity(0.05),
                        blurRadius: 4.0,
                        spreadRadius: 4.0,
                        blurStyle: BlurStyle.normal)
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                ),
                child: TextField(
                  strutStyle: const StrutStyle(
                      fontSize: 10, fontWeight: FontWeight.bold),
                  style: GoogleFonts.inter(
                      color: Colors.black, fontWeight: FontWeight.w300),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: HexColor('#2C72C0'),
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    fillColor: HexColor("#FFFFFF"),
                    filled: true,
                    hintText: "Search",
                    hintStyle: GoogleFonts.inter(
                      fontSize: 12,
                      color: HexColor('#AAAAAA').withOpacity(0.7),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              space(double.maxFinite, 20.0),
              locationbuttonsandfilter('Mumbai'),
              space(double.maxFinite, 10.0),
              Obx(
                () => controller.data.value.isEmpty
                    ? Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: LoadingAnimationWidget.hexagonDots(
                            color: Colors.yellow,
                            size: 20,
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: controller.data.value.length,
                          itemBuilder: (context, index) {
                            final hospital = controller.data.value[index];
                            // final imagePath =
                            //     hospital['profile_image']?.toString();

                            return hospitalcard(
                                hospital.hospitalImage ?? '',
                                hospital.hospitalName ?? '',
                                hospital.hospitalLocation ?? '',
                                "",
                                "23",
                                "13",
                                "4.5",
                                hospital.id ?? 0);
                          },
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
