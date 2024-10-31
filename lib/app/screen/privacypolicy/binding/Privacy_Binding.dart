import 'package:get/get.dart';
import '../controller/Privacy_Controller.dart';

class PrivacyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrivacyController>(
      () => PrivacyController(),
    );
  }
}
