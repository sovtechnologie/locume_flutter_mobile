import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:locume/app/screen/SpecialitiesLocum(DR)/controller/SpecialitiesLocums(DR)_controller.dart';
import '../../../../widget/reusedwidget.dart';

class SpecialitieslocumsDR extends GetView<SpecialitieslocumsdrController> {
  const SpecialitieslocumsDR({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.name ?? ""),
      ),
      body: Obx(
        () => controller.spedr.isEmpty
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
            : SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics:
                            const ClampingScrollPhysics(), // Allow scrolling
                        itemCount: controller.spedr.length,
                        itemBuilder: (context, index) {
                          final spedoctor = controller.spedr[index];

                          return Padding(
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 16.0),
                            child: doctorcard(
                              spedoctor.profileImage ??
                                  'https://via.placeholder.com/150',
                              '${spedoctor.firstName ?? ''} ${spedoctor.lastName ?? ''}',
                              spedoctor.medicalId ?? '',
                              spedoctor.aboutMe ?? 'No details provided',
                              spedoctor.totalExp?.toString() ?? '0',
                              spedoctor.location ?? 'Not specified',
                              spedoctor.customId ?? '0',
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
