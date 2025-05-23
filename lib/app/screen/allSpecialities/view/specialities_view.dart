import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:locume/Theme/textTheme.dart';
import 'package:locume/Theme/theme.dart';
import 'package:locume/app/screen/allSpecialities/controller/specialities_controller.dart';

import '../../../../widget/reusedwidget.dart';

class SpecialitiesView extends GetView<SpecialitiesController> {
  const SpecialitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Specialities"),
      ),
      body: Obx(() => controller.specialtiesList.isEmpty
          ? Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: LoadingAnimationWidget.hexagonDots(
                  color: Colors.yellow,
                  size: 100,
                ),
              ),
            )
          : ListView.builder(
              itemCount: controller.specialtiesList.length,
              itemBuilder: (context, index) {
                final special = controller.specialtiesList[index];
                final imagePath = special.specialtiesImages;
                final title = special.specialtiesName;
                const description = 'Description needed in API';

                return buildSpecialityCard(
                    id: controller.specialtiesList[index].id ?? 0,
                    imagePath: imagePath != null &&
                            Uri.tryParse(imagePath)?.isAbsolute == true
                        ? imagePath
                        : 'https://via.placeholder.com/150', // Fallback for invalid URL
                    title: title ?? "",
                    description: special.specialtiesDescription ?? "");
              },
            )),
    );
  }
}
