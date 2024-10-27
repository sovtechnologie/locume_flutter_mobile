import 'package:get/get.dart';
import '../controller/BottomNavigation_Controller.dart';

class BottomnavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomnavigationController>(
      () => BottomnavigationController(),
    );
  }
}
