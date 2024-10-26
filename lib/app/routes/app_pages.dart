import 'package:get/get.dart';
import 'package:locume/app/screen/getstarted/binding/getstart_binding.dart';
import 'package:locume/app/screen/login/signup/binding/login_binding.dart';
import 'package:locume/app/screen/login/signup/view/login_option.dart';
import 'package:locume/app/screen/login/signup/view/login_view.dart';
import 'package:locume/app/screen/login/signup/view/reqister_view.dart';

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
        name: _Paths.Login, page: () => LoginView(), binding: LoginBinding()),
    GetPage(
        name: _Paths.Register,
        page: () => RegisterView(),
        binding: LoginBinding())
  ];
}
