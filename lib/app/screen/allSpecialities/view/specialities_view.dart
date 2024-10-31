import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:locume/Theme/textTheme.dart';
import 'package:locume/Theme/theme.dart';
import 'package:locume/app/screen/allSpecialities/controller/specialities_controller.dart';

class SpecialitiesView extends GetView<SpecialitiesController> {
  const SpecialitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Specialities"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            buildSpecialityCard(
              imagePath: "assets/type1.svg",
              title: "Anesthesiology",
              description:
                  "Cardiology is a medical specialty and a branch of internal medicine concerned with disorders of the heart.",
            ),
            buildSpecialityCard(
              imagePath: "assets/type2.svg",
              title: "Cardiology",
              description:
                  "Cardiology is a medical specialty and a branch of internal medicine concerned with disorders of the heart.",
            ),
            buildSpecialityCard(
              imagePath: "assets/type3.svg",
              title: "Clinical Social Work",
              description:
                  "Cardiology is a medical specialty and a branch of internal medicine concerned with disorders of the heart.",
            ),
            buildSpecialityCard(
              imagePath: "assets/type4.svg",
              title: "Dermatology",
              description:
                  "Cardiology is a medical specialty and a branch of internal medicine concerned with disorders of the heart.",
            ),
            buildSpecialityCard(
              imagePath: "assets/type5.svg",
              title: "Emergency medicine",
              description:
                  "Cardiology is a medical specialty and a branch of internal medicine concerned with disorders of the heart.",
            ),
            buildSpecialityCard(
              imagePath: "assets/type6.svg",
              title: "Endocrinology",
              description:
                  "Cardiology is a medical specialty and a branch of internal medicine concerned with disorders of the heart.",
            ),
            buildSpecialityCard(
              imagePath: "assets/type7.svg",
              title: "Gastroenterology",
              description:
                  "Cardiology is a medical specialty and a branch of internal medicine concerned with disorders of the heart.",
            ),
            buildSpecialityCard(
              imagePath: "assets/type8.svg",
              title: "Hospital medicine",
              description:
                  "Cardiology is a medical specialty and a branch of internal medicine concerned with disorders of the heart.",
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildSpecialityCard({
  required String imagePath,
  required String title,
  required String description,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 13.0),
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
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 2),
                      color: textColor.withOpacity(0.15),
                      blurRadius: 4.0,
                      spreadRadius: 0,
                      blurStyle: BlurStyle.normal,
                    )
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SvgPicture.asset(imagePath),
                ),
              ),
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
  );
}
