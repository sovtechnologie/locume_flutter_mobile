import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:locume/app/screen/SpecialitiesLocum(DR)/binding/SpecialitiesLocum(DR)_binding.dart';
import 'package:locume/app/screen/SpecialitiesLocum(DR)/view/SpecialitiesLocums(DR).dart';
import 'package:locume/app/screen/hospitalDetails/binding/h_details_binding.dart';
import 'package:locume/app/screen/hospitalDetails/view/h_details_view.dart';
import 'package:locume/app/screen/requestLocumDetails/binding/request_details_binding.dart';
import 'package:locume/app/screen/requestLocumDetails/controller/request_details_controller.dart';
import 'package:locume/app/screen/requestLocumDetails/view/request_details_view.dart';
import 'package:locume/app/screen/requestLocumDetails/view/request_raisedbyMe_details.dart';
import 'package:locume/widget/a&c_button.dart';

import '../Theme/textTheme.dart';
import '../Theme/theme.dart';

space(wid, hit) {
  return SizedBox(
    width: wid,
    height: hit,
  );
}

specialcard(String svg, String title, int id) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      InkWell(
        onTap: () {
          Get.to(SpecialitieslocumsDR(),
              binding:
                  SpecialitieslocumdrBinding(specialtyId: id, name: title));

          print(id);
        },
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: HexColor('#FFFFFF'),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 2),
                  color: HexColor('#326295').withOpacity(0.15),
                  blurRadius: 4.0,
                  spreadRadius: 0,
                  blurStyle: BlurStyle.normal)
            ],
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
                width: 40,
                height: 40,
                child: SvgPicture.asset(
                  svg,
                  fit: BoxFit.contain,
                )),
          ),
        ),
      ),
      space(double.maxFinite, 10.0),
      Text(
        overflow: TextOverflow.visible,
        maxLines: 1,
        softWrap: true,
        textAlign: TextAlign.center,
        title,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 9,
            color: HexColor('#326295')),
      ),
    ],
  );
}

doctorcard(BuildContext context, String image, String name, String md,
    String work, String exprience, String location, String id) {
  return InkWell(
    onTap: () {
      Get.toNamed('/dr-profile', arguments: id);
      print(id);
    },
    child: Container(
      width: double.maxFinite,
      height: 125,
      // width: double.maxFinite,
      decoration: BoxDecoration(
        color: HexColor('#FFFFFF'),
        border: Border.all(color: borderColor, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 110,
              width: 100,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: Image.network(
                    image,
                    fit: BoxFit
                        .fill, // Image.asset('assets/logo.png',width: 120,),
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/doctor-icon.jpg',
                        fit: BoxFit.fill,
                      ); // Fallback widget
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child; // When loading is complete
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null, // Show progress indicator
                        ),
                      );
                    },
                  )),
            ),
            space(10.0, 0.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                space(0.0, 3.0),
                Text(
                  name,
                  overflow: TextOverflow.visible,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 18,
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.49,
                  color: borderColor,
                ),
                Spacer(),
                Text(
                  md,
                  overflow: TextOverflow.visible,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 12,
                    color: secondaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "Apollo hospital, thane west",
                  style: TextStyle(
                    fontSize: 12,
                    color: secondaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  'View Profile',
                  overflow: TextOverflow.visible,
                  softWrap: true,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: HexColor('#0866C6')),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget reviewscard(String name, int Rating, String review, String date) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5),
    child: Container(
      width: 270,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: HexColor('#F0F3F5'), // Background color
        border: Border.all(color: HexColor('#0866C6'), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30, // Adjust size as needed
                  backgroundImage: AssetImage('assets/doctor-icon.jpg'),
                  backgroundColor: Colors.grey,
                ),
                SizedBox(width: 10), // Space between avatar and text
                Expanded(
                  // Prevents overflow
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "Sam Curren",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            '12/12/2023',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      // Dynamic star rating
                      Row(
                        children: List.generate(
                          Rating, // Generate stars dynamically
                          (index) => Padding(
                            padding: const EdgeInsets.only(
                                right: 4.0), // Space between stars
                            child: Image.asset(
                              'assets/Star.png', // Your star asset
                              width: 12, // Adjust size as needed
                              height: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Responsible for diagnosing, examining, diseases, disorders, and illnesses of patients.',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              softWrap: true,
            )
          ],
        ),
      ),
    ),
  );
}

