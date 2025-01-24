import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:locume/Theme/theme.dart';
import 'package:locume/app/screen/hospitalDetails/controller/h_details_controller.dart';
import 'package:locume/widget/reusedwidget.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _makeCall() async {
  final Uri phoneUri =
      Uri(scheme: 'tel', path: '+8487029455'); // Replace with your number
  if (await canLaunchUrl(phoneUri)) {
    await launchUrl(phoneUri);
  } else {
    throw 'Could not launch $phoneUri';
  }
}

class HDetailsView extends GetView<HDetailsController> {
  HDetailsView({super.key});
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
        title: Text('Hospital Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  decoration: BoxDecoration(),
                  height: 200,
                  width: double.maxFinite,
                  child: Image.asset(
                    'assets/hospital.png',
                    fit: BoxFit.fill,
                  )),
              SizedBox(height: 15),
              Text(
                "Apollo international hospital",
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
                      "Parsik Hill Road, Cbd Belapur, Navi Mumbai 5km away from your location",
                      style: TextStyle(
                          fontSize: 12,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/distancesvg.svg',
                    height: 10,
                    width: 10,
                    color: HexColor('#333333'),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "5km away from your location",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: HexColor('#333333')),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.place,
                              color: white,
                              size: 15,
                            ),
                            Text(' View Diretion')
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          // Replace with the phone number you want to dial
                          _makeCall();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.call,
                              color: white,
                              size: 15,
                            ),
                            Text(' Call')
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Text(
                "About Hospital",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 5),
              Text(
                  "A career as a doctor is a clinical professional that involves providing services in healthcare facilities. Individuals in the doctor's career path are responsible for diagnosing, examining, and identifying diseases, disorders, and illnesses of patients.",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: HexColor('#333333')),
                  softWrap: true,
                  overflow: TextOverflow.visible),
              SizedBox(height: 25),
              Text(
                "All Specialties",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: GridView.builder(
                  shrinkWrap: true, // Important to wrap content inside a column
                  physics:
                      NeverScrollableScrollPhysics(), // Disable scrolling inside GridView
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    childAspectRatio: 4,
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
                        ),
                        // Center align text inside the grid
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Text(
                    "All Doctors",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
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
                              doctor["id"]!,
                            ),
                          );
                        }).toList(),
                      ),
                    )),
              ),
              SizedBox(height: 15),
              Text(
                "Reviews",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    reviewscard(
                        "Sam Curren",
                        3,
                        "Responsible for diagnosing, examining, diseases, disorders, and illnesses of patients.",
                        "12/12/2025"),
                    reviewscard(
                        "Sam Curren",
                        3,
                        "Responsible for diagnosing, examining, diseases, disorders, and illnesses of patients.",
                        "12/12/2025"),
                    reviewscard(
                        "Sam Curren",
                        3,
                        "Responsible for diagnosing, examining, diseases, disorders, and illnesses of patients.",
                        "12/12/2025"),
                    reviewscard(
                        "Sam Curren",
                        3,
                        "Responsible for diagnosing, examining, diseases, disorders, and illnesses of patients.",
                        "12/12/2025")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
