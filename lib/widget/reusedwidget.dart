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
          child: SvgPicture.asset(svg),
        ),
      ),
      space(double.maxFinite, 10.0),
      Text(
        overflow: TextOverflow.visible,
        softWrap: true,
        textAlign: TextAlign.center,
        title,
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 10,
            color: HexColor('#326295')),
      ),
    ],
  );
}

doctorcard(String image, String name, String md, String work, String exprience,
    String location) {
  return Container(
    height: 150,
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
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
            width: 100,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: Image.asset(
                fit: BoxFit.cover,
                image,
              ),
            ),
          ),
          space(10.0, 0.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: HexColor('#326295')),
                  ),
                ),
                space(0.0, 5.0),
                Expanded(
                  child: Text(
                    md,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: HexColor('#326295')),
                  ),
                ),
                space(0.0, 5.0),
                Expanded(
                  child: Text(
                    work,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                        color: HexColor('#326295')),
                  ),
                ),
                space(0.0, 5.0),
                Expanded(
                  child: Text(
                    exprience,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: HexColor('#326295')),
                  ),
                ),
                space(0.0, 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      child: Icon(
                        Icons.location_on_sharp,
                        size: 10,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        location,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                            color: HexColor('#333333')),
                      ),
                    ),
                  ],
                ),
                space(0.0, 5.0),
                Expanded(
                  child: Text(
                    'View Details',
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: HexColor('#0866C6')),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const SizedBox(
                child: Icon(
                  Icons.star_rate_rounded,
                  size: 15,
                  color: Colors.amberAccent,
                ),
              ),
              Text(
                '4.5',
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    color: HexColor('#333333')),
              ),
              Text(
                'Rating',
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 7,
                    color: HexColor('#2A7FBA')),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

hospitalcard(String image, String name, String location, String distance) {
  return Container(
    height: 200,
    width: double.maxFinite,
    constraints: const BoxConstraints(
        minHeight: 200, maxHeight: 220, minWidth: 220, maxWidth: 250),
    decoration: BoxDecoration(
      color: HexColor('#F0F3F5'),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            child: Image.asset(
              image,
            ),
          ),
          space(0.0, 10.0),
          Expanded(
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: HexColor('#000000')),
            ),
          ),
          space(0.0, 9.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                child: Icon(
                  Icons.location_on_sharp,
                  size: 10,
                ),
              ),
              space(5.0, 0.0),
              Expanded(
                child: Text(
                  location,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: HexColor('#333333')),
                ),
              ),
            ],
          ),
          space(0.0, 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(child: SvgPicture.asset('assets/distancesvg.svg')),
              space(5.0, 0.0),
              Expanded(
                child: Text(
                  distance,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: HexColor('#333333')),
                ),
              ),
            ],
          ),
        ],
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
              height: 200, // Fixed height for the image
              width: double.maxFinite,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
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
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          color: HexColor('#333333')),
                    ),
                    Text(
                      'Rating',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
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

messagenotifications(problem, solution) {
  return Get.snackbar(problem, solution,
      overlayBlur: 20.0, overlayColor: Colors.white.withOpacity(0.7));
}
