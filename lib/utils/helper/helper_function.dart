import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

/*
  This class provides various helper functions for common tasks such as showing 
  SnackBars, Alerts, text truncation, checking dark mode, retrieving screen 
  size, and formatting dates.

 */
class MFHelperFunctions {
  // Method to show a SnackBar with a provided message
  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  // Method to show an AlertDialog with a provided title and message
  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Method to truncate text to a specified maxLength
  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  // Method to check if the current theme mode is dark
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // Method to get the screen size using MediaQuery
  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  // Method to format a DateTime object into a string with a specified format
  static String getFormattedDate(DateTime date, {String format = 'dd MMMM yyyy'}) {
    return DateFormat(format).format(date);
  }
}
