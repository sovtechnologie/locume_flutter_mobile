import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

Color primaryColor = HexColor('#0866C6');
Color secondaryColor = HexColor('#FFFFFF');
const Color scaffoldBackgroundColor = Color(0xffFFFFFF);
const Color accentColor = Color(0xffFFFFFF);
const Color errorColor = Color(0xffEB4456);
const Color cardColor = Color(0xfff7fbfc);
const Color introBackgroundColor = Color(0xff000000);
const Color descriptionColor = Color(0xffF5F5F5);
const Color titleColor = Color(0xff585858);
const Color subtitleColor = Color(0xff6f6060);
const Color whiteTextColor = Color(0xffffffff);
const Color hintTextColor = Color(0xff6f6060);
const Color textColor = Color(0xff6f6060);

const MaterialColor kprimary = MaterialColor(
  0xff0E4672,
  <int, Color>{
    50: Color(0xff0A71B4),
    100: Color(0xff0A71B4),
    200: Color(0xff0A71B4),
    300: Color(0xff0A71B4),
    400: Color(0xff0A71B4),
    500: Color(0xff0A71B4),
    600: Color(0xff0A71B4),
    700: Color(0xff0A71B4),
    800: Color(0xff0A71B4),
    900: Color(0xff0A71B4),
  },
);

List<BoxShadow> shadow({Color? color}) => [
      BoxShadow(
        color: color?.withOpacity(0.5) ?? primaryColor.withOpacity(0.5),
        spreadRadius: 1,
        blurRadius: 3,
        offset: const Offset(0, 1),
      ),
    ];
ThemeData themeData(BuildContext context) {
  final baseTextTheme = GoogleFonts.poppinsTextTheme();

  return ThemeData(
    primaryColor: primaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    brightness: Brightness.light,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: whiteTextColor,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: whiteTextColor.withOpacity(0.6),
      unselectedLabelColor: whiteTextColor.withOpacity(0.4),
    ),
    textTheme: baseTextTheme.copyWith(
      bodyLarge: const TextStyle(color: textColor, inherit: true),
      bodyMedium: const TextStyle(color: textColor, inherit: true),
      displayLarge: const TextStyle(color: textColor, inherit: true),
      displayMedium: const TextStyle(color: textColor, inherit: true),
      titleMedium: const TextStyle(color: textColor, inherit: true),
      bodySmall: const TextStyle(color: textColor, inherit: true),
      labelLarge: const TextStyle(color: textColor, inherit: true),
    ),
    focusColor: primaryColor,
    indicatorColor: primaryColor,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: kprimary).copyWith(
      error: errorColor,
      secondary: primaryColor,
      primary: primaryColor,
      brightness: Brightness.light,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(color: hintTextColor, fontSize: 15),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: textColor),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
      ),
    ),
  );
}
