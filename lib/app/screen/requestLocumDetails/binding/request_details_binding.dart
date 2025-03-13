import 'package:get/get.dart';
import 'package:locume/app/screen/requestLocum/controller/req-locum-controller.dart';
import 'package:locume/app/screen/requestLocumDetails/controller/request_details_controller.dart';

class RequestDetailsBinding extends Bindings {
  final int? id;
  RequestDetailsBinding({this.id});

  @override
  void dependencies() {
    Get.lazyPut<RequestDetailsController>(
      () => RequestDetailsController(id),
    );
  }
}
