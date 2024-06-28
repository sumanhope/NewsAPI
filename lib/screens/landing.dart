import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:newsapi/controllers/landingscreencontroller.dart';
import 'package:newsapi/screens/favorites.dart';
import 'package:newsapi/screens/home.dart';
import '../utils/constants/colors.dart';
import '../utils/helper/helper_function.dart';

/*
  This screen displays a bottom navigation bar with Home and Favorite tabs, 
  allowing navigation between the HomeScreen and FavoriteScreen.

*/
class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Instance of LandingScreenController to manage navigation index
    final navcontroller = Get.put(LandingScreenController());

    // List of pages to display in the bottom navigation bar
    final List<Widget> pages = [
      const HomeScreen(), // Home screen
      const FavoriteScreen(), // Favorites screen
    ];

    // Check current theme mode
    final dark = MFHelperFunctions.isDarkMode(context);

    return WillPopScope(
      onWillPop: () async {
        return true; // Allow back navigation
      },
      child: Scaffold(
        body: Obx(() => pages[navcontroller.index.value]), // Display current page based on index
        bottomNavigationBar: Obx(
          () => Container(
            color: dark ? Colors.black : MFColors.primary, // Set bottom nav bar background color based on theme
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 11,
              ),
              child: GNav(
                // Uses google nav bar package for the navigation bar
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
                  // Home tab
                  GButton(
                    //icon based on index value
                    icon: navcontroller.index.value == 0 ? Iconsax.home_bold : Iconsax.home_1_outline,
                    text: "Home",
                  ),
                  // Favorite tab
                  GButton(
                    //icon based on index value
                    icon: navcontroller.index.value == 1 ? Iconsax.heart_bold : Iconsax.heart_outline,
                    text: "Favorite",
                  ),
                ],

                selectedIndex: navcontroller.index.value,
                onTabChange: (index) {
                  navcontroller.changeindex(index); // Change navigation index on tab change
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
