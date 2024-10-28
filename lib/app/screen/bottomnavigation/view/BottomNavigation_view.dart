import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:locume/Theme/theme.dart';
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
      body: Stack(
        children: [
          // Main Content
          Column(
            children: [
              Expanded(
                child: Obx(
                  () => IndexedStack(
                    index: controller.currentStep.value,
                    children: [
                      HomeView(),
                      LocumView(),
                      ProfileView(),
                      HospitalView(),
                      ProfileView(),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Custom bottom sheet overlay
          Obx(
            () => controller.showBottom.value
                ? Positioned(
                    bottom: 0.0, // Position just above the ConvexAppBar
                    left: 0,
                    right: 0,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 5),
                      curve: Curves.easeIn,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(30.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Add Item',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 10),
                              // Additional content here
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        curveSize: 120.0,
        style: TabStyle.fixedCircle,
        activeColor: HexColor('#0866C6'),
        shadowColor: HexColor('#C4C4C4'),
        color: HexColor('#0866C6'),
        height: 80.0,
        initialActiveIndex: 1,
        backgroundColor: white,
        items: [
          TabItem(
            icon: Icon(
              size: 25.0,
              Icons.home,
              color: HexColor('#0866C6'),
            ),
            title: 'Home',
            activeIcon: Transform.translate(
              offset: const Offset(-3, -10),
              child: const Icon(
                size: 30,
                Icons.home,
                color: Colors.grey,
              ),
            ),
          ),
          TabItem(
            icon: SvgPicture.asset(
              'assets/doctor.svg',
              color: HexColor('#0866C6'),
            ),
            title: 'All Locums',
            activeIcon: Transform.translate(
              offset: const Offset(-3, -10),
              child: SvgPicture.asset(
                'assets/doctor.svg',
                color: Colors.grey,
              ),
            ),
          ),
          TabItem(
            icon: Obx(() => InkWell(
                  onTap: () {
                    controller.showBottom.value = !controller.showBottom.value;
                  },
                  child: Center(
                    child: controller.showBottom.value
                        ? Transform.translate(
                            offset: Offset(0, -7),
                            child: const Icon(
                              Icons.minimize_rounded,
                              color: Colors.white,
                            ),
                          )
                        : const Icon(
                            Icons.add_rounded,
                            color: Colors.white,
                          ),
                  ),
                )),
            title: 'Add',
          ),
          TabItem(
            icon: SvgPicture.asset(
              'assets/hospital.svg',
              color: HexColor('#0866C6'),
            ),
            title: 'Hospitals',
            activeIcon: Transform.translate(
              offset: const Offset(-3, -10),
              child: SvgPicture.asset(
                'assets/hospital.svg',
                color: Colors.grey,
              ),
            ),
          ),
          TabItem(
            icon: Icon(
              Icons.person,
              color: HexColor('#0866C6'),
            ),
            title: 'Profile',
            activeIcon: Transform.translate(
              offset: const Offset(-3, -10),
              child: const Icon(
                Icons.person,
                color: Colors.grey,
              ),
            ),
          ),
        ],
        onTap: (int i) {
          if (i != 2) {
            controller.currentStep.value = i;
          }
        },
      ),
    );
  }
}
