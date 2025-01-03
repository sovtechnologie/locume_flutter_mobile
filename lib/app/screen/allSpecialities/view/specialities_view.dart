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
      body: Obx(() => controller.data.isEmpty
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
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                final special = controller.data[index];
                final imagePath = special['specialties_images']?.toString();
                final title =
                    special['specialties_name']?.toString() ?? 'No Title';
                const description = 'Description needed in API';

                return buildSpecialityCard(
                  imagePath: imagePath != null &&
                          Uri.tryParse(imagePath)?.isAbsolute == true
                      ? imagePath
                      : 'https://via.placeholder.com/150', // Fallback for invalid URL
                  title: title,
                  description: description,
                );
              },
            )),
    );
  }
}
