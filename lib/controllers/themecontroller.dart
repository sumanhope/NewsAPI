import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Controller class to manage theme changes using GetX
class ThemeController extends GetxController {
  // Observable boolean to track if the current theme is dark mode
  RxBool dark = true.obs;

  // Method to toggle between dark and light themes
  void toggleTheme() {
    // Switch the value of the dark
    dark.value = !dark.value;
    // Change the theme mode in the application using GetX
    Get.changeThemeMode(
      dark.value ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
