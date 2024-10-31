import 'package:get/get.dart';
import '../controller/Clinics_Controller.dart';

class ClinicsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClinicsController>(
      () => ClinicsController(),
    );
  }
}
