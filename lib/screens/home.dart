import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:newsapi/controllers/categorytabcontroller.dart';
import 'package:newsapi/data/bbcpopularnewsapi.dart';
import 'package:newsapi/data/categorynewsapi.dart';
import 'package:newsapi/utils/constants/sizes.dart';
import 'package:newsapi/utils/helper/helper_function.dart';
import 'package:newsapi/widgets/sectionheading.dart';
import 'package:newsapi/widgets/welcomeanddate.dart';
import '../controllers/categorycontroller.dart';
import '../controllers/themecontroller.dart';
import '../utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MFHelperFunctions.isDarkMode(context);
    final size = MediaQuery.of(context).size;
    final ScrollController scrollController = ScrollController();
    final tabController = Get.put(CategoryTabController());
    final themeCont = Get.put(ThemeController());
    final categories = Get.put(CategoryController());

    void scrollToCategoryNews() {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }

    return KeyboardDismisser(
      gestures: const [GestureType.onPanUpdateAnyDirection, GestureType.onTap],
      child: DefaultTabController(
        length: 5,
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
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const WelcomeAndDate(),
                  const SizedBox(
                    height: MFSizes.md,
                  ),
                  const SectionHeading(
                    title: "BBC Top Three News",
                    showButton: false,
                  ),
                  const SizedBox(
                    height: MFSizes.sm,
                  ),
                  SizedBox(
                    height: size.height * 0.43,
                    width: size.width,
                    child: const BBCPopularNewsAPI(),
                  ),
                  const SizedBox(
                    height: MFSizes.sm,
                  ),
                  SectionHeading(
                    title: "Category News",
                    showButton: true,
                    func: scrollToCategoryNews,
                  ),
                  SizedBox(
                    height: size.height * 0.065,
                    child: TabBar(
                      isScrollable: true,
                      indicatorColor: dark ? MFColors.white : MFColors.dark,
                      tabs: categories.allCategories
                          .map(
                            (category) => Tab(
                              child: Text(category),
                            ),
                          )
                          .toList(),
                      onTap: (index) {
                        tabController.changeTabIndex(index);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: MFSizes.md,
                  ),
                  SizedBox(
                    height: size.height * 0.65,
                    child: TabBarView(
                      children: categories.allCategories
                          .map(
                            (element) => CategoryNewsAPI(
                              category: element,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
