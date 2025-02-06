import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:locume/Theme/theme.dart';
import 'package:locume/app/screen/home/view/Home_view.dart';
import 'package:locume/app/screen/hospitals/view/Hospital_view.dart';
import 'package:locume/app/screen/locums/view/Locum_view.dart';
import 'package:locume/app/screen/login/signup/model/category_model.dart' as c;
import 'package:locume/app/screen/privacypolicy/view/Privacy_view.dart';
import 'package:locume/app/screen/profile/view/Profile_view.dart';
import 'package:locume/widget/custom_button.dart';
import 'package:locume/widget/custom_textField.dart';
import '../../statics/about.dart';
import '../../statics/contact.dart';
import '../controller/BottomNavigation_Controller.dart';

class BottomnavigationView extends GetView<BottomnavigationController> {
  BottomnavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: white,
    ));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Stack(
          children: [
            AppBar(
              foregroundColor: Colors.white,
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.white,
              elevation: 0,
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
                'Hi, ${controller.firstName} ${controller.lastName}',
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
                    padding: const EdgeInsets.all(8.0),
                    child: Transform.translate(
                      offset: const Offset(-15, 0),
                      child: Icon(
                        Icons.notifications_active_rounded,
                        color: HexColor('#0866C6'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Conditionally show the Positioned widget if showBottom is true
            Obx(() {
              if (controller.showBottom.value) {
                return Positioned(
                  child: Container(
                    color: Colors.black.withOpacity(0.2),
                    width: double.infinity,
                    height: double.infinity,
                  ),
                );
              } else {
                return SizedBox
                    .shrink(); // Return an empty widget when showBottom is false
              }
            }),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drawer Header with dynamic profile picture, name, and description
            const DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://locumedocument.s3.ap-south-1.amazonaws.com/dav.jpeg', // Replace with dynamic image URL
                    ),
                    radius: 40, // Size of the avatar
                  ),
                  // Spacing between avatar and text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Dr. Akhil Kumar', // Replace with dynamic name
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                            height: 3), // Space between name and description
                        Text(
                          'MBBS, MD Medicine', // Replace with dynamic description
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color:
                                Colors.grey, // Optional color for description
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[300],
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    title: const Text('Manage'),
                    onTap: () {
                      Get.toNamed('/manage');
                    },
                  ),
                  ListTile(
                    title: const Text('About us'),
                    onTap: () {
                      Get.to(const AboutUs());
                    },
                  ),
                  ListTile(
                    title: const Text('Contact us'),
                    onTap: () {
                      Get.to(const ContactUs());
                    },
                  ),
                  ListTile(
                    title: const Text('Privacy policy'),
                    onTap: () {
                      Get.toNamed('/privacy');
                    },
                  ),
                  Divider(
                    color: Colors.grey[300],
                  ),
                ],
              ),
            ),
            // Logout button at the bottom of the drawer
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 45.0),
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.redAccent),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () async {
                  await SessionManager().set('isloggedIn', false);
                  Get.offAllNamed('/login');
                },
              ),
            ),
          ],
        ),
      ),
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
                ? Stack(children: [
                    GestureDetector(
                      onTap: () {
                        controller.showBottom.value = false;
                      },
                      child: Container(
                        color: Colors.black.withOpacity(0.2),
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0,
                      right: 0,
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 5),
                        curve: Curves.easeIn,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.58,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 10),
                                child: Text(
                                  "Hospital/Clinic Name",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              TextFormField(
                                controller: controller.hospitalname,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: "Hospital/Clinic Name",
                                  fillColor:
                                      const Color.fromRGBO(248, 247, 247, 1),
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(220, 215, 215, 1),
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: primaryColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0,
                                    horizontal: 16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 10),
                                child: Text(
                                  "Rate/Range",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: DropdownButtonFormField<String>(
                                      items: ["100", "200"]
                                          .map((String value) =>
                                              DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              ))
                                          .toList(),
                                      onChanged: (String? newValue) {
                                        controller.minRate.value =
                                            newValue.toString();
                                        // Handle dropdown selection
                                      },
                                      decoration: InputDecoration(
                                        fillColor: const Color.fromRGBO(
                                            248, 247, 247, 1),
                                        filled: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color.fromRGBO(
                                                220, 215, 215, 1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: primaryColor,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          vertical: 0,
                                          horizontal: 16,
                                        ),
                                      ),
                                      hint: const Center(
                                        child: Text(
                                          "Select Rate", // Centered hint text
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors
                                                .grey, // Customize color here
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      "-",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                  Expanded(
                                    child: DropdownButtonFormField<String>(
                                      items: ["1000", "2000"]
                                          .map((String value) =>
                                              DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              ))
                                          .toList(),
                                      onChanged: (String? newValue) {
                                        controller.maxRate.value =
                                            newValue.toString();
                                        // Handle dropdown selection
                                      },
                                      decoration: InputDecoration(
                                        fillColor: const Color.fromRGBO(
                                            248, 247, 247, 1),
                                        filled: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color.fromRGBO(
                                                220, 215, 215, 1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: primaryColor,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          vertical: 0,
                                          horizontal: 16,
                                        ),
                                      ),
                                      hint: const Center(
                                        child: Text(
                                          "Select Rate", // Centered hint text
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors
                                                .grey, // Customize color here
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, bottom: 10),
                                          child: Text(
                                            "Specified category",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ),
                                        DropdownButtonFormField<int>(
                                          value: controller
                                                  .selectedType.value.isEmpty
                                              ? null
                                              : int.tryParse(controller
                                                  .selectedType.value),
                                          items: controller.categoryList
                                              .map((c.Result category) {
                                            return DropdownMenuItem<int>(
                                              value: category.id,
                                              child: Text(
                                                category.categoryName ?? 'N/A',
                                                overflow: TextOverflow
                                                    .ellipsis, // Truncate long text if needed
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (int? newValue) {
                                            if (newValue != null) {
                                              // Set the selected category id
                                              controller.category.value =
                                                  newValue.toString();
                                            }
                                            print(controller.category);
                                          },
                                          decoration: InputDecoration(
                                            fillColor: const Color.fromRGBO(
                                                248, 247, 247, 1),
                                            filled: true,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color.fromRGBO(
                                                    220, 215, 215, 1),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: primaryColor,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 0,
                                                    horizontal: 16),
                                          ),
                                          hint: const Center(
                                            child: Text(
                                              "Select Category", // Centered hint text
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          // Use the dropdown's itemHeight property to limit the number of visible items
                                          menuMaxHeight:
                                              200, // This sets the maximum height of the dropdown
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, bottom: 10),
                                          child: Text(
                                            "Shift",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ),
                                        DropdownButtonFormField<String>(
                                          items: [
                                            "Morning",
                                            "Afternoon",
                                            'Evening',
                                            "Night"
                                          ]
                                              .map((String value) =>
                                                  DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(value),
                                                  ))
                                              .toList(),
                                          onChanged: (String? newValue) {
                                            controller.shift.value =
                                                newValue.toString();
                                            print(controller
                                                .shift); // Handle dropdown selection for shifts
                                          },
                                          decoration: InputDecoration(
                                            fillColor: const Color.fromRGBO(
                                                248, 247, 247, 1),
                                            filled: true,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color.fromRGBO(
                                                      220, 215, 215, 1)),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: primaryColor,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 0,
                                                    horizontal: 16),
                                          ),
                                          hint: const Center(
                                            child: Text(
                                              "Your Shift", // Centered hint text
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, bottom: 10),
                                          child: Text(
                                            "Start date",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ),
                                        TextFormField(
                                          controller: controller.startDate,
                                          readOnly: true,
                                          onTap: () => controller
                                              .selectDateRange(context),
                                          decoration: InputDecoration(
                                            hintText: "Select start date",
                                            fillColor: const Color.fromRGBO(
                                                248, 247, 247, 1),
                                            filled: true,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color.fromRGBO(
                                                    220, 215, 215, 1),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.blue,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              vertical: 0,
                                              horizontal: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                      width: 16), // Add spacing between fields
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, bottom: 10),
                                          child: Text(
                                            "End date",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ),
                                        TextFormField(
                                          controller: controller.endDate,
                                          readOnly: true,
                                          onTap: () => controller
                                              .selectDateRange(context),
                                          decoration: InputDecoration(
                                            hintText: "Select end date",
                                            fillColor: const Color.fromRGBO(
                                                248, 247, 247, 1),
                                            filled: true,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color.fromRGBO(
                                                    220, 215, 215, 1),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.blue,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              vertical: 0,
                                              horizontal: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Row(
                                    children: [
                                      Radio<String>(
                                        value: "Schedule",
                                        groupValue:
                                            controller.selectedType.value,
                                        onChanged: (value) {
                                          controller.selectedType.value =
                                              value!;
                                        },
                                        activeColor:
                                            primaryColor, // primary color when selected
                                      ),
                                      Text(
                                        "Schedule",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: controller
                                                        .selectedType.value ==
                                                    "Schedule"
                                                ? primaryColor
                                                : secondaryColor // Text color based on selection
                                            ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Radio<String>(
                                        value: "Emergency",
                                        groupValue:
                                            controller.selectedType.value,
                                        onChanged: (value) {
                                          controller.selectedType.value =
                                              value!;
                                        },
                                        activeColor:
                                            primaryColor, // primary color when selected
                                      ),
                                      Text(
                                        "Emergency",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: controller
                                                      .selectedType.value ==
                                                  "Emergency"
                                              ? primaryColor
                                              : secondaryColor, // Text color based on selection
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                    onPressed: () async {
                                      await controller.requestLocum();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: white,
                                      backgroundColor: primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    child: Text(
                                        (controller.isLoading.value == false)
                                            ? "Book Now"
                                            : "Lodaing")),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ])
                : const SizedBox.shrink(),
          ),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        curveSize: 120.0,
        style: TabStyle.fixedCircle,
        activeColor: primaryColor,
        shadowColor: HexColor('#C4C4C4'),
        color: Colors.grey,
        height: 75.0,
        initialActiveIndex: 0,
        backgroundColor: white,
        items: [
          TabItem(
            icon: const Icon(
              size: 25.0,
              Icons.home,
              color: Colors.grey,
            ),
            title: 'Home',
            activeIcon: Transform.translate(
              offset: Offset(-2, -5),
              child: Icon(size: 30, Icons.home, color: primaryColor),
            ),
          ),
          TabItem(
            icon: SvgPicture.asset(
              'assets/doctor.svg',
              color: Colors.grey,
            ),
            title: 'Locum',
            activeIcon: Transform.translate(
              offset: const Offset(0, -5),
              child: SvgPicture.asset('assets/doctor.svg', color: primaryColor),
            ),
          ),
          TabItem(
            icon: Obx(() => InkWell(
                  onTap: () {
                    controller.showBottom.value = !controller.showBottom.value;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: primaryColor, shape: BoxShape.circle),
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
                  ),
                )),
            title: 'Add',
          ),
          TabItem(
            icon: SvgPicture.asset(
              'assets/hospital.svg',
              color: Colors.grey,
            ),
            title: 'Hospitals',
            activeIcon: Transform.translate(
              offset: const Offset(0, -5),
              child: SvgPicture.asset(
                'assets/hospital.svg',
                color: primaryColor,
              ),
            ),
          ),
          TabItem(
            icon: const Icon(
              Icons.person,
              color: Colors.grey,
            ),
            title: 'Profile',
            activeIcon: Transform.translate(
              offset: const Offset(0, -5),
              child: Icon(
                Icons.person,
                color: primaryColor,
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