Widget smalldoctorcard(String image, String name, String md, String work,
    String experience, String location, int id, int userId,
    [bool forRequest = false]) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: InkWell(
      onTap: () {
        Get.toNamed('/dr-profile', arguments: id);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.10),
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(0, 3), // Offset to make shadow visible
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/doctor-icon.jpg',
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: HexColor('#326295')),
                        ),
                        SizedBox(height: 3),
                        Text(md,
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w500)),
                        SizedBox(height: 3),
                        Text(work,
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w400)),
                        SizedBox(height: 3),
                        Text('$experience years experience',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: HexColor('#333333'))),
                        SizedBox(height: 3),
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                size: 10, color: Colors.grey[600]),
                            SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                location,
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: HexColor('#333333')),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 3),
                        Text(
                          'View Details',
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: primaryColor),
                        ),
                        // Row(
                        //   children: [
                        //     Icon(
                        //       Icons.done,
                        //       color: const Color.fromARGB(255, 84, 175, 76),
                        //     ),
                        //     SizedBox(
                        //       width: 10,
                        //     ),
                        //     Icon(
                        //       Icons.close,
                        //       color: Colors.red,
                        //     )
                        //   ],
                        // )
                      ],
                    ),
                  ),
                ],
              ),
              if (forRequest == true)
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Accept Button (Green Border & Text)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Get.find<RequestDetailsController>()
                                .changeLocumStatus(id, userId, 1);
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.green, // Text color
                            side: BorderSide(
                                color: Colors.green, width: 1), // Green border
                            backgroundColor:
                                Colors.transparent, // Transparent background
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // Border radius
                            ),
                          ),
                          child: Text("Accept"),
                        ),
                      ),
                      SizedBox(width: 10),
                      // Reject Button (Red Border & Text)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Get.find<RequestDetailsController>()
                                .changeLocumStatus(id, userId, 2);
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red, // Text color
                            side: BorderSide(
                                color: Colors.red, width: 1), // Red border
                            backgroundColor:
                                Colors.transparent, // Transparent background
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // Border radius
                            ),
                          ),
                          child: Text("Reject"),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    ),
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

