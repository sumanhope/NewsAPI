import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark AppBar Themes -- */
class TAppBarTheme {
  TAppBarTheme._(); //To avoid creating instances

  // Light theme for the app bar
  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: MFColors.white, size: MFSizes.iconMd),
    actionsIconTheme: IconThemeData(color: MFColors.white, size: MFSizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, color: MFColors.black),
  );

  // Dark theme for the app bar
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: MFColors.white, size: MFSizes.iconMd),
    actionsIconTheme: IconThemeData(color: MFColors.white, size: MFSizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, color: MFColors.white),
  );
}
