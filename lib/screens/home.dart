import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:newsapi/utils/constants/sizes.dart';
import 'package:newsapi/utils/helper/helper_function.dart';
import 'package:newsapi/widgets/sectionheading.dart';
import 'package:newsapi/widgets/welcomeanddate.dart';

import '../controllers/themecontroller.dart';
import '../utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MFHelperFunctions.isDarkMode(context);
    final size = MediaQuery.of(context).size;
    final themeCont = Get.put(ThemeController());
    return KeyboardDismisser(
      gestures: const [GestureType.onPanUpdateAnyDirection, GestureType.onTap],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: dark ? Colors.black : MFColors.primary,
          centerTitle: true,
          title: Text(
            "Home",
            style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),
          ),
          actions: [
            Obx(
              () => IconButton(
                onPressed: () {
                  themeCont.toggleTheme();
                  Get.changeThemeMode(
                    themeCont.dark.value ? ThemeMode.dark : ThemeMode.light,
                  );
                },
                icon: themeCont.dark.value ? const Icon(PixelArtIcons.moon_star) : const Icon(PixelArtIcons.sun_alt),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Column(
              children: [
                const WelcomeAndDate(),
                const SizedBox(
                  height: MFSizes.md,
                ),
                TextField(
                  decoration: InputDecoration(
                    label: Text(
                      "Search",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    prefixIcon: Icon(
                      Iconsax.search_normal_1_outline,
                      color: dark ? MFColors.accent : MFColors.primary,
                    ),
                  ),
                ),
                const SizedBox(
                  height: MFSizes.md,
                ),
                SectionHeading(
                  title: "Popular News",
                  showButton: true,
                  func: () {},
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    print("object");
                  },
                  child: Container(
                    width: size.width,
                    height: size.height * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: size.width,
                          height: size.height * 0.3,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            width: size.width,
                            height: size.height * 0.2,
                            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 15),
                            decoration: BoxDecoration(
                              color: dark ? MFColors.darkContainer : const Color(0xFFDBD3E0),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      LineAwesome.clock,
                                    ),
                                    const SizedBox(
                                      width: MFSizes.xs,
                                    ),
                                    Expanded(
                                        child: Text(
                                      "2 hours ago",
                                      style: Theme.of(context).textTheme.titleSmall,
                                    )),
                                    Text(
                                      "Author: Stuff",
                                      style: Theme.of(context).textTheme.titleSmall,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: MFSizes.md,
                                ),
                                Text(
                                  "Sports",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(
                                  height: MFSizes.md,
                                ),
                                Text(
                                  "How the Blues shifted from 'All Black DNA' to become champions - Stuff How the Blues shifted from 'All Black DNA' to become champions - Stuff",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: MFSizes.md,
                ),
                SectionHeading(
                  title: "Category News",
                  showButton: true,
                  func: () {},
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    print("object");
                  },
                  child: Row(
                    children: [
                      Container(
                        width: size.width * 0.3,
                        height: size.height * 0.135,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      const SizedBox(
                        width: MFSizes.md,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sports",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(
                            height: MFSizes.sm,
                          ),
                          SizedBox(
                            width: size.width * 0.58,
                            child: Text(
                              "How the Blues shifted from 'All Black DNA' to become champions - Stuff How the Blues shifted from 'All Black DNA' to become champions - Stuff",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          const SizedBox(
                            height: MFSizes.sm,
                          ),
                          Text(
                            "Author: Stuff",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: MFSizes.md,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
