import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locume/Theme/theme.dart';
import 'package:locume/app/screen/profile/controller/Profile_Controller.dart';
import 'package:locume/app/screen/login/signup/model/specialtie_model.dart'
    as specialtie;
import 'package:locume/widget/custom_button.dart';

class Addspecialities extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Specialities")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Field
            TextField(
              onChanged: (value) => controller.searchQuery.value = value,
              decoration: InputDecoration(
                hintText: "Search Specialties...",
                prefixIcon: Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),

            // List of Specialties with Selected Ones on Top
            Expanded(
              child: Obx(() {
                final filteredList = controller
                    .getFilteredSpecialties(controller.searchQuery.value);

                if (filteredList.isEmpty) {
                  return Center(child: Text("No specialties found."));
                }

                // Sort selected specialties to the top
                final sortedList = List<specialtie.Result>.from(filteredList);
                sortedList.sort((a, b) {
                  bool isSelectedA =
                      controller.selectedSpecialties.contains(a.id);
                  bool isSelectedB =
                      controller.selectedSpecialties.contains(b.id);
                  return (isSelectedB ? 1 : 0).compareTo(isSelectedA ? 1 : 0);
                });

                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SingleChildScrollView(
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: sortedList
                          .map((specialty) => selectableBoxField(
                              id: specialty.id ?? 0,
                              text: specialty.specialtiesName ?? ""))
                          .toList(),
                    ),
                  ),
                );
              }),
            ),

            // Print Selected Specialties Button
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: CustomisableButton(
                text: "Print Selected",
                onTap: () {
                  controller.editSpecialties(controller.selectedSpecialties);
                  print(
                      "Selected Specialties IDs: ${controller.selectedSpecialties}");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Selectable box widget
  Widget selectableBoxField({required int id, required String text}) {
    return Obx(() {
      bool isSelected = controller.selectedSpecialties.contains(id);

      return GestureDetector(
        onTap: () {
          controller.toggleSpecialty(id);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: isSelected ? primaryColor.withOpacity(0.1) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1.5,
              color: isSelected ? primaryColor : Colors.grey,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isSelected ? Icons.check_box : Icons.check_box_outline_blank,
                color: isSelected ? primaryColor : Colors.grey,
              ),
              SizedBox(width: 5),
              Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? primaryColor : Colors.grey,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      );
    });
  }
}
