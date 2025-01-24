import 'package:get/get.dart';
import 'package:locume/app/screen/hospitalDetails/controller/h_details_controller.dart';

class HDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HDetailsController>(
      () => HDetailsController(),
    );
  }
}
