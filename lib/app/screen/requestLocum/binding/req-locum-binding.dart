import 'package:get/get.dart';
import 'package:locume/app/screen/requestLocum/controller/req-locum-controller.dart';

class RequestLocumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RequestLocumController>(
      () => RequestLocumController(),
    );
  }
}
