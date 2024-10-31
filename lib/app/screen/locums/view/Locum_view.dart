import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          'All Locum’s ',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600, fontSize: 22, color: Colors.white),
        ),
        actions: [
          Transform.translate(
              offset: Offset(-15, 0),
              child: Icon(
                Icons.notifications_active_rounded,
                color: HexColor('#0866C6'),
              ))
        ],
      ),
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
                strutStyle:
                    const StrutStyle(fontSize: 10, fontWeight: FontWeight.bold),
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
                  hintText: "Text",
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
            space(double.maxFinite, 35.0),
            controller.data.isEmpty
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
                    // Use Expanded to let ListView fill the available space
                    child: ListView.builder(
                      controller: controller.scrollController,
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              const EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 0.0),
                          child: Column(
                            children: [
                              doctorcard(
                                controller.data[index]['image'].toString(),
                                controller.data[index]['name'].toString(),
                                controller.data[index]['md'].toString(),
                                controller.data[index]['work'].toString(),
                                controller.data[index]['experience'].toString(),
                                controller.data[index]['location'].toString(),
                              ),
                              space(double.maxFinite, 20.0),
                            ],
                          ),
                        );
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
