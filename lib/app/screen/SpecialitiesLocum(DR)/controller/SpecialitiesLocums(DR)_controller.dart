import 'dart:convert';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:locume/api/api_provider.dart';
import 'package:locume/app/screen/SpecialitiesLocum(DR)/model/Specialitiesdoctors_model.dart'
    as specialdoctors;

class SpecialitieslocumsdrController extends GetxController {
  final RxList<specialdoctors.Result> spedr = <specialdoctors.Result>[].obs;
  final int? specialtyId;
  final String? name;
  SpecialitieslocumsdrController(this.specialtyId, this.name);

  @override
  void onInit() {
    super.onInit();
    if (specialtyId != null) {
      getspecialdoctors(specialtyId ?? 0);
    }
  }

  Future<void> getspecialdoctors(int specialtyId) async {
    try {
      final response = await ApiProvider.post(
        "/api/filter/specialtiesFilters",
        data: {"specialtyId": specialtyId},
        head: {"Content-Type": "application/json"},
      );

      final map = jsonDecode(response.body);
      specialdoctors.SpecialtiesDoctors res =
          specialdoctors.SpecialtiesDoctors.fromJson(map);

      if (res.status == 200) {
        spedr.value = res.result ?? [];
      } else {
        spedr.clear();
      }
      print(res);
    } catch (e) {
      print("Error fetching special doctors: $e");
    }
  }
}
