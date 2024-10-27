import 'package:get/get.dart';

class LocumController extends GetxController {
  var index = 1.obs;

  void setIndex(int value) {
    index.value = value;
  }
}
