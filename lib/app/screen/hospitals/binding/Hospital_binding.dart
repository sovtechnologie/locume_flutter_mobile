import 'package:get/get.dart';
import '../controller/Hospital_Controller.dart';

class HospitalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HospitalController>(
      () => HospitalController(),
    );
  }
}
