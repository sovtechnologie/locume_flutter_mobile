import 'package:get/get.dart';
import 'package:locume/app/screen/allSpecialities/controller/specialities_controller.dart';

class SpecialitiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpecialitiesController>(
      () => SpecialitiesController(),
    );
  }
}
