import 'package:get/get.dart';
import 'package:locume/app/screen/manage/controller/manage_Controller.dart';

class ManageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageController>(
      () => ManageController(),
    );
  }
}
