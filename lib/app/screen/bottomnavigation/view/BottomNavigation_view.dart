import 'package:flutter/material.dart';
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
            style: TabStyle.reactCircle,
            activeColor: Colors.blue,
            shadowColor: HexColor('#0866C6'),
            color: Colors.grey,
            height: 80.0,
            initialActiveIndex: 1,
            backgroundColor: Colors.white,
            items: [
              TabItem(
                  icon: Icon(
                    Icons.home,
                    color: HexColor('#0866C6'),
                  ),
                  title: 'Home',
                  activeIcon: const Icon(
                    Icons.home,
                    color: Colors.white,
                  )),
              TabItem(
                  icon: Icon(
                    Icons.dashboard,
                    color: HexColor('#0866C6'),
                  ),
                  title: 'Home',
                  activeIcon: const Icon(
                    Icons.dashboard,
                    color: Colors.white,
                  )),
              const TabItem(
                  icon: Icon(
                    Icons.add,
                    color: Colors.blueAccent,
                  ),
                  activeIcon: Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
              TabItem(
                  icon: Icon(
                    Icons.local_hospital,
                    color: HexColor('#0866C6'),
                  ),
                  title: 'Home',
                  activeIcon: const Icon(
                    Icons.local_hospital,
                    color: Colors.white,
                  )),
              TabItem(
                  icon: Icon(
                    Icons.person,
                    color: HexColor('#0866C6'),
                  ),
                  title: 'Home',
                  activeIcon: const Icon(
                    Icons.person,
                    color: Colors.white,
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
