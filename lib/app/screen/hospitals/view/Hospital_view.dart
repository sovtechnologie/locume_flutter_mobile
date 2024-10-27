import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../reusedwidget.dart';
import '../controller/Hospital_Controller.dart';

class HospitalView extends GetView<HospitalController> {
  HospitalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu_rounded,
              color: HexColor('#0866C6'),
            )),
        title: Text(
          'hi, Christopher\ngood morning',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: HexColor('#174666')),
        ),
        actions: [
          Transform.translate(
              offset: Offset(-15, 0),
              child: Icon(
                Icons.notifications_active_rounded,
                color: HexColor('#0866C6'),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}

// bottomNavigationBar: ConvexAppBar(
// curveSize: 120.0,
// style: TabStyle.reactCircle,
// activeColor: Colors.blue,
// shadowColor: HexColor('#0866C6'),
// color: Colors.grey,
// height: 80.0,
// initialActiveIndex: 1,
// backgroundColor: Colors.white,
// items:  [
// TabItem(icon: Icon(Icons.home,color: HexColor('#0866C6'),), title: 'Home',activeIcon: const Icon(Icons.home,color: Colors.white,)),
// TabItem(icon: Icon(Icons.dashboard,color: HexColor('#0866C6'),), title: 'Home',activeIcon: const Icon(Icons.dashboard,color: Colors.white,)),
// const TabItem(icon: Icon(Icons.add,color: Colors.blueAccent,), activeIcon: Icon(Icons.add,color: Colors.white,)),
// TabItem(icon: Icon(Icons.local_hospital,color: HexColor('#0866C6'),), title: 'Home',activeIcon: const Icon(Icons.local_hospital,color: Colors.white,)),
// TabItem(icon: Icon(Icons.person,color: HexColor('#0866C6'),), title: 'Home',activeIcon: const Icon(Icons.person,color: Colors.white,)),
//
// ],
// onTap: (int i) => print('click index=$i'),
// )
