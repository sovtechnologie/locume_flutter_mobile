import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Theme/textTheme.dart';
import '../Theme/theme.dart';

space(wid, hit) {
  return SizedBox(
    width: wid,
    height: hit,
  );
}

specialcard(String svg, String title) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
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

doctorcard(String image, String name, String md, String work, String exprience,
    String location, String id) {
  return InkWell(
    onTap: () {
      Get.toNamed('/dr-profile', arguments: id);
      print(id);
    },
    child: Container(
      width: double.maxFinite,
      // width: double.maxFinite,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 120,
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
                        fit: BoxFit.cover,
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
                Text(
                  md,
                  overflow: TextOverflow.visible,
                  softWrap: true,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: HexColor('#326295')),
                ),
                space(0.0, 5.0),
                Text(
                  work,
                  overflow: TextOverflow.visible,
                  softWrap: true,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      color: HexColor("#333333")),
                ),
                space(0.0, 5.0),
                Text(
                  '$exprience year experience',
                  overflow: TextOverflow.visible,
                  softWrap: true,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      color: HexColor("#333333")),
                ),
                space(0.0, 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Icon(
                        Icons.location_on_sharp,
                        size: 10,
                        color: Colors.grey[600],
                      ),
                    ),
                    space(5.0, 0.0),
                    Text(
                      location,
                      overflow: TextOverflow.visible,
                      softWrap: true,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          color: HexColor('#333333')),
                    ),
                  ],
                ),
                space(0.0, 5.0),
                Text(
                  'View Details',
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
    String experience, String location, String id,
    [bool forRequest = false]) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: InkWell(
      onTap: () {
        Get.toNamed('/dr-profile', arguments: id);
      },
      child: Container(
        width: 300,
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
                          onPressed: () {},
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
                          onPressed: () {},
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

hospitalcard(String image, String name, String location, String distance,
    String numDoctor, String numSpeciality, String Rating) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {
        Get.toNamed('/hospital-details');
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
                          SizedBox(
                            child: Icon(
                              Icons.location_on_sharp,
                              size: 10,
                              color: Colors.grey[600],
                            ),
                          ),
                          space(5.0, 0.0),
                          SizedBox(
                            width: 180,
                            child: Text(
                              location,
                              overflow: TextOverflow.visible,
                              softWrap: true,
                              style: TextStyle(
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

Widget mytextfield(String hint, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding:
            EdgeInsets.symmetric(vertical: 5, horizontal: 12), // Adjust padding
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), // Rounded corners
          borderSide: BorderSide(
              color: const Color.fromARGB(124, 175, 175, 175),
              width: 1), // Gray when disabled
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), // Rounded corners
          borderSide:
              BorderSide(color: primaryColor, width: 1), // Blue when enabled
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), // Rounded corners
          borderSide: BorderSide(
              color: Color.fromARGB(124, 175, 175, 175),
              width: 1), // Default border
        ),
      ),
      style: TextStyle(fontSize: 14), // Adjust text size if needed
    ),
  );
}

messagenotifications(problem, solution) {
  return Get.snackbar(problem, solution,
      overlayBlur: 20.0, overlayColor: Colors.white.withOpacity(0.7));
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
  );
}
