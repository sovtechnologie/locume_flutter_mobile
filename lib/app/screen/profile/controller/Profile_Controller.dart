import 'dart:convert';

import 'package:get/get.dart';
import 'package:locume/api/api_provider.dart';
import 'package:locume/api/auth_provider.dart';
import 'package:locume/app/screen/drprofile/model/drprofile_model.dart'
    as DrProfile;
import 'package:locume/app/screen/drprofile/model/drprofile_model.dart';

class ProfileController extends GetxController {
  var index = 1.obs;
  Rx<List<DrProfile.Result>> dr_data = Rx<List<DrProfile.Result>>([]);
  RxBool isLoading = true.obs; // To track loading state
  @override
  void onInit() {
    super.onInit();
    getDrData();
  }

  void setIndex(int value) {
    index.value = value;
  }

  final custom_id = Get.find<AuthProvider>().customId;
  getDrData() async {
    try {
      final response = await ApiProvider.get(
          '/api/users/getSingleUserById/$custom_id',
          head: {
            'Content-Type': 'application/json',
          });

      final map = jsonDecode(response.body);
      print("Profile data");
      print(map);
      Drprofile res = Drprofile.fromJson(map);

      if (res.status == 200) {
        dr_data.value = res.result ?? [];
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false; // Set loading to false once the data is fetched
    }
  }
}
