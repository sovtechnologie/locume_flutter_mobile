import 'package:get/get.dart';

import '../controller/getstrat_controller.dart';

class Start1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Start1Controller>(
      () => Start1Controller(),
    );
  }
}
