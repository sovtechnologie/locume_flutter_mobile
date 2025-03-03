import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileImageView extends StatelessWidget {
  final String? imageUrl;
  final String personName;
  final bool isLocalImage;

  const ProfileImageView({
    Key? key,
    required this.imageUrl,
    required this.personName,
    required this.isLocalImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Full-screen image
          Center(
            child: GestureDetector(
              onTap: () => Get.back(),
              child: isLocalImage
                  ? (imageUrl != null && imageUrl!.isNotEmpty
                      ? Image.file(
                          File(imageUrl!),
                          fit: BoxFit.contain,
                        )
                      : Icon(Icons.person,
                          size: 100,
                          color: Colors.white)) // Placeholder if null
                  : (imageUrl != null && imageUrl!.isNotEmpty
                      ? Image.network(
                          imageUrl!,
                          fit: BoxFit.contain,
                        )
                      : Icon(Icons.person,
                          size: 100, color: Colors.white)), // Placeholder
            ),
          ),

          // Person's name at the top
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Get.back(),
                ),
                Text(
                  personName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 48), // To balance the back button spacing
              ],
            ),
          ),
        ],
      ),
    );
  }
}
