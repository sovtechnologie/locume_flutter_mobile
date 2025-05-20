import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
          title: Text('View Details'),
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
                  Obx(() => CarouselSlider(
                        items: controller.imageUrls.map((url) {
                          return Container(
                            width: double.infinity,
                            child: Image.network(
                              url.toString(),
                              fit: BoxFit.fill,
                            ),
                          );
                        }).toList(),
                        options: CarouselOptions(
                          height: 200,
                          viewportFraction: 1.0,
                          enableInfiniteScroll: false,
                          onPageChanged: (index, reason) {
                            controller.currentIndex.value = index;
                          },
                        ),
                      )),
                  const SizedBox(height: 10),
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            List.generate(controller.imageUrls.length, (index) {
                          final isActive =
                              controller.currentIndex.value == index;
                          return Container(
                            width: 5,
                            height: 5,
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            child: SvgPicture.asset(
                              isActive
                                  ? "assets/currentindex.svg"
                                  : "assets/otherindex.svg",
                              width: 5,
                              height: 5,
                            ),
                          );
                        }),
                      )),
                  SizedBox(height: 15),
                  header("About Hospital"),
                  Text(
                      "A career as a doctor is a clinical professional that involves providing services in healthcare facilities. Individuals in the doctor's career path are responsible for diagnosing, examining, and identifying diseases, disorders, and illnesses of patients.",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: HexColor('#333333')),
                      softWrap: true,
                      overflow: TextOverflow.visible),
                  header("Hospital Address"),
                  Text(
                    "${data.address ?? "N/A"}, ${data.city ?? "N/A"}, ${data.state ?? "N/A"}, ${data.pincode ?? "N/A"}",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: HexColor('#333333')),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                  header("All Specialties"),
                  Container(
                    constraints: BoxConstraints(
                        maxHeight:
                            (controller.Speciality.length / 3).ceil() * 25),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        childAspectRatio: 5,
                      ),
                      itemCount: controller.Speciality.length,
                      itemBuilder: (context, index) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            controller.Speciality[index],
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: HexColor('#333333'),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Text(
                    "Date & Fees/hr",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: primaryColor),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.calendar_month,
                          size: 12, color: Colors.grey[600]),
                      Text(
                          "  ${formatDateRange(data.startDate?.toIso8601String(), data.endDate?.toIso8601String())}  |  ₹${data.firstRange} - ${data.secondRange}/hour",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: HexColor('#333333'))),
                    ],
                  ),
                  header("Raised By"),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Dr. Akhil kumar",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: HexColor('#333333'))),
                            Text("MBBS, MD, Cardiologist",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: HexColor('#333333'))),
                          ],
                        ),
                      ),
                      Text("View Details",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: primaryColor)),
                    ],
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