Widget manage_card(String title, String date, String price, int id,
    [bool isRequestRaised = false]) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 4.0),
    child: Container(
      width: double.infinity,
      // height: 200,
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: HexColor('#FFFFFF'),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        border: Border.all(width: 1, color: borderColor),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 9, right: 9, top: 9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            overflow:
                                TextOverflow.visible, // Ensure full visibility
                            softWrap: false, // Keep it in one line
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: primaryColor),
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
                        if (isRequestRaised == true) {
                          Get.to(RequestRaisedbymeDetails(),
                              binding: RequestDetailsBinding(id: id));
                        } else {
                          Get.to(RequestDetailsView(),
                              binding: RequestDetailsBinding(id: id));
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          'View Details',
                          style: TextStyle(
                            fontSize: 10,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(Icons.calendar_month, size: 14, color: textColor),
                    SizedBox(width: 4),
                    Expanded(
                      child: Text("$date  |  ₹$price Per hour",
                          style: TextStyle(
                            fontSize: 12,
                          )),
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
                const SizedBox(
                  height: 10,
                ),

                // SizedBox(
                //   height: 8,
                // ),
                // Row(
                //   children: [
                //     Icon(Icons.schedule, size: 12, color: Colors.grey[600]),
                //     Text("  $time",
                //         style: TextStyle(
                //             fontSize: 10.50,
                //             fontWeight: FontWeight.w400,
                //             color: HexColor('#333333'))),
                //   ],
                // ),
                // SizedBox(
                //   height: 8,
                // ),
                // Row(
                //   children: [
                //     SvgPicture.asset('assets/opd.svg',
                //         width: 12, height: 12, color: HexColor('#333333')),
                //     Text("  $role",
                //         style: TextStyle(
                //             fontSize: 10.50,
                //             fontWeight: FontWeight.w400,
                //             color: HexColor('#333333'))),
                //   ],
                // ),
                // if (accpetedby.isNotEmpty)
                //   SizedBox(
                //     height: 8,
                //   ),
                // if (accpetedby.isNotEmpty)
                //   Row(
                //     children: [
                //       SvgPicture.asset('assets/opd.svg',
                //           width: 12, height: 12, color: HexColor('#333333')),
                //       Text("  Accepted By $accpetedby",
                //           style: TextStyle(
                //               fontSize: 10.50,
                //               fontWeight: FontWeight.w400,
                //               color: HexColor('#333333'))),
                //     ],
                //   ),
                // SizedBox(
                //   height: 12,
                // ),
                // SizedBox(
                //   height: 22,
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(4),
                //       ),
                //       padding: EdgeInsets.symmetric(horizontal: 8),
                //     ),
                //     onPressed: () {
                //       if (isRequestRaised == true) {
                //         Get.to(RequestRaisedbymeDetails(),
                //             binding: RequestDetailsBinding(id: id));
                //       } else {
                //         Get.to(RequestDetailsView(),
                //             binding: RequestDetailsBinding(id: id));
                //       }
                //     },
                //     child: Text(
                //       "View Details",
                //       style: TextStyle(
                //         fontSize: 10,
                //         fontWeight: FontWeight.w500,
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Material(
                  color: primaryColor,
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(15)),
                  child: InkWell(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15)),
                    onTap: () {
                      // your logic
                    },
                    child: Container(
                      height: 40,
                      child: const Center(
                        child: Text(
                          "Accept ",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 1, height: 40),
              Expanded(
                child: Material(
                  color: primaryColor,
                  borderRadius:
                      const BorderRadius.only(bottomRight: Radius.circular(15)),
                  child: InkWell(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(15)),
                    onTap: () {
                      // your logic
                    },
                    child: Container(
                      height: 40,
                      child: const Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

hospitalcard(String image, String name, String location, String distance,
    String numDoctor, String numSpeciality, String Rating, int id,
    [bool isClinic = false]) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {
        Get.to(HDetailsView(),
            binding: HDetailsBinding(hospitalId: id, isClinic: isClinic));

        print(id);
      },
      child: Container(
        decoration: BoxDecoration(
          color: HexColor('#FFFFFF'),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 2),
                color: HexColor('#326295').withOpacity(0.15),
                blurRadius: 8.0,
                spreadRadius: 1,
                blurStyle: BlurStyle.normal)
          ],
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 120,
                    width: 100,
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        child: Image.network(
                          image,
                          fit: BoxFit
                              .fill, // Image.asset('assets/logo.png',width: 120,),
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/hospital1.png',
                              fit: BoxFit.cover,
                            ); // Fallback widget
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child; // When loading is complete
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null, // Show progress indicator
                              ),
                            );
                          },
                        )),
                  ),
                  space(0.0, 5.0),
                  space(10.0, 0.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      space(10.0, 0.0),
                      Text(
                        name,
                        overflow: TextOverflow.visible,
                        softWrap: true,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: HexColor('#326295')),
                      ),
                      space(0.0, 5.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: SizedBox(
                              child: Icon(
                                Icons.location_on_sharp,
                                size: 10,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                          space(5.0, 0.0),
                          SizedBox(
                            width:
                                MediaQuery.of(Get.context!).size.width * 0.48,
                            child: Text(
                              textAlign: TextAlign.start,
                              location,
                              overflow: TextOverflow.visible,
                              softWrap: true,
                              style: TextStyle(
                                textBaseline: TextBaseline.ideographic,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                color: HexColor('#333333'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      space(0.0, 5.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/distancesvg.svg'),
                          space(5.0, 0.0),
                          Text(
                            distance,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: HexColor('#333333'),
                            ),
                          )
                        ],
                      ),
                      space(0.0, 5.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/Stethoscope.png',
                            height: 10,
                            width: 10,
                          ),
                          space(5.0, 0.0),
                          Text(
                            "$numDoctor doctors",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: HexColor('#2A7FBA'),
                            ),
                          )
                        ],
                      ),
                      space(0.0, 5.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/Nurturing.png',
                            height: 10,
                            width: 10,
                          ),
                          space(5.0, 0.0),
                          Text(
                            "$numSpeciality specialties",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: HexColor('#2A7FBA'),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    "assets/Star.png",
                    height: 12,
                    width: 12,
                  ),
                  space(5.0, 0.0),
                  Text(
                    Rating,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                  space(5.0, 0.0),
                  Text("Rating",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          color: HexColor('#2A7FBA'))),
                  space(25.0, 0.0),
                  Text(
                    '    View Details',
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: HexColor('#0866C6')),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}

locationbuttonsandfilter(String location) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        child: Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: primaryColor,
            ),
            Text(
              location,
              style: MyTextTheme.poppinsSubtitle(
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
      SvgPicture.asset('assets/filter.svg')
    ],
  );
}

