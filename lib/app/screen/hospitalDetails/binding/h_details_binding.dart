import 'package:get/get.dart';
import 'package:locume/app/screen/hospitalDetails/controller/h_details_controller.dart';

class HDetailsBinding extends Bindings {
  final int? hospitalId;
  final bool? isClinic;
  HDetailsBinding({this.hospitalId, this.isClinic});

  @override
  void dependencies() {
    Get.lazyPut<HDetailsController>(
      () => HDetailsController(hospitalId, isClinic),
    );
  }
}
