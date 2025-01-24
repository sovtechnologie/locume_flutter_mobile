import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:locume/Theme/theme.dart';
import 'package:locume/app/screen/manage/controller/manage_Controller.dart';

class ManageView extends GetView<ManageController> {
  ManageView({super.key});

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
                    _buildButtonTab("Locum Request Raised"),
                    _buildButtonTab("Applied By Me"),
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            manage_card(
                "Apollo international hospital",
                "Parsik Hill Road, Cbd Belapur, Navi Mumbai Parsik Hill Road, Cbd Belapur, Navi Mumbai",
                "22-24 Jan 2025 (Sat-Mon)",
                "2:00 P.M - 10:00 P.M (Evening Shift)",
                "100",
                "OPD Nurse",
                "Dr denies Martine"),
            manage_card(
                "Apollo international hospital",
                "Parsik Hill Road, Cbd Belapur, Navi Mumbai Parsik Hill Road, Cbd Belapur, Navi Mumbai",
                "22-24 Jan 2025 (Sat-Mon)",
                "2:00 P.M - 10:00 P.M (Evening Shift)",
                "100",
                "OPD Nurse",
                "Dr denies Martine"),
            manage_card(
                "Apollo international hospital",
                "Parsik Hill Road, Cbd Belapur, Navi Mumbai Parsik Hill Road, Cbd Belapur, Navi Mumbai",
                "22-24 Jan 2025 (Sat-Mon)",
                "2:00 P.M - 10:00 P.M (Evening Shift)",
                "100",
                "OPD Nurse",
                "Dr denies Martine"),
            manage_card(
                "Apollo international hospital",
                "Parsik Hill Road, Cbd Belapur, Navi Mumbai Parsik Hill Road, Cbd Belapur, Navi Mumbai",
                "22-24 Jan 2025 (Sat-Mon)",
                "2:00 P.M - 10:00 P.M (Evening Shift)",
                "100",
                "OPD Nurse",
                "Dr denies Martine")
          ],
        ),
      ),
    );
  }

  Widget _applidedbyMe(String status) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            manage_card(
                "Apollo international hospital",
                "Parsik Hill Road, Cbd Belapur, Navi Mumbai Parsik Hill Road, Cbd Belapur, Navi Mumbai",
                "22-24 Jan 2025 (Sat-Mon)",
                "2:00 P.M - 10:00 P.M (Evening Shift)",
                "100",
                "OPD Nurse",
                "Dr denies Martine"),
            manage_card(
                "Apollo international hospital",
                "Parsik Hill Road, Cbd Belapur, Navi Mumbai Parsik Hill Road, Cbd Belapur, Navi Mumbai",
                "22-24 Jan 2025 (Sat-Mon)",
                "2:00 P.M - 10:00 P.M (Evening Shift)",
                "100",
                "OPD Nurse",
                "Dr denies Martine"),
            manage_card(
                "Apollo international hospital",
                "Parsik Hill Road, Cbd Belapur, Navi Mumbai Parsik Hill Road, Cbd Belapur, Navi Mumbai",
                "22-24 Jan 2025 (Sat-Mon)",
                "2:00 P.M - 10:00 P.M (Evening Shift)",
                "100",
                "OPD Nurse",
                "Dr denies Martine"),
            manage_card(
                "Apollo international hospital",
                "Parsik Hill Road, Cbd Belapur, Navi Mumbai Parsik Hill Road, Cbd Belapur, Navi Mumbai",
                "22-24 Jan 2025 (Sat-Mon)",
                "2:00 P.M - 10:00 P.M (Evening Shift)",
                "100",
                "OPD Nurse",
                "Dr denies Martine")
          ],
        ),
      ),
    );
  }

  Widget manage_card(String title, String address, String date, String time,
      String price, String role, String accpetedby) {
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
                    color: HexColor("#C60808"),
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
              SizedBox(
                height: 8,
              ),
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
                    Get.toNamed('/request-details');
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