Widget hospitalfullcard(String image, String name, String hospitalspecialty,
    String location, String distance, String doctors, String specialties) {
  return Padding(
    padding: const EdgeInsets.all(1.0),
    child: Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: HexColor('#FFFFFF'),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 2),
              color: HexColor('#326295').withOpacity(0.15),
              blurRadius: 8.0,
              spreadRadius: 1,
              blurStyle: BlurStyle.normal)
        ],
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              // width: 100,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: Image.network(
                    image,
                    fit: BoxFit.none,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.broken_image,
                          color: Colors.grey); // Fallback widget
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child; // When loading is complete
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null, // Show progress indicator
                        ),
                      );
                    },
                  )),
            ),
            space(0.0, 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        overflow: TextOverflow.visible,
                        softWrap: true,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      space(0.0, 2.0),
                      Text(
                        hospitalspecialty,
                        overflow: TextOverflow.visible,
                        softWrap: true,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Icon(
                      Icons.star_rate_rounded,
                      // size: 15,
                      color: Colors.amberAccent,
                    ),
                    Text(
                      '4.5',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          color: HexColor('#333333')),
                    ),
                    Text(
                      'Rating',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 7,
                          color: HexColor('#2A7FBA')),
                    ),
                  ],
                ),
              ],
            ),
            space(0.0, 9.0),
            Row(
              children: [
                const Icon(Icons.location_on_sharp, size: 20),
                space(5.0, 5.0),
                Flexible(
                  child: Text(
                    location,
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            space(0.0, 10.0),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/distancesvg.svg',
                  height: 15.0,
                ),
                space(7.0, 5.0),
                Flexible(
                  child: Text(
                    distance,
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            space(0.0, 10.0),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/distancesvg.svg',
                  height: 15.0,
                ),
                space(7.0, 5.0),
                Flexible(
                  child: Text(
                    doctors,
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            space(0.0, 10.0),
            Row(
              children: [
                const Icon(
                  Icons.savings,
                  size: 20,
                ),
                space(5.0, 5.0),
                Flexible(
                  child: Text(
                    specialties,
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget header(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5.0, top: 15),
    child: Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 16, color: primaryColor),
    ),
  );
}

policy(String title, String body) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        overflow: TextOverflow.visible,
        softWrap: true,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
      ),
      space(0.0, 20.0),
      Text(
        body,
        overflow: TextOverflow.visible,
        softWrap: true,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      ),
    ],
  );
}

Widget mylabel2(String label) {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0, bottom: 5),
    child: Text(
      label,
      style: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: primaryColor),
    ),
  );
}

Widget mytextfield(String hint, TextEditingController controller,
    [isNum = false]) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: TextField(
      controller: controller,
      keyboardType: isNum ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        fillColor: HexColor("#F8F7F7"),
        hintText: hint,
        contentPadding:
            EdgeInsets.symmetric(vertical: 5, horizontal: 12), // Adjust padding
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners
          borderSide: BorderSide(
              color: HexColor("#DCD7D7"), width: 1), // Gray when disabled
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners
          borderSide:
              BorderSide(color: primaryColor, width: 1), // Blue when enabled
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners
          borderSide: BorderSide(
              color: Color.fromARGB(124, 175, 175, 175),
              width: 1), // Default border
        ),
      ),
      style: TextStyle(fontSize: 14), // Adjust text size if needed
    ),
  );
}

