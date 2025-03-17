import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:locume/Theme/theme.dart';
import 'package:locume/app/screen/manage/controller/manage_Controller.dart';
import 'package:locume/app/screen/requestLocumDetails/binding/request_details_binding.dart';
import 'package:locume/app/screen/requestLocumDetails/view/request_details_view.dart';
import 'package:locume/app/screen/requestLocumDetails/view/request_raisedbyMe_details.dart';

class ManageView extends GetView<ManageController> {
  ManageView({super.key}) {
    Get.put(ManageController());
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate the button width
    double buttonWidth = (screenWidth - 40) / 2;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Manage"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              // Replace TabBar with ButtonsTabBar
              Container(
                child: ButtonsTabBar(
                  backgroundColor: primaryColor,
                  unselectedBackgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  unselectedLabelStyle: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                  borderColor: primaryColor,
                  borderWidth: 1,
                  unselectedBorderColor: primaryColor,
                  radius: 5,
                  contentCenter: true,
                  width: buttonWidth, // Use calculated width for buttons
                  tabs: [
                    _buildButtonTab("Request Raised"),
                    _buildButtonTab("Request Responded"),
                    // _buildButtonTab("Completed"),
                  ],
                ),
              ),
              // TabBarView remains below the ButtonsTabBar
              Expanded(
                child: TabBarView(
                  children: [
                    _requestRaised("Locum Request Raised"),
                    _applidedbyMe("Accepted"),
                    // _buildTabContent("Completed"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonTab(String label) {
    return Tab(
      text: label,
    );
  }

  Widget _requestRaised(String status) {
    // final controller = Get.find<ManageController>(); // Find the controller

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Obx(() {
        if (controller.raisedrequest.isEmpty) {
          return Center(
              child: Text("No requests found")); // Show message if no data
        }

        return Expanded(
          child: ListView.builder(
            itemCount: controller.raisedrequest.length,
            itemBuilder: (context, index) {
              final request = controller.raisedrequest[index];

              return manage_card(
                request.hospitalName ?? "Unknown Hospital",
                "${request.address}, ${request.city}, ${request.state}, ${request.pincode}",
                formatDateRange(request.startDate?.toIso8601String(),
                    request.endDate?.toIso8601String()),
                request.shift ?? "N/A",
                "${request.firstRange} - ${request.secondRange}",
                "OPD Nurse",
                "",
                request.bookingType!,
                request.id ?? 0,
                true,
              );
            },
          ),
        );
      }),
    );
  }

  String formatDateRange(dynamic start, dynamic end) {
    DateTime startDate = DateTime.parse(start);
    DateTime endDate = DateTime.parse(end);

    String startDay = DateFormat('d').format(startDate); // Day only
    String startMonth = DateFormat('MMM').format(startDate); // Month
    String startWeekday = DateFormat('EEE').format(startDate); // Weekday

    String endDay = DateFormat('d').format(endDate); // Day only
    String endMonth = DateFormat('MMM').format(endDate); // Month
    String endWeekday = DateFormat('EEE').format(endDate); // Weekday

    String year = DateFormat('yyyy').format(startDate); // Year

    if (startMonth == endMonth) {
      return "$startDay-$endDay $startMonth $year ($startWeekday-$endWeekday)";
    } else {
      return "$startDay $startMonth - $endDay $endMonth $year ($startWeekday-$endWeekday)";
    }
  }

  Widget _applidedbyMe(String status) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Obx(() {
        if (controller.respondedrequest.isEmpty) {
          return Center(
              child: Text("No requests found")); // Show message if no data
        }

        return Expanded(
          child: ListView.builder(
            itemCount: controller.respondedrequest.length,
            itemBuilder: (context, index) {
              final request = controller.respondedrequest[index];

              return manage_card(
                request.hospitalName ?? "Unknown Hospital",
                "${request.address}, ${request.city}, ${request.state}, ${request.pincode}",
                formatDateRange(request.startDate?.toIso8601String(),
                    request.endDate?.toIso8601String()),
                request.shift ?? "N/A",
                "${request.firstRange} - ${request.secondRange}",
                "OPD Nurse",
                "Required data from Api",
                request.bookingType!,
                request.id ?? 0,
              );
            },
          ),
        );
      }),
    );
  }

  Widget manage_card(String title, String address, String date, String time,
      String price, String role, String accpetedby, int bookingType, int id,
      [bool isRequestRaised = false]) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, left: 5.0, right: 5.0),
      child: Container(
        width: double.maxFinite,
        // height: 200,
        decoration: BoxDecoration(
          // color: item["color"],
          color: HexColor('#FFFFFF'),
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
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
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      overflow: TextOverflow.visible, // Ensure full visibility
                      softWrap: false, // Keep it in one line
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.radio_button_checked,
                    color: bookingType == 1
                        ? HexColor("#C60808")
                        : HexColor("#007C02"),
                    size: 12,
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.place,
                    color: Colors.grey[600],
                    size: 12,
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      address,
                      style: TextStyle(
                          fontSize: 10.50,
                          fontWeight: FontWeight.w400,
                          color: HexColor('#333333')),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Icon(Icons.calendar_month, size: 12, color: Colors.grey[600]),
                  Text("  $date  |  ₹$price/hour",
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
                  Text("  $time",
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
                  Text("  $role",
                      style: TextStyle(
                          fontSize: 10.50,
                          fontWeight: FontWeight.w400,
                          color: HexColor('#333333'))),
                ],
              ),
              if (accpetedby.isNotEmpty)
                SizedBox(
                  height: 8,
                ),
              if (accpetedby.isNotEmpty)
                Row(
                  children: [
                    SvgPicture.asset('assets/opd.svg',
                        width: 12, height: 12, color: HexColor('#333333')),
                    Text("  Accepted By $accpetedby",
                        style: TextStyle(
                            fontSize: 10.50,
                            fontWeight: FontWeight.w400,
                            color: HexColor('#333333'))),
                  ],
                ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 22,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                  ),
                  onPressed: () {
                    if (isRequestRaised == true) {
                      Get.to(RequestRaisedbymeDetails(),
                          binding: RequestDetailsBinding(id: id));
                    } else {
                      Get.to(RequestDetailsView(),
                          binding: RequestDetailsBinding(id: id));
                    }
                  },
                  child: Text(
                    "View Details",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
