import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';
import 'package:locume/Theme/theme.dart';
import 'package:locume/app/screen/requestLocum/controller/req-locum-controller.dart';

class RequestLocumView extends GetView<RequestLocumController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              request_card(
                  "Apollo International Hospital",
                  "Parsik Hill Road, Cbd Belapur, Navi Mumbai",
                  "22-24 Jan 2025 (Sat-Mon)",
                  "100",
                  "OPD Nurse"),
              request_card(
                  "Apollo International Hospital",
                  "Parsik Hill Road, Cbd Belapur, Navi Mumbai",
                  "22-24 Jan 2025 (Sat-Mon)",
                  "100",
                  "OPD Nurse"),
              request_card(
                  "Apollo International Hospital",
                  "Parsik Hill Road, Cbd Belapur, Navi Mumbai",
                  "22-24 Jan 2025 (Sat-Mon)",
                  "100",
                  "OPD Nurse"),
              request_card(
                  "Apollo International Hospital",
                  "Parsik Hill Road, Cbd Belapur, Navi Mumbai",
                  "22-24 Jan 2025 (Sat-Mon)",
                  "100",
                  "OPD Nurse"),
              request_card(
                  "Apollo International Hospital",
                  "Parsik Hill Road, Cbd Belapur, Navi Mumbai",
                  "22-24 Jan 2025 (Sat-Mon)",
                  "100",
                  "OPD Nurse"),
            ],
          ),
        ),
      ),
    );
  }
}

Widget request_card(
    String title, String address, String date, String price, String role) {
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
                  size: 15,
                ),
                SizedBox(width: 5),
                SizedBox(
                  width:
                      200, // Keep width equal to header width to avoid crossing
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
                SvgPicture.asset('assets/opd.svg',
                    width: 12, height: 12, color: HexColor('#333333')),
                // Image.asset(
                //   'assets/opd.png',
                //   width: 10,
                //   height: 10,
                //   color: HexColor('#333333'),
                // ),

                Text("  $role",
                    style: TextStyle(
                        fontSize: 10.50,
                        fontWeight: FontWeight.w400,
                        color: HexColor('#333333'))),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    print("View Details");
                  },
                  child: Text(
                    "View Details",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: primaryColor),
                  ),
                ),
                SizedBox(width: 15),
                InkWell(
                  onTap: () {
                    print("Accept Request");
                  },
                  child: Text(
                    "Accept Request",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: primaryColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
