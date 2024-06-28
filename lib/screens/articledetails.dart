import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:newsapi/controllers/favoritecontroller.dart';
import 'package:newsapi/utils/constants/sizes.dart';
import 'package:newsapi/utils/popus/loader.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/newsmodel.dart';
import '../utils/constants/colors.dart';
import '../utils/helper/helper_function.dart';

/* 
  This Screen displays the details of a specific article, including its title, 
  author, publication date, image, description, content, and a button to continue 
  reading the full article.
*/
class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({super.key, required this.article});
  // The article being displayed on this screen
  final Article article;

  @override
  Widget build(BuildContext context) {
    // Get current theme
    final dark = MFHelperFunctions.isDarkMode(context);

    // Gets the screen size
    final size = MFHelperFunctions.screenSize();

    // Instance of FavoriteController for managing favorites
    final favcontroller = Get.put(FavoriteController());

    return Scaffold(
      appBar: AppBar(
        // appbar color based on theme
        backgroundColor: dark ? Colors.black : MFColors.primary,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(PixelArtIcons.arrow_left),
          onPressed: () {
            // Navigate back when the back arrow button is pressed
            Get.back();
          },
        ),
        title: Text(
          "Article Details",
          style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),
        ),
        actions: [
          // User Obx to update the favorite icon button
          Obx(
            () => IconButton(
              onPressed: () {
                // Toggle favorite status of the article
                favcontroller.toggleFavorite(article);
              },
              // Change favorite icon based on status of the article
              icon: favcontroller.favorites.contains(article)
                  ? Icon(
                      Iconsax.heart_bold,
                      color: dark ? Colors.white : Colors.red,
                    )
                  : Icon(
                      Iconsax.heart_outline,
                      color: dark ? Colors.white : Colors.red,
                    ),
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
              const SizedBox(
                height: MFSizes.sm,
              ),
              // Display the title of the article
              Text(
                article.title,
                style: Theme.of(context).textTheme.headlineSmall!.apply(fontWeightDelta: 2),
              ),
              const SizedBox(
                height: MFSizes.sm,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Display the author's name
                  SizedBox(
                    width: size.width * 0.6,
                    child: Text(
                      article.author,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    width: MFSizes.sm,
                  ),
                  // Display the published date of the article
                  Text(
                    MFHelperFunctions.getFormattedDate(article.publishedAt), // change the format of date
                  ),
                ],
              ),
              const SizedBox(
                height: MFSizes.md,
              ),
              // display image of the news
              Container(
                height: size.height * 0.3,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                // Display default image when the news image is loading
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  // default image fade away when the news image is completely loaded
                  child: FadeInImage(
                    fadeOutDuration: const Duration(milliseconds: 500),
                    fadeInDuration: const Duration(milliseconds: 100),
                    placeholder: const AssetImage("assets/images/defaultnewsimage.jpg"),
                    // Display the article's image or default image if empty
                    image: article.urlToImage.isEmpty ? const AssetImage("assets/images/defaultnewsimage.jpg") as ImageProvider : NetworkImage(article.urlToImage),
                    fit: BoxFit.cover,
                    placeholderFit: BoxFit.cover,
                    // Display default image on error
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset("assets/images/defaultnewsimage.jpg", fit: BoxFit.cover);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: MFSizes.md,
              ),
              // Display the description of the article
              Text(
                article.description,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: MFSizes.md,
              ),
              // Display the content of the article with ellipsis if exceeds max lines
              Text(
                article.content,
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: MFSizes.md,
              ),
              SizedBox(
                width: size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    // Parse the article's URL
                    Uri url = Uri.parse(article.url);
                    if (!await launchUrl(url)) {
                      // Error handling for launching the URL
                      MFLoader.errorSnackBar(title: "Could not launch", message: "Something went wrong.");
                    }
                  },
                  child: Text(
                    "CONTINUE READING",
                    style: Theme.of(context).textTheme.titleMedium!.apply(letterSpacingFactor: 3),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
