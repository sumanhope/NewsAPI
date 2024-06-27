import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:newsapi/controllers/favoritecontroller.dart';
import 'package:newsapi/utils/constants/sizes.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/newsmodel.dart';
import '../utils/constants/colors.dart';
import '../utils/helper/helper_function.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({super.key, required this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    final dark = MFHelperFunctions.isDarkMode(context);
    final size = MediaQuery.of(context).size;
    final favcontroller = Get.put(FavoriteController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark ? Colors.black : MFColors.primary,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(PixelArtIcons.arrow_left),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Article Details",
          style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),
        ),
        actions: [
          Obx(
            () => IconButton(
              onPressed: () {
                favcontroller.toggleFavorite(article);
              },
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
                  Text(
                    DateFormat('MMMM d yyyy').format(article.publishedAt),
                  ),
                ],
              ),
              const SizedBox(
                height: MFSizes.md,
              ),
              Container(
                height: size.height * 0.3,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(article.urlToImage),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: MFSizes.md,
              ),
              Text(
                article.description,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: MFSizes.md,
              ),
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
                    Uri url = Uri.parse(article.url);
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
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