Widget mybigtextfield(String hint, TextEditingController controller,
    [isNum = false]) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: TextField(
      controller: controller,
      keyboardType: isNum ? TextInputType.number : TextInputType.text,
      maxLines: 4, // Allows multiline input (adjust as needed)
      decoration: InputDecoration(
        filled: true,
        fillColor: HexColor("#F8F7F7"),
        hintText: hint,
        alignLabelWithHint: true, // Ensures hint aligns to the top
        contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12), // Adjust padding
        floatingLabelBehavior:
            FloatingLabelBehavior.always, // Keeps hint visible
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: HexColor("#DCD7D7"), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: primaryColor, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(color: Color.fromARGB(124, 175, 175, 175), width: 1),
        ),
      ),
      style: TextStyle(fontSize: 14),
    ),
  );
}

messagenotifications(problem, solution) {
  return Get.snackbar(problem, solution,
      overlayBlur: 20.0, overlayColor: Colors.white.withOpacity(0.7));
}

Widget cricleCard(String path, String value, String title, double size) {
  return Column(
    children: [
      Container(
        height: 60,
        width: 60,
        padding: EdgeInsets.all(size),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: HexColor("#EDF3FF")),
        child: SvgPicture.asset(
          path,
          color: primaryColor,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        value,
        style: TextStyle(
            fontSize: 14, color: primaryColor, fontWeight: FontWeight.w600),
      ),
      Text(
        title,
        style: TextStyle(
            fontSize: 13, color: secondaryColor, fontWeight: FontWeight.w400),
      ),
    ],
  );
}

Widget buildSpecialityCard({
  required int id,
  required String imagePath,
  required String title,
  required String description,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 13.0),
    child: InkWell(
      onTap: () {
        Get.to(SpecialitieslocumsDR(),
            binding: SpecialitieslocumdrBinding(specialtyId: id, name: title));
        print(id);
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              color: textColor.withOpacity(0.25),
              blurRadius: 4.0,
              spreadRadius: 0,
              blurStyle: BlurStyle.normal,
            )
          ],
          borderRadius: BorderRadius.circular(10),
          color: white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: Image.network(
                      imagePath,
                      width: 60,
                      height: 60,
                      fit: BoxFit.none,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.broken_image,
                            color: Colors.grey); // Fallback widget
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child; // When loading is complete
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null, // Show progress indicator
                          ),
                        );
                      },
                    )),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 15,
                          color: primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        description,
                        style: TextStyle(fontSize: 12, color: textColor),
                        overflow: TextOverflow.visible,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class SearchableDropdown extends StatefulWidget {
  final String hint;
  final List<String> options;
  final TextEditingController controller;
  final void Function(String)? onChanged;

  const SearchableDropdown({
    Key? key,
    required this.hint,
    required this.options,
    required this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  _SearchableDropdownState createState() => _SearchableDropdownState();
}

class _SearchableDropdownState extends State<SearchableDropdown> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  List<String> _filteredOptions = [];

  @override
  void initState() {
    super.initState();
    _filteredOptions = widget.options;
  }

  void _filterOptions(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredOptions = widget.options;
      } else {
        _filteredOptions = widget.options
            .where(
                (option) => option.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
    _showDropdown();
  }

  void _showDropdown() {
    _hideDropdown(); // Remove previous overlay before showing new one

    // Prevent showing dropdown if no options are available
    if (_filteredOptions.isEmpty) return;

    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final position = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        left: position.dx,
        top: position.dy + size.height + 5, // Adjust below the TextField
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 5),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            child: Container(
              constraints: const BoxConstraints(maxHeight: 150),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: _filteredOptions.map((option) {
                    return ListTile(
                      title: Text(option, style: const TextStyle(fontSize: 14)),
                      onTap: () => _selectOption(option),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
  }

  void _hideDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _selectOption(String value) {
    widget.controller.text = value;
    widget.onChanged?.call(value);
    _hideDropdown();
  }

  void _toggleDropdown() {
    if (_overlayEntry == null) {
      _showDropdown();
    } else {
      _hideDropdown();
    }
  }

  @override
  void dispose() {
    _hideDropdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: AbsorbPointer(
          absorbing: false,
          child: TextField(
            controller: widget.controller,
            onChanged: _filterOptions,
            decoration: InputDecoration(
              filled: true,
              fillColor: HexColor("#F8F7F7"),
              hintText: widget.hint,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: HexColor("#DCD7D7"),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: primaryColor, width: 1),
              ),
              suffixIcon: InkWell(
                onTap: _toggleDropdown,
                child: Icon(Icons.arrow_drop_down, color: primaryColor),
              ),
            ),
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }
}

ReqRaisedCard() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 4.0),
    child: Container(
      width: double.infinity,
      // height: 200,
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: HexColor('#FFFFFF'),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        border: Border.all(width: 1, color: borderColor),
      ),
      child: Column(
        children: [
          Padding(
              padding:
                  const EdgeInsets.only(left: 9, right: 9, top: 9, bottom: 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 90,
                    width: 80,
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        child: Image.network(
                          "https://locumedocument.s3.ap-south-1.amazonaws.com/1741586110601Hospital.jpg",
                          fit: BoxFit
                              .fill, // Image.asset('assets/logo.png',width: 120,),
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/doctor-icon.jpg',
                              fit: BoxFit.fill,
                            ); // Fallback widget
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child; // When loading is complete
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null, // Show progress indicator
                              ),
                            );
                          },
                        )),
                  ),
                  space(10.0, 0.0),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        space(0.0, 3.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Dr. Akhil Kumar",
                              overflow: TextOverflow.visible,
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 18,
                                color: primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'View Profile',
                              overflow: TextOverflow.visible,
                              softWrap: true,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: HexColor('#0866C6')),
                            ),
                          ],
                        ),
                        Divider(
                          color: borderColor,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "MBBS, MD, Cardiologist",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: secondaryColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                space(0.0, 3.0),
                                Text(
                                  "Apollo hospital, thane west",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: secondaryColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 1.0),
                              child: Text(
                                "3 Days ago",
                                style: TextStyle(
                                    fontSize: 9,
                                    color: HexColor("#4D4D4D"),
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )),
          AcceptCancelAnimatedCard()
        ],
      ),
    ),
  );
}

