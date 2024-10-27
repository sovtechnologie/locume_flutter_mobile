import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:locume/app/screen/home/view/Home_view.dart';
import 'package:locume/app/screen/hospitals/view/Hospital_view.dart';
import 'package:locume/app/screen/locums/view/Locum_view.dart';
import 'package:locume/app/screen/profile/view/Profile_view.dart';
import '../controller/BottomNavigation_Controller.dart';

class BottomnavigationView extends GetView<BottomnavigationController> {
  BottomnavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: ConvexAppBar(
            curveSize: 120.0,
            style: TabStyle.fixedCircle,
            activeColor: HexColor('#0866C6'),
            shadowColor: HexColor('#0866C6'),
            color: HexColor('#0866C6'),
            height: 80.0,
            initialActiveIndex: 1,
            backgroundColor: Colors.white,
            items: [
              TabItem(
                  icon: Icon(
                    size: 25.0,
                    Icons.home,
                    color: HexColor('#0866C6'),
                  ),
                  title: 'Home',
                  activeIcon: const CircleAvatar(
                    radius: 40,
                    child: Icon(
                      size: 20,
                      Icons.home,
                      color: Colors.white,
                    ),
                  )),
              TabItem(
                  icon: SvgPicture.asset(
                    'assets/doctor.svg',
                    color: HexColor('#0866C6'),
                  ),
                  title: 'All Locums',
                  activeIcon: CircleAvatar(
                    radius: 40,
                    child: SvgPicture.asset(
                      'assets/doctor.svg',
                      color: Colors.white,
                    ),
                  )),
              TabItem(
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  activeIcon: Transform.translate(
                    offset: const Offset(0, -5),
                    child: const Icon(
                      Icons.minimize_rounded,
                      color: Colors.white,
                    ),
                  )),
              TabItem(
                  icon: SvgPicture.asset(
                    'assets/hospital.svg',
                    color: HexColor('#0866C6'),
                  ),
                  title: 'Home',
                  activeIcon: CircleAvatar(
                    radius: 20,
                    backgroundColor: HexColor('#0866C6'),
                    child: SvgPicture.asset(
                      height: 15,
                      'assets/hospital.svg',
                      color: Colors.white,
                    ),
                  )),
              TabItem(
                  icon: Icon(
                    Icons.person,
                    color: HexColor('#0866C6'),
                  ),
                  title: 'Home',
                  activeIcon: const CircleAvatar(
                    radius: 40,
                    child: Icon(
                      size: 20,
                      Icons.person,
                      color: Colors.white,
                    ),
                  )),
            ],
            onTap: (int i) {
              controller.currentStep.value = i;
            }),
        body: Obx(
          () => Column(
            children: [
              Expanded(
                child: IndexedStack(
                  index: controller.currentStep.value,
                  children: [
                    HomeView(),
                    LocumView(),
                    ProfileView(),
                    HospitalView(),
                    ProfileView()
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
