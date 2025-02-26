import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:locume/Theme/theme.dart';
import 'package:locume/app/screen/requestLocumDetails/controller/request_details_controller.dart';
import 'package:get/get.dart';
import 'package:locume/widget/reusedwidget.dart';

class RequestRaisedbymeDetails extends GetView<RequestDetailsController> {
  final ScrollController scrollController = ScrollController();

  void scrollForward() {
    scrollController.animateTo(
      scrollController.offset + 310, // Adjust width based on your card size
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void scrollBackward() {
    scrollController.animateTo(
      scrollController.offset - 310, // Adjust width based on your card size
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OPD Nurse'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  decoration: BoxDecoration(),
                  height: 200,
                  width: double.maxFinite,
                  child: Image.asset(
                    'assets/hospital.png',
                    fit: BoxFit.fill,
                  )),
              SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    "Apollo international hospital",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  Spacer(),
                  Text("Edit")
                ],
              ),
              Text(
                "Multi super specialty hospital",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.place,
                    color: Colors.grey[600],
                    size: 15,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Parsik Hill Road, Cbd Belapur, Navi Mumbai",
                    style: TextStyle(
                        fontSize: 10.50,
                        fontWeight: FontWeight.w400,
                        color: HexColor('#333333')),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Icon(Icons.calendar_month, size: 12, color: Colors.grey[600]),
                  Text("  22-24 Jan 2025 (Sat-Mon)  |  ₹100/hour",
                      style: TextStyle(
                          fontSize: 10.50,
                          fontWeight: FontWeight.w400,
                          color: HexColor('#333333'))),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Icon(Icons.schedule, size: 12, color: Colors.grey[600]),
                  Text("  2:00 P.M - 10:00 P.M (Evening Shift)",
                      style: TextStyle(
                          fontSize: 10.50,
                          fontWeight: FontWeight.w400,
                          color: HexColor('#333333'))),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/opd.svg',
                      width: 12, height: 12, color: HexColor('#333333')),
                  // Image.asset(
                  //   'assets/opd.png',
                  //   width: 10,
                  //   height: 10,
                  //   color: HexColor('#333333'),
                  // ),

                  Text("  OPD Nurse",
                      style: TextStyle(
                          fontSize: 10.50,
                          fontWeight: FontWeight.w400,
                          color: HexColor('#333333'))),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Text(
                    "Doctors Applied For Role",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: primaryColor, width: 1), // Circle Border
                    ),
                    child: GestureDetector(
                      onTap: scrollBackward,
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: primaryColor,
                        size: 18,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: primaryColor, width: 1), // Circle Border
                    ),
                    child: GestureDetector(
                      onTap: scrollForward,
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        color: primaryColor,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 170,
                child: Obx(() => SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: scrollController,
                      child: Row(
                        children: controller.doctorList.map((doctor) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: smalldoctorcard(
                                doctor["image"]!,
                                doctor["name"]!,
                                doctor["md"]!,
                                doctor["work"]!,
                                doctor["experience"]!,
                                doctor["location"]!,
                                doctor["id"]!,
                                true),
                          );
                        }).toList(),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
        child: Obx(() => AnimatedContainer(
              duration: Duration(milliseconds: 300), // Animation duration
              curve: Curves.easeInOut, // Smooth transition effect
              decoration: BoxDecoration(
                color: controller.reqStatus.value ? primaryColor : Colors.white,
                border:
                    Border.all(color: primaryColor, width: 2), // Border effect
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Toggle status on button press
                  controller.reqStatus.value = !controller.reqStatus.value;
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 8), // Button height
                  backgroundColor:
                      Colors.transparent, // Use AnimatedContainer color
                  shadowColor: Colors.transparent, // Remove default shadow
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: AnimatedSwitcher(
                  duration:
                      Duration(milliseconds: 300), // Text switch animation
                  child: Text(
                    controller.reqStatus.value ? "Activate" : "Deactivate",
                    key: ValueKey(
                        controller.reqStatus.value), // Ensures smooth animation
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: controller.reqStatus.value
                          ? Colors.white
                          : primaryColor,
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
