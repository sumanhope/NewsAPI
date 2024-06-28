import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:newsapi/screens/articledetails.dart';
import 'package:newsapi/utils/constants/sizes.dart';
import 'package:newsapi/widgets/categorynewscontainer.dart';
import '../controllers/favoritecontroller.dart';
import '../utils/constants/colors.dart';
import '../utils/helper/helper_function.dart';

/*
  This screen display all the favorite article, it get all the article from
  local storage. If there are no article in favorite list it will display
  instruction on how to add an article to favorite.
*/
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the theme of app
    final dark = MFHelperFunctions.isDarkMode(context);
    // Instance of Favorite Controller
    final favController = Get.put(FavoriteController());
    return Scaffold(
      appBar: AppBar(
        // appbar color based on theme
        backgroundColor: dark ? Colors.black : MFColors.primary,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Favorites",
          style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        // Use Obx to update the favorite list when added or removed
        child: Obx(() {
          // when favorite list is empty
          if (favController.favorites.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text to display there are no favorite article
                  Text(
                    "You don't have any favorite article.",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: MFSizes.sm,
                  ),
                  // Instruction on how to add an article to favorite
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Click",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        width: MFSizes.sm,
                      ),
                      const Icon(Iconsax.heart_outline),
                      const SizedBox(
                        width: MFSizes.sm,
                      ),
                      Text(
                        "to add an article.",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  )
                ],
              ),
            );
          } else {
            return ListView.builder(
              itemCount: favController.favorites.length,
              itemBuilder: (context, index) {
                final article = favController.favorites[index];
                // Displaying favorite article with custom widget
                return CategoryNewsContianer(
                  imagelink: article.urlToImage,
                  category: "",
                  author: article.author,
                  title: article.title,
                  description: article.description,
                  func: () {
                    // Navigate to article details screen
                    Get.to(() => ArticleDetailsScreen(article: article));
                  },
                );
              },
            );
          }
        }),
      ),
    );
  }
}
