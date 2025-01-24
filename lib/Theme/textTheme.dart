import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextTheme {
  // Poppins Text Styles
  static TextStyle _poppinsBaseStyle({
    Color color = Colors.blueAccent,
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return GoogleFonts.poppins(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static TextStyle poppinsHeadline(
      {double fontSize = 32.0, FontWeight fontWeight = FontWeight.bold}) {
    return _poppinsBaseStyle(fontSize: fontSize, fontWeight: fontWeight);
  }

  static TextStyle poppinsBody({double fontSize = 14.0}) {
    return _poppinsBaseStyle(fontSize: fontSize);
  }

  static TextStyle poppinsSubtitle({double fontSize = 16.0}) {
    return _poppinsBaseStyle(fontSize: fontSize);
  }

  // Montserrat Text Styles
  static TextStyle _montserratBaseStyle({
    Color color = Colors.blueAccent,
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return GoogleFonts.montserrat(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static TextStyle montserratHeadline(
      {double fontSize = 32.0, FontWeight fontWeight = FontWeight.bold}) {
    return _montserratBaseStyle(fontSize: fontSize, fontWeight: fontWeight);
  }

  static TextStyle montserratBody({double fontSize = 14.0}) {
    return _montserratBaseStyle(fontSize: fontSize);
  }

  static TextStyle montserratSubtitle({double fontSize = 16.0}) {
    return _montserratBaseStyle(fontSize: fontSize);
  }
}
