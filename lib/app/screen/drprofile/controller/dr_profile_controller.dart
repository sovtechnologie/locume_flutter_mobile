import 'dart:convert';
import 'package:get/get.dart';
import 'package:locume/api/api_provider.dart';
import 'package:locume/app/screen/drprofile/model/drprofile_model.dart'
    as DrProfile;
import 'package:locume/app/screen/drprofile/model/drprofile_model.dart';

class DrProfileController extends GetxController {
  String id = Get.arguments;
  Rx<List<DrProfile.Result>> dr_data = Rx<List<DrProfile.Result>>([]);
  RxBool isLoading = true.obs; // To track loading state

  @override
  void onInit() {
    super.onInit();
    getDrData();
  }

  getDrData() async {
    try {
      final response =
          await ApiProvider.get('/api/users/getSingleUserById/$id', head: {
        'Content-Type': 'application/json',
      });

      final map = jsonDecode(response.body);
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
