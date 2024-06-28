import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapi/screens/articledetails.dart';
import 'package:newsapi/utils/constants/colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../model/newsmodel.dart';
import '../widgets/categorynewscontainer.dart';
import 'api.dart';

// Widget to display Category News based on a given category
class CategoryNewsAPI extends StatelessWidget {
  const CategoryNewsAPI({super.key, required this.category});

  // The category for which news articles are to be fetched
  final String category;

  @override
  Widget build(BuildContext context) {
    // Instantiate NewsService to fetch news articles
    final NewsService newsService = NewsService();

    return FutureBuilder<List<Article>>(
      // Fetch category-specific articles asynchronously
      future: newsService.fetchCategoryArticles(category),
      builder: (context, snapshot) {
        // Display skeleton loading containers while waiting for data
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Skeletonizer(
            effect: const ShimmerEffect(
              baseColor: MFColors.darkerGrey,
            ),
            enabled: true,
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return CategoryNewsContianer(
                  imagelink: "",
                  category: category,
                  author: "Test Name",
                  title: "This is a Loading Title",
                  description: "This is a loading description. This is a loading description. This is a loading description.",
                  func: () {},
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          // Display skeleton loading containers in case of error
          return Skeletonizer(
            effect: const ShimmerEffect(
              baseColor: MFColors.darkerGrey,
            ),
            enabled: true,
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return CategoryNewsContianer(
                  imagelink: "",
                  category: category,
                  author: "Test Name",
                  title: "This is a Loading Title",
                  description: "This is a loading description. This is a loading description. This is a loading description.",
                  func: () {},
                );
              },
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          // Display message when no articles are found
          return const Center(child: Text('No articles found'));
        } else {
          // Display list of category-specific news articles
          final articles = snapshot.data!.where((article) => article.isValid()).toList(); // checking if any element of article is null then converting it to list
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              // custom widget to display article
              return CategoryNewsContianer(
                imagelink: article.urlToImage,
                category: category,
                author: article.author,
                title: article.title,
                description: article.description,
                // Navigate to article details screen on tap
                func: () {
                  Get.to(() => ArticleDetailsScreen(article: article));
                },
              );
            },
          );
        }
      },
    );
  }
}