hospitalcard_v2(String image, String name, String location, String distance,
    String numDoctor, String numSpeciality, String Rating, int id,
    [bool isClinic = false]) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {
        Get.to(HDetailsView(),
            binding: HDetailsBinding(hospitalId: id, isClinic: isClinic));

        print(id);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: primaryColor,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: white)),
                Text(
                  "Multispeciality",
                  style: TextStyle(color: white, fontSize: 12),
                )
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(border: Border.all(color: borderColor)),
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hospital address:",
                    style: TextStyle(
                        fontSize: 12,
                        color: secondaryColor,
                        fontWeight: FontWeight.w500)),
                Text(
                  location,
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Monday - Friday 11:00 A.M - 7:00 P.M ",
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class NewCustomizableField extends StatefulWidget {
  final String heading;
  final String hintText;
  final Widget? suffixText;
  final VoidCallback? onSuffixTap;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int? numbnerlenght;

  const NewCustomizableField({
    Key? key,
    required this.heading,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    this.suffixText,
    this.onSuffixTap,
    this.numbnerlenght,
  }) : super(key: key);

  @override
  State<NewCustomizableField> createState() => _NewCustomizableFieldState();
}

class _NewCustomizableFieldState extends State<NewCustomizableField> {
  late int maxLength;
  bool isSuffixEnabled = false;

  @override
  void initState() {
    super.initState();
    maxLength = widget.numbnerlenght ?? 10;
    widget.controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    if (mounted) {
      setState(() {
        isSuffixEnabled = widget.controller.text.length == maxLength;
      });
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            widget.heading,
            style: const TextStyle(
              color: Color(0xFF0866C6),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextFormField(
            maxLength: maxLength,
            buildCounter: (_,
                    {required currentLength,
                    required isFocused,
                    required maxLength}) =>
                null,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              hintText: widget.hintText,
              fillColor: const Color.fromRGBO(248, 247, 247, 1),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromRGBO(220, 215, 215, 1)),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color.fromRGBO(0, 116, 217, 1), width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              suffixIcon: widget.suffixText != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 13),
                      child: InkWell(
                        onTap: isSuffixEnabled ? widget.onSuffixTap : null,
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            isSuffixEnabled ? Colors.transparent : Colors.grey,
                            BlendMode.srcATop,
                          ),
                          child: widget.suffixText!,
                        ),
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
