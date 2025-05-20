import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../Theme/theme.dart';
import '../../../../widget/reusedwidget.dart';
import '../controller/Locum_Controller.dart';

class LocumView extends GetView<LocumController> {
  LocumView({super.key}) {
    // Instantiate the controller here
    Get.put(LocumController());
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
        //       'Locu',
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
                      blurStyle: BlurStyle.normal,
                    )
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                ),
                child: TextField(
                  onChanged: (value) {
                    if (value.isEmpty) {}
                  },
                  strutStyle: const StrutStyle(
                      fontSize: 10, fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: HexColor('#2C72C0'),
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        )),
                    disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        )),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        )),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        )),
                    fillColor: HexColor("#FFFFFF"),
                    filled: true,
                    hintText: "Search",
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: HexColor('#AAAAAA').withOpacity(0.7),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              space(double.maxFinite, 20.0),
              // locationbuttonsandfilter('Mumbai'),
              // space(double.maxFinite, 10.0),
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
                            final doctor = controller.data.value[index];
                            final imagePath = doctor.profileImage;

                            return Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  8.0, 0.0, 8.0, 16.0),
                              child: doctorcard(
                                context,
                                imagePath.toString(),
                                '${doctor.firstName ?? ''} ${doctor.lastName ?? ''}',
                                doctor.medicalId ?? '',
                                doctor.aboutMe ?? 'No details provided',
                                doctor.totalExp.toString() ?? '0',
                                doctor.location ?? 'Not specified',
                                doctor.customId ?? '0',
                              ),
                            );
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
