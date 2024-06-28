import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newsapi/screens/boardingscreen.dart';
import 'utils/theme/theme.dart';

void main() async {
  //initializing the local storage.
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NewsAPI',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MFAppTheme.lightTheme, // light theme
      darkTheme: MFAppTheme.darkTheme, // dark theme
      home: const BoardingScreen(), // first screen
    );
  }
}
