import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locume/app/screen/allSpecialities/binding/specialities_binding.dart';
import 'package:locume/app/screen/allSpecialities/view/specialities_view.dart';
import 'package:locume/app/screen/bottomnavigation/binding/BottomNavigation_Binding.dart';
import 'package:locume/app/screen/bottomnavigation/view/BottomNavigation_view.dart';
import 'package:locume/app/screen/clinics/binding/Clinics_Binding.dart';
import 'package:locume/app/screen/getstarted/binding/getstart_binding.dart';
import 'package:locume/app/screen/home/binding/Home_binding.dart';
import 'package:locume/app/screen/home/view/Home_view.dart';
import 'package:locume/app/screen/hospitals/binding/Hospital_binding.dart';
import 'package:locume/app/screen/hospitals/view/Hospital_view.dart';
import 'package:locume/app/screen/locums/binding/Locum_Binding.dart';
import 'package:locume/app/screen/locums/view/Locum_view.dart';
import 'package:locume/app/screen/login/signup/binding/login_binding.dart';
import 'package:locume/app/screen/login/signup/view/login_option.dart';
import 'package:locume/app/screen/login/signup/view/login_view.dart';
import 'package:locume/app/screen/login/signup/view/reqister_view.dart';
import 'package:locume/app/screen/notification/view/notification_view.dart';
import 'package:locume/app/screen/profile/binding/Profile_Binding.dart';
import 'package:locume/app/screen/profile/view/Profile_view.dart';

import '../screen/clinics/view/Clinics_view.dart';
import '../screen/getstarted/view/getstart_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.Start1;

  static final routes = [
    GetPage(
        name: _Paths.Start1,
        page: () => Start1View(),
        binding: Start1Binding()),
    GetPage(
        name: _Paths.LoginOption,
        page: () => LoginOptionView(),
        binding: LoginBinding()),
    GetPage(
      name: _Paths.Login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
        name: _Paths.Register,
        page: () => RegisterView(),
        binding: LoginBinding()),
    GetPage(
      name: _Paths.Home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: _Paths.Login, page: () => LoginView(), binding: LoginBinding()),
    GetPage(name: _Paths.Home, page: () => HomeView(), binding: HomeBinding()),
    GetPage(
        name: _Paths.Locums, page: () => LocumView(), binding: LocumBinding()),
    GetPage(
        name: _Paths.Hospital,
        page: () => HospitalView(),
        binding: HospitalBinding()),
    GetPage(
        name: _Paths.Profile,
        page: () => ProfileView(),
        binding: ProfileBinding()),
    GetPage(
        name: _Paths.BottomNavigation,
        page: () => BottomnavigationView(),
        binding: BottomnavigationBinding()),
    GetPage(
        name: _Paths.specialities,
        page: () => SpecialitiesView(),
        binding: SpecialitiesBinding()),
    GetPage(
        name: _Paths.clinics,
        page: () => ClinicsView(),
        binding: ClinicsBinding()),
    GetPage(name: _Paths.Notification, page: () => NotificationView())
  ];
}
