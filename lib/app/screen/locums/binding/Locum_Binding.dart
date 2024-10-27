import 'package:get/get.dart';
import '../controller/Locum_Controller.dart';

class LocumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocumController>(
      () => LocumController(),
    );
  }
}
