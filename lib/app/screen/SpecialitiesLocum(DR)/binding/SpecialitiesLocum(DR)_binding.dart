import 'package:get/get.dart';
import 'package:locume/app/screen/SpecialitiesLocum(DR)/controller/SpecialitiesLocums(DR)_controller.dart';

class SpecialitieslocumdrBinding extends Bindings {
  final int? specialtyId;
  final String? name;
  SpecialitieslocumdrBinding({this.specialtyId, this.name});
  @override
  void dependencies() {
    Get.lazyPut<SpecialitieslocumsdrController>(
      () => SpecialitieslocumsdrController(specialtyId, name),
    );
  }
}
