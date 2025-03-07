import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:locume/api/api_provider.dart';
import 'package:locume/app/screen/drprofile/model/drprofile_model.dart'
    as DrProfile;
import 'package:locume/app/screen/drprofile/model/drprofile_model.dart';
import 'package:locume/app/screen/login/signup/model/category_model.dart' as c;
import 'package:locume/app/screen/login/signup/model/specialtie_model.dart'
    as s;

class DrProfileController extends GetxController {
  String id = Get.arguments;
  Rx<List<DrProfile.Result>> dr_data = Rx<List<DrProfile.Result>>([]);
  RxBool isLoading = true.obs; // To track loading state
  final RxList<s.Result> specialtiesList = <s.Result>[].obs;
  RxList selectedSpecialties = [].obs;
  final RxList<c.Result> categoryList = <c.Result>[].obs;

  // To store the filtered names of specialties and categories
  RxList<String> selectedSpecialtiesNames = <String>[].obs;
  RxList<String> selectedCategoriesNames = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    getDrData();
  }

  Future<void> getSpecialites() async {
    final response = await ApiProvider.get("/api/list/specialties",
        head: {"Content-Type": "application/json"});
    final map = jsonDecode(response.body);
    s.Specialties res = s.Specialties.fromJson(map);

    if (res.status == 200) {
      specialtiesList.value = res.result ?? [];
    }
  }

  Future<void> getCatgory() async {
    final response = await ApiProvider.get("/api/list/category",
        head: {"Content-Type": "application/json"});
    final map = jsonDecode(response.body);
    c.CategoryModel res = c.CategoryModel.fromJson(map);

    if (res.status == 200) {
      categoryList.value = res.result ?? [];
    }
  }

  getDrData() async {
    try {
      final response =
          await ApiProvider.get('/api/users/getUserCompleteDataV2/$id', head: {
        'Content-Type': 'application/json',
      });

      final map = jsonDecode(response.body);
      print(map);
      DrProfile.Drprofile res = DrProfile.Drprofile.fromJson(map);
      print(res);
      if (res.status == 200) {
        dr_data.value = res.result ?? [];
        // Call category and specialty APIs
        await getCatgory();
        await getSpecialites();
        // selectedSpecialties.value = dr_data.value[0].category ?? [];
        // // Map the IDs to their names
        // mapCategoryNames(res.result?.first.category ?? []);
        // mapSpecialtiesNames(res.result?.first.preferredSpecialities ?? []);
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false; // Set loading to false once the data is fetched
    }
  }

  // Map category IDs to their names
  void mapCategoryNames(List<dynamic> categoryIds) {
    selectedCategoriesNames.clear();
    for (var categoryId in categoryIds) {
      var category = categoryList.firstWhere((c) => c.id == categoryId,
          orElse: () => c.Result(id: -1, categoryName: 'Unknown'));
      if (category.id != -1) {
        selectedCategoriesNames.add(category.categoryName ?? 'Unknown');
      }
    }
  }

  // Map specialties IDs to their names
  void mapSpecialtiesNames(List<dynamic> specialtyIds) {
    selectedSpecialtiesNames.clear();
    for (var specialtyId in specialtyIds) {
      var specialty = specialtiesList.firstWhere((s) => s.id == specialtyId,
          orElse: () => s.Result(id: -1, specialtiesName: 'Unknown'));
      if (specialty.id != -1) {
        selectedSpecialtiesNames.add(specialty.specialtiesName ?? 'Unknown');
      }
    }
  }
}
