import 'package:get/get.dart';

import '../controller/dr_profile_controller.dart';

class DrProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DrProfileController>(
      () => DrProfileController(),
    );
  }
}
