import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:locume/app/screen/login/signup/model/register_res.dart' as r;

class AuthProvider extends GetxService {
  Rx<r.Register?> user = Rx<r.Register?>(null);
  Rx<String?> token = Rx<String?>(null);
  Rx<String?> customId = Rx<String?>(null); // Store custom_id

  @override
  void onInit() {
    super.onInit();
    log('AuthProvider started');
  }

  // Method to set user data
  void setUser(r.Register userData) {
    user.value = userData;
    customId.value = userData.user?.customId; // Set custom_id
  }

  r.User? get getUser => user.value?.user;
  String? get getCustomId => customId.value; // Getter for custom_id
}
