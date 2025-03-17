import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
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
                  height: 200,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(10), // Border radius applied
                  ),
                  clipBehavior: Clip
                      .hardEdge, // Ensures the image is clipped within the radius
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
                Row(
                  children: [
                    Text(
                      data.clinicHospitalName ?? "N/A",
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
                if (data.userData!.isNotEmpty)
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
                if (data.userData!.isNotEmpty)
                  SizedBox(
                    height: 170,
                    child: Obx(() => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ListView.builder(
                            scrollDirection:
                                Axis.horizontal, // Enable horizontal scrolling
                            controller: scrollController,
                            itemCount:
                                controller.requestRaisedDetails.isNotEmpty
                                    ? controller.requestRaisedDetails[0]
                                            .userData?.length ??
                                        0
                                    : 0,
                            itemBuilder: (context, index) {
                              final user = controller
                                  .requestRaisedDetails[0].userData?[index];

                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: smalldoctorcard(
                                    user?.profileImage ?? "",
                                    user?.firstName ?? "",
                                    "MBBS, MA",
                                    "Data need",
                                    user?.totalExp ?? "N/A",
                                    "${user?.location}, ${user?.state}",
                                    user?.id ?? 0,
                                    data.userId ?? 0,
                                    true),
                              );
                            },
                          ),
                        )),
                  ),
              ],
            ),
          ),
        );
      }),
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
                  controller.ActiveOrDeactiveReq(
                      controller.requestRaisedDetails[0].isActive == true
                          ? false
                          : true,
                      controller.requestRaisedDetails[0].userId ?? 0,
                      controller.requestRaisedDetails[0].id ?? 0);
                  // Toggle status on button press
                  // controller.reqStatus.value = !controller.reqStatus.value;
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
                  child: controller.ReqLoding.value
                      ? Container(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: controller.reqStatus.value
                                ? Colors.white
                                : primaryColor,
                            strokeWidth: 1,
                          ),
                        )
                      : Text(
                          controller.reqStatus.value
                              ? "Activate"
                              : "Deactivate",
                          key: ValueKey(controller
                              .reqStatus.value), // Ensures smooth animation
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
