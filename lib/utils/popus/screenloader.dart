import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenLoader {
  // method to indicate loading state
  static void openLoadingDialog() {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  // method to stop loading
  static stopLoadingDialog() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
