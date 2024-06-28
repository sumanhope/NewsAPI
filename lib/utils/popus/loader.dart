import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../helper/helper_function.dart';

class MFLoader {
  // Method to hide the current SnackBar
  static hideSnackBar() => ScaffoldMessenger.of(Get.overlayContext!).hideCurrentMaterialBanner();

  // Method to show a custom toast message
  static currentToast({required message}) {
    ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: MFHelperFunctions.isDarkMode(Get.context!) ? MFColors.darkerGrey.withOpacity(0.9) : MFColors.grey.withOpacity(0.9),
          ),
          child: Center(
            child: Text(
              message,
              style: Theme.of(Get.context!).textTheme.labelLarge,
            ),
          ),
        ),
      ),
    );
  }

  // Method to show a success SnackBar
  static successSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: MFColors.success,
      snackStyle: SnackStyle.GROUNDED,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(0),
      icon: const Icon(
        Icons.check,
        color: Colors.white,
      ),
    );
  }

  // Method to show a warning SnackBar
  static warningSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: MFColors.warning,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.GROUNDED,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(0),
      icon: const Icon(
        Icons.warning,
        color: Colors.white,
      ),
    );
  }

  // Method to show an error SnackBar
  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.red.shade500,
      snackStyle: SnackStyle.GROUNDED,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(0),
      icon: const Icon(
        Icons.warning_amber,
        color: Colors.white,
      ),
    );
  }
}
