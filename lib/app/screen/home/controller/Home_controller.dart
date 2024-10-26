import 'package:get/get.dart';

class HomeControlller extends GetxController {
  var index = 1.obs;

  void setIndex(int value) {
    index.value = value;
  }
}
