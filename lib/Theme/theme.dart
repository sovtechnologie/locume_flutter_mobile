import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

Color primaryColor = HexColor('#0866C6');
Color white = HexColor('#FFFFFF');
Color secondaryColor = HexColor('#1E5A84');
Color hintTextColor = HexColor('#9A9A9A');
Color lightblue = HexColor('#2A7FBA');
Color textColor = HexColor("#326295");

Color scaffoldBackgroundColor = Color(0xffFFFFFF);
Color accentColor = Color(0xffFFFFFF);
Color errorColor = Color(0xffEB4456);
Color cardColor = Color(0xfff7fbfc);
Color introBackgroundColor = Color(0xff000000);
Color descriptionColor = Color(0xffF5F5F5);
Color titleColor = Color(0xff585858);

Color whiteTextColor = Color(0xffffffff);

MaterialColor kprimary = MaterialColor(
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
        offset: Offset(0, 1),
      ),
    ];
ThemeData themeData(BuildContext context) {
  final baseTextTheme = GoogleFonts.poppinsTextTheme();

  return ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(white),
        backgroundColor: WidgetStateProperty.all(primaryColor),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
    appBarTheme:
        AppBarTheme(backgroundColor: primaryColor, foregroundColor: white),
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
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: whiteTextColor,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: whiteTextColor.withOpacity(0.6),
      unselectedLabelColor: whiteTextColor.withOpacity(0.4),
    ),
    textTheme: baseTextTheme.copyWith(
      bodyLarge: TextStyle(color: textColor, inherit: true),
      bodyMedium: TextStyle(color: textColor, inherit: true),
      displayLarge: TextStyle(color: textColor, inherit: true),
      displayMedium: TextStyle(color: textColor, inherit: true),
      titleMedium: TextStyle(color: textColor, inherit: true),
      bodySmall: TextStyle(color: textColor, inherit: true),
      labelLarge: TextStyle(color: textColor, inherit: true),
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
      hintStyle: TextStyle(
          color: hintTextColor, fontSize: 14, fontWeight: FontWeight.w400),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: textColor),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
      ),
    ),
  );
}
