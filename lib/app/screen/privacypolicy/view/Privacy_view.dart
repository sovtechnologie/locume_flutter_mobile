import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../Theme/theme.dart';
import '../../../../widget/reusedwidget.dart';
import '../controller/Privacy_Controller.dart';

class PrivacyView extends GetView<PrivacyController> {
  PrivacyView({super.key}) {
    Get.put(PrivacyController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Privacy Policy',
        ),
        actions: [
          Transform.translate(
              offset: Offset(-15, 0),
              child: Icon(
                Icons.notifications_active_rounded,
                color: HexColor('#0866C6'),
              ))
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
        child: Column(
          children: [
            controller.privacyPolicy.isEmpty
                ? Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: LoadingAnimationWidget.hexagonDots(
                        color: Colors.yellow,
                        size: 20,
                      ),
                    ),
                  )
                : Expanded(
                    // Wrap the ListView.builder with Expanded
                    child: ListView.builder(
                      controller: controller.scrollController,
                      itemCount: controller.privacyPolicy.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              const EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 0.0),
                          child: Column(
                            children: [
                              policy(
                                controller.privacyPolicy[index]['title']
                                    .toString(),
                                controller.privacyPolicy[index]['body']
                                    .toString(),
                              ),
                              space(double.maxFinite, 20.0),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
