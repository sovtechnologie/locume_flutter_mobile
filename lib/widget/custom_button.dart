import 'package:flutter/material.dart';

class CustomisableButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  final Color? textColor;
  final double height;
  final double width;

  const CustomisableButton(
      {Key? key,
      required this.text,
      required this.onTap,
      this.color = const Color.fromRGBO(8, 102, 198, 1), // Default button color
      this.textColor = Colors.white, // Default text color
      this.height = 50.0,
      this.width = double.infinity // Default height
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: SizedBox(
        width: width,
        height: height, // Set a fixed height for the button
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            foregroundColor: textColor,
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
