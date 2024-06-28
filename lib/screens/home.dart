import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
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

/*
  This screen display todays date, Top three BBC News, and also have tabs where
  it have news based on category like General, Sports, Health and more.
*/
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Get current theme
    final dark = MFHelperFunctions.isDarkMode(context);

    //Get screen size
    final size = MFHelperFunctions.screenSize();

    // Instance of scroll controller
    final ScrollController scrollController = ScrollController();

    // Instance of Tab controller
    final tabController = Get.put(CategoryTabController());

    // Instance of Theme controller
    final themeCont = Get.put(ThemeController());

    // Instance of Category controller
    final categories = Get.put(CategoryController());

    // Function to scroll screen to category tabs
    void scrollToCategoryNews() {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }

    return DefaultTabController(
      // total categories in category tab
      length: categories.allCategories.length,
      child: Scaffold(
        appBar: AppBar(
          // appbar color based on theme
          backgroundColor: dark ? Colors.black : MFColors.primary,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Home",
            style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),
          ),
          actions: [
            // User Obx to update theme icon based on theme
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
                      )
                    : const Icon(
                        PixelArtIcons.sun_alt,
                      ),
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
                // Custom widget to display date
                const WelcomeAndDate(),
                const SizedBox(
                  height: MFSizes.md,
                ),
                // Custom widget to display heading
                const SectionHeading(
                  title: "BBC Top Three News",
                  showButton: false,
                ),
                const SizedBox(
                  height: MFSizes.sm,
                ),
                // Display top three BBC news articles
                SizedBox(
                  height: size.height * 0.43,
                  width: size.width,
                  child: const BBCPopularNewsAPI(),
                ),
                const SizedBox(
                  height: MFSizes.sm,
                ),
                // Custom widget to display heading
                SectionHeading(
                  title: "Category News",
                  showButton: true,
                  func: scrollToCategoryNews, // function to scroll screen
                ),
                SizedBox(
                  height: size.height * 0.065,
                  child: TabBar(
                    isScrollable: true,
                    indicatorColor: dark ? MFColors.white : MFColors.dark,
                    // Display category tabs
                    tabs: categories.allCategories
                        .map(
                          (category) => Tab(
                            child: Text(category),
                          ),
                        )
                        .toList(),
                    onTap: (index) {
                      // Change tab index
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
                    // Display category news based on selected tab
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
    );
  }
}
