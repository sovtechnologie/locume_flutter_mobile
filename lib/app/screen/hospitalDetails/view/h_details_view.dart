import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:locume/Theme/theme.dart';
import 'package:locume/app/screen/hospitalDetails/controller/h_details_controller.dart';
import 'package:locume/widget/reusedwidget.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _makeCall(dynamic number) async {
  final Uri phoneUri =
      Uri(scheme: 'tel', path: '$number'); // Replace with your number
  if (await canLaunchUrl(phoneUri)) {
    await launchUrl(phoneUri);
  } else {
    throw 'Could not launch $phoneUri';
  }
}

class HDetailsView extends GetView<HDetailsController> {
  HDetailsView({super.key});
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          if (controller.isClinic == false) {
            if (controller.hospital_data.value.isEmpty) {
              return const Text("");
            }
            return Text(
                controller.hospital_data.value[0].hospitalName ?? "Locum");
          } else {
            if (controller.clinic_data.value.isEmpty) {
              return const Text("");
            }
            return Text(controller.clinic_data.value[0].clinicName ?? "Locum");
          }
        }),
      ),
      body: Obx(() {
        if (controller.hospital_data.value.isEmpty &&
                controller.isClinic == false ||
            controller.clinic_data.value.isEmpty &&
                controller.isClinic == true) {
          return const Center(child: CircularProgressIndicator());
        }
        final hdata = controller.hospital_data.value.isNotEmpty
            ? controller.hospital_data.value[0]
            : null;

        final cdata = controller.clinic_data.value.isNotEmpty
            ? controller.clinic_data.value[0]
            : null;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
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
                        final isActive = controller.currentIndex.value == index;
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
                Text(
                  controller.isClinic == false
                      ? hdata?.hospitalName ?? "Locum"
                      : cdata?.clinicName ?? "Locum",

                  // "Apollo international hospital",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: primaryColor),
                ),
                Text(
                  "Multi super specialty hospital",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: HexColor('#333333')),
                ),
                SizedBox(height: 5),
                header("About Hospital"),
                Text(
                    controller.isClinic == false
                        ? hdata?.about ?? ""
                        : cdata?.about ?? "",

                    // "A career as a doctor is a clinical professional that involves providing services in healthcare facilities. Individuals in the doctor's career path are responsible for diagnosing, examining, and identifying diseases, disorders, and illnesses of patients.",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: HexColor('#333333')),
                    softWrap: true,
                    overflow: TextOverflow.visible),
                header("Hospital Address"),
                Text(
                    controller.isClinic == false
                        ? "${hdata?.address ?? ""}, ${hdata?.city ?? ""}, ${hdata?.state ?? ""}, ${hdata?.pincode ?? ""}"
                        : "${cdata?.address ?? ""}, ${cdata?.city ?? ""}, ${cdata?.state ?? ""}, ${cdata?.pincode ?? ""}",

                    // "A career as a doctor is a clinical professional that involves providing services in healthcare facilities. Individuals in the doctor's career path are responsible for diagnosing, examining, and identifying diseases, disorders, and illnesses of patients.",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: HexColor('#333333')),
                    softWrap: true,
                    overflow: TextOverflow.visible),
                SizedBox(height: 5),
                header("All Specialties"),
                GridView.builder(
                  shrinkWrap: true, // Important to wrap content inside a column
                  physics:
                      NeverScrollableScrollPhysics(), // Disable scrolling inside GridView
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
                        // Center align text inside the grid
                      ),
                    );
                  },
                ),
                Text(
                  "Other Doctors",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: primaryColor),
                ),
                Obx(() => Column(
                      children: controller.doctorList.map((doctor) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8),
                            child: doctorcard(
                              context,
                              doctor["image"]!,
                              doctor["name"]!,
                              doctor["md"]!,
                              doctor["work"]!,
                              doctor["experience"]!,
                              doctor["location"]!,
                              doctor["id"]!,
                            ));
                      }).toList(),
                    )),
              ],
            ),
          ),
        );
      }),
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
}
