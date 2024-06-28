import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'widget_themes/appbar_theme.dart';
import 'widget_themes/elevated_button_theme.dart';
import 'widget_themes/outlined_button_theme.dart';
import 'widget_themes/text_theme.dart';

// Light and dark theme
class MFAppTheme {
  MFAppTheme._(); // to avoid creating instance

  //Light theme of app
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: MFColors.grey,
    brightness: Brightness.light,
    primaryColor: MFColors.primary,
    textTheme: TTextTheme.lightTextTheme,
    scaffoldBackgroundColor: const Color.fromARGB(255, 231, 231, 231),
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
  );

  //Dark theme of app
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: MFColors.grey,
    brightness: Brightness.dark,
    primaryColor: MFColors.primary,
    textTheme: TTextTheme.darkTextTheme,
    scaffoldBackgroundColor: MFColors.black,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
  );
}
