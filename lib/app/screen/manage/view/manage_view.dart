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
import 'package:locume/widget/reusedwidget.dart';

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
                // "${request.address}, ${request.city}, ${request.state}, ${request.pincode}",
                formatDateRange(request.startDate?.toIso8601String(),
                    request.endDate?.toIso8601String()),
                request.shift ?? "N/A",
                // "${request.firstRange} - ${request.secondRange}",
                // "OPD Nurse",
                // "",
                // request.bookingType!,
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
                // "${request.address}, ${request.city}, ${request.state}, ${request.pincode}",
                formatDateRange(request.startDate?.toIso8601String(),
                    request.endDate?.toIso8601String()),
                request.shift ?? "N/A",
                // "${request.firstRange} - ${request.secondRange}",
                // "OPD Nurse",
                // "Required data from Api",
                // request.bookingType!,
                request.id ?? 0,
              );
            },
          ),
        );
      }),
    );
  }
}
