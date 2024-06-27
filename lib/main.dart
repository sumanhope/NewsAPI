import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:newsapi/screens/favorites.dart';
import 'package:newsapi/screens/home.dart';
import 'controllers/initialscreencontroller.dart';
import 'utils/constants/colors.dart';
import 'utils/helper/helper_function.dart';
import 'utils/theme/theme.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NewsAPI',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MFAppTheme.lightTheme,
      darkTheme: MFAppTheme.darkTheme,
      home: const InitialScreen(),
    );
  }
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navcontroller = Get.put(InitialScreenController());
    final List<Widget> pages = [
      const HomeScreen(),
      const FavoriteScreen(),
    ];
    final dark = MFHelperFunctions.isDarkMode(context);
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: Obx(() => pages[navcontroller.index.value]), // Wrap with Obx
        bottomNavigationBar: Obx(() => Container(
              // Wrap with Obx
              color: dark ? Colors.black : MFColors.primary,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 11,
                ),
                child: GNav(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  hoverColor: Colors.white10,
                  backgroundColor: dark ? Colors.black : MFColors.primary,
                  color: const Color.fromARGB(218, 224, 224, 224),
                  activeColor: dark ? Colors.black : Colors.white,
                  tabBackgroundColor: dark ? MFColors.accent : MFColors.secondary,
                  gap: 6,
                  padding: const EdgeInsets.all(10),
                  iconSize: 25,
                  textStyle: TextStyle(
                    fontSize: 15,
                    color: dark ? Colors.black : Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  tabs: [
                    GButton(
                      icon: navcontroller.index.value == 0 ? Iconsax.home_bold : Iconsax.home_1_outline,
                      text: "Home",
                    ),
                    GButton(
                      icon: navcontroller.index.value == 1 ? Iconsax.heart_bold : Iconsax.heart_outline,
                      text: "Favorite",
                    ),
                  ],
                  selectedIndex: navcontroller.index.value,
                  onTabChange: (index) {
                    navcontroller.changeindex(index);
                  },
                ),
              ),
            )),
      ),
    );
  }
}
