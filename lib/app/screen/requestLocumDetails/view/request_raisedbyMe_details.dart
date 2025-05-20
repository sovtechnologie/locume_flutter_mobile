import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:locume/Theme/theme.dart';
import 'package:locume/app/screen/hospitalDetails/binding/h_details_binding.dart';
import 'package:locume/app/screen/hospitalDetails/view/h_details_view.dart';
import 'package:locume/app/screen/requestLocumDetails/controller/request_details_controller.dart';
import 'package:get/get.dart';
import 'package:locume/widget/a&c_button.dart';
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
        title: Text('View Details'),
      ),
      body: Obx(() {
        if (controller.isLoding.value ||
            controller.requestRaisedDetails.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Apollo international hospital",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: primaryColor),
                                  overflow: TextOverflow.ellipsis,
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
                              Get.to(HDetailsView(),
                                  binding: HDetailsBinding(
                                      hospitalId: 80, isClinic: false));
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(
                                'View',
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
                              "22-24 Jan 2025 (Sat-Mon)  |  ₹100Per hour",
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
                header("Doctors Applied For Role"),
                ReqRaisedCard(),
                ReqRaisedCard(),
                ReqRaisedCard(),
              ],
            ),
          ),
        );
      }),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
      //   child: Obx(() => AnimatedContainer(
      //         duration: Duration(milliseconds: 300), // Animation duration
      //         curve: Curves.easeInOut, // Smooth transition effect
      //         decoration: BoxDecoration(
      //           color: controller.reqStatus.value ? primaryColor : Colors.white,
      //           border:
      //               Border.all(color: primaryColor, width: 2), // Border effect
      //           borderRadius: BorderRadius.circular(10),
      //         ),
      //         child: ElevatedButton(
      //           onPressed: () {
      //             controller.ActiveOrDeactiveReq(
      //                 controller.requestRaisedDetails[0].isActive == true
      //                     ? false
      //                     : true,
      //                 controller.requestRaisedDetails[0].userId ?? 0,
      //                 controller.requestRaisedDetails[0].id ?? 0);
      //             // Toggle status on button press
      //             // controller.reqStatus.value = !controller.reqStatus.value;
      //           },
      //           style: ElevatedButton.styleFrom(
      //             padding: EdgeInsets.symmetric(vertical: 8), // Button height
      //             backgroundColor:
      //                 Colors.transparent, // Use AnimatedContainer color
      //             shadowColor: Colors.transparent, // Remove default shadow
      //             shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(10)),
      //           ),
      //           child: AnimatedSwitcher(
      //             duration:
      //                 Duration(milliseconds: 300), // Text switch animation
      //             child: controller.ReqLoding.value
      //                 ? Container(
      //                     height: 20,
      //                     width: 20,
      //                     child: CircularProgressIndicator(
      //                       color: controller.reqStatus.value
      //                           ? Colors.white
      //                           : primaryColor,
      //                       strokeWidth: 1,
      //                     ),
      //                   )
      //                 : Text(
      //                     controller.reqStatus.value
      //                         ? "Activate"
      //                         : "Deactivate",
      //                     key: ValueKey(controller
      //                         .reqStatus.value), // Ensures smooth animation
      //                     style: TextStyle(
      //                       fontWeight: FontWeight.w500,
      //                       color: controller.reqStatus.value
      //                           ? Colors.white
      //                           : primaryColor,
      //                     ),
      //                   ),
      //           ),
      //         ),
      //       )),
      // ),
    );
  }
}
