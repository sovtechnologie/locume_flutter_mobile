import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:locume/Theme/theme.dart';
import 'package:locume/app/screen/notification/controller/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(color: HexColor("#F0F3F5")),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Text(
                      "All Notifications",
                      style: TextStyle(
                          fontSize: 16,
                          color: primaryColor,
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.calendar_month,
                      color: primaryColor,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: primaryColor.withOpacity(0.50)),
                  ),
                  buildInfoCard(
                    imagePath: 'assets/Process.png',
                    title: 'Refund Under Process',
                    description:
                        'Lorem ipsum dolor sit amet. Et architecto sequi sed aperiam autem ea consequuntur vero ut omnis sint qui voluptate quidem in deserunt recusandae.',
                    time: 'At 05:57 Pm',
                  ),
                  buildInfoCard(
                    imagePath: 'assets/Process.png',
                    title: 'Your booking is cancelled',
                    description:
                        'Lorem ipsum dolor sit amet. Et architecto sequi sed aperiam autem ea consequuntur vero ut omnis sint qui voluptate quidem in deserunt recusandae.',
                    time: 'At 05:57 Pm',
                  ),
                  Text(
                    "Yesterday",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: primaryColor.withOpacity(0.50)),
                  ),
                  buildInfoCard(
                    imagePath: 'assets/Process.png',
                    title: 'Refund Under Process',
                    description:
                        'Lorem ipsum dolor sit amet. Et architecto sequi sed aperiam autem ea consequuntur vero ut omnis sint qui voluptate quidem in deserunt recusandae.',
                    time: 'At 05:57 Pm',
                  ),
                  buildInfoCard(
                    imagePath: 'assets/Process.png',
                    title: 'Your booking is cancelled',
                    description:
                        'Lorem ipsum dolor sit amet. Et architecto sequi sed aperiam autem ea consequuntur vero ut omnis sint qui voluptate quidem in deserunt recusandae.',
                    time: 'At 05:57 Pm',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildInfoCard({
  required String imagePath,
  required String title,
  required String description,
  required String time,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 18.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(imagePath),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  description,
                  overflow: TextOverflow.visible,
                ),
                Row(
                  children: [
                    const Spacer(), // Pushes the time text to the right
                    Text(
                      time,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
