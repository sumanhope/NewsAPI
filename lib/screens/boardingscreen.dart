import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:newsapi/controllers/themecontroller.dart';
import 'package:newsapi/screens/landing.dart';
import 'package:newsapi/utils/constants/sizes.dart';
import 'package:newsapi/utils/helper/helper_function.dart';
import '../utils/constants/colors.dart';

// Stateless widget for the boarding screen
class BoardingScreen extends StatelessWidget {
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine if the current theme is dark or light
    final dark = MFHelperFunctions.isDarkMode(context);
    // Get the screen size
    final size = MediaQuery.of(context).size;
    // Instance of ThemeController
    final themeCont = Get.put(ThemeController());
    return Scaffold(
      // Set the background color based on the theme
      backgroundColor: dark ? MFColors.black : MFColors.accent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          // Use Obx to update the theme icon button
          Obx(
            () => IconButton(
              onPressed: () {
                //Toggle the theme when the button is pressed
                themeCont.toggleTheme();
              },
              // Display the appropriate icon based on the current theme
              icon: themeCont.dark.value
                  ? const Icon(
                      PixelArtIcons.moon_star,
                      color: Colors.white,
                    )
                  : const Icon(
                      PixelArtIcons.sun_alt,
                      color: MFColors.black,
                    ),
            ),
          ),
        ],
      ),
      // SingleChildScrollView so the page can be scrollable
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Center(
            child: Column(
              children: [
                //whitespaces
                const SizedBox(
                  height: MFSizes.spaceBtwSections,
                ),
                //Welcome Text
                Text(
                  "Welcome to NewsAPI",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                //whitespaces
                const SizedBox(
                  height: MFSizes.xs,
                ),
                //Subtitle
                Text(
                  "Get your daily dose of News.",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                //whitespaces
                const SizedBox(
                  height: MFSizes.spaceBtwSections,
                ),
                // Placeholder for an animation
                Container(
                  width: size.width,
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/defaultnewsimage.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //whitespaces
                const SizedBox(
                  height: MFSizes.spaceBtwSections,
                ),
                // Button to navigate to the Landing Screen
                SizedBox(
                  width: size.width * 0.7,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the Landing Screen using GetX
                      Get.to(() => const LandingScreen());
                    },
                    child: Text(
                      "CONTINUE",
                      style: Theme.of(context).textTheme.headlineSmall!.apply(
                            color: Colors.white,
                            letterSpacingDelta: 2,
                          ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
