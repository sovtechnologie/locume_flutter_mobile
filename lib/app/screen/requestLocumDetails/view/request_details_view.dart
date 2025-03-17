import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:locume/Theme/theme.dart';
import 'package:locume/app/screen/requestLocumDetails/controller/request_details_controller.dart';
import 'package:get/get.dart';
import 'package:locume/widget/reusedwidget.dart';

class RequestDetailsView extends GetView<RequestDetailsController> {
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
        body: Obx(() {
          if (controller.isLoding.value ||
              controller.requestRaisedDetails.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          final data = controller.requestRaisedDetails[0];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    height: 200,
                    width: double.maxFinite,
                    child: Image.network(
                      data.clinicHospitalImage ?? '',
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/hospital.png', // Fallback asset image
                          fit: BoxFit.fill,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    data.clinicHospitalName ?? "N/A",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
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
                      Expanded(
                        child: Text(
                          "${data.address ?? "N/A"}, ${data.city ?? "N/A"}, ${data.state ?? "N/A"}, ${data.pincode ?? "N/A"}",
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
                      Icon(Icons.calendar_month,
                          size: 12, color: Colors.grey[600]),
                      Text(
                          "  ${formatDateRange(data.startDate?.toIso8601String(), data.endDate?.toIso8601String())}  |  ₹${data.firstRange} - ${data.secondRange}/hour",
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
                      Text("  ${data.shift}",
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
                    height: 140,
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
                                    2,
                                    0),
                              );
                            }).toList(),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              controller.accepetORrejecteReq(data.id ?? 0, 0);
                            },
                            child: controller.ReqLoding.value
                                ? SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                        color: white, strokeWidth: 1.5),
                                  )
                                : Text("Accept Request")),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              controller.accepetORrejecteReq(data.id ?? 0, 2);
                            },
                            child: controller.ReqLodingR.value
                                ? SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                        color: white, strokeWidth: 1.5),
                                  )
                                : Text("Cancle Request")),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }));
  }
}
