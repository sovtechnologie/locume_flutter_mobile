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
        // appBar: AppBar(
        //     backgroundColor: Colors.white,
        //     centerTitle: false,
        //     leading: Builder(
        //       builder: (context) => IconButton(
        //         icon: Icon(
        //           Icons.menu_rounded,
        //           color: HexColor('#0866C6'),
        //         ),
        //         onPressed: () {
        //           Scaffold.of(context).openDrawer();
        //         },
        //       ),
        //     ),
        //     title: Text(
        //       'Hi, Sa',
        //       style: TextStyle(
        //           fontWeight: FontWeight.w500,
        //           fontSize: 14,
        //           color: HexColor('#174666')),
        //     ),
        //     actions: [
        //       InkWell(
        //         onTap: () {
        //           Get.toNamed('/notification');
        //         },
        //         child: Container(
        //           padding:
        //           const EdgeInsets.all(8.0), // Adjust the padding as needed
        //           child: Transform.translate(
        //             offset: const Offset(-15, 0),
        //             child: Icon(
        //               Icons.notifications_active_rounded,
        //               color: HexColor('#0866C6'),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ]),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
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
                () => controller.data.isEmpty
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
                          itemCount: controller.data.length,
                          itemBuilder: (context, index) {
                            final hospital = controller.data[index];
                            // final imagePath =
                            //     hospital['profile_image']?.toString();

                            return Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 0.0, 8.0, 16.0),
                                child: hospitalcard(
                                  hospital['hospital_image']?.toString() ?? '',
                                  hospital['hospital_name']?.toString() ?? '',
                                  hospital['hospital_location']?.toString() ??
                                      '',
                                  hospital['id']?.toString() ?? '',
                                ));
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
