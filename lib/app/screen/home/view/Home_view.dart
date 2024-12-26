import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:locume/app/screen/statics/about.dart';
import 'package:locume/app/screen/statics/contact.dart';
import 'package:locume/widget/reusedwidget.dart';

import '../controller/Home_controller.dart';

class HomeView extends GetView<HomeControlller> {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu_rounded,
                color: HexColor('#0866C6'),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          title: Text(
            'hi, Christopher\ngood morning',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: HexColor('#174666')),
          ),
          actions: [
            InkWell(
              onTap: () {
                Get.toNamed('/notification');
              },
              child: Container(
                padding:
                    const EdgeInsets.all(8.0), // Adjust the padding as needed
                child: Transform.translate(
                  offset: const Offset(-15, 0),
                  child: Icon(
                    Icons.notifications_active_rounded,
                    color: HexColor('#0866C6'),
                  ),
                ),
              ),
            ),
          ]),
      drawer: Drawer(
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.zero, // Remove rounded corners
          child: SafeArea(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  title: Text('About us'),
                  onTap: () {
                    Get.to(AboutUs());
                  },
                ),
                ListTile(
                  title: Text('Contact us'),
                  onTap: () {
                    Get.to(ContactUs());
                  },
                ),
                ListTile(
                  title: Text('Privacy policy'),
                  onTap: () {
                    Get.toNamed('/privacy');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
          child: Column(
            children: [
              space(double.maxFinite, 20.0),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 0),
                        color: HexColor('#1B4584').withOpacity(0.05),
                        blurRadius: 4.0,
                        spreadRadius: 4.0,
                        blurStyle: BlurStyle.normal)
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                ),
                child: TextField(
                  strutStyle: const StrutStyle(
                      fontSize: 10, fontWeight: FontWeight.bold),
                  // style: GoogleFonts.inter(
                  //     color: Colors.black, fontWeight: FontWeight.w300),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: HexColor('#2C72C0'),
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        )),
                    disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        )),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        )),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        )),
                    fillColor: HexColor("#FFFFFF"),
                    filled: true,
                    hintText: "Text",
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: HexColor('#AAAAAA').withOpacity(0.7),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              space(double.maxFinite, 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Top Specialties',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: HexColor('#0866C6')),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed('/specialities');
                    },
                    child: Text(
                      'View All',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: HexColor('#1E5A84')),
                    ),
                  ),
                ],
              ),
              space(double.maxFinite, 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: specialcard('assets/type1.svg', 'Anesthesiology')),
                  space(20.0, 0.0),
                  Expanded(
                      child: specialcard('assets/type2.svg', 'Cardiology')),
                  space(20.0, 0.0),
                  Expanded(
                      child: specialcard('assets/type3.svg', 'Dermatology')),
                  space(20.0, 0.0),
                  Expanded(
                      child: specialcard(
                          'assets/type4.svg', 'Emergency medicine')),
                ],
              ),
              space(double.maxFinite, 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: specialcard('assets/type4.svg', 'Endocrinology')),
                  space(20.0, 0.0),
                  Expanded(
                      child:
                          specialcard('assets/type6.svg', 'Gastroenterology')),
                  space(20.0, 0.0),
                  Expanded(
                      child:
                          specialcard('assets/type7.svg', 'Hospital Medicine')),
                  space(20.0, 0.0),
                  Expanded(
                      child:
                          specialcard('assets/type8.svg', 'Medical Oncology')),
                ],
              ),
              space(double.maxFinite, 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Top Locum`s',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: HexColor('#0866C6')),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: HexColor('#1E5A84')),
                  ),
                ],
              ),
              space(double.maxFinite, 30.0),
              doctorcard(
                  'assets/dc-2.png',
                  'Akshay Bhadresha Akshay Bhadresha Akshay Bhadresha ',
                  'md',
                  'work',
                  'exprience',
                  'location',
                  'custom_id'),
              space(double.maxFinite, 20.0),
              doctorcard('assets/hospital1.png', 'name', 'md', 'work',
                  'exprience', 'location', 'custom_id'),
              space(double.maxFinite, 20.0),
              doctorcard('assets/doctor1.png', 'name', 'md', 'work',
                  'exprience', 'location', 'custom_id'),
              space(double.maxFinite, 20.0),
              doctorcard('assets/doctor1.png', 'name', 'md', 'work',
                  'exprience', 'location', 'custom_id'),
              space(double.maxFinite, 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Top Hospitals',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: HexColor('#0866C6')),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: HexColor('#1E5A84')),
                  ),
                ],
              ),
              space(double.maxFinite, 40.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    hospitalcard(
                        'assets/hospital1.png', 'name', 'location', 'distance'),
                    space(15.0, 0.0),
                    hospitalcard(
                        'assets/hospital1.png', 'name', 'location', 'distance'),
                    space(15.0, 0.0),
                    hospitalcard(
                        'assets/hospital1.png', 'name', 'location', 'distance'),
                    space(15.0, 0.0),
                    hospitalcard(
                        'assets/hospital1.png', 'name', 'location', 'distance')
                  ],
                ),
              ),
              space(double.maxFinite, 65.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Top Clinic`s',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: HexColor('#0866C6')),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed('/clinics');
                    },
                    child: Text(
                      'View All',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: HexColor('#1E5A84')),
                    ),
                  ),
                ],
              ),
              space(double.maxFinite, 40.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    hospitalcard(
                        'assets/hospital1.png', 'name', 'location', 'distance'),
                    space(15.0, 0.0),
                    hospitalcard(
                        'assets/hospital1.png', 'name', 'location', 'distance'),
                    space(15.0, 0.0),
                    hospitalcard(
                        'assets/hospital1.png', 'name', 'location', 'distance'),
                    space(15.0, 0.0),
                    hospitalcard(
                        'assets/hospital1.png', 'name', 'location', 'distance')
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
