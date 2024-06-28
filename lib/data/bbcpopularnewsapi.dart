import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newsapi/screens/articledetails.dart';
import 'package:newsapi/widgets/popularnewscontainer.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../model/newsmodel.dart';
import '../utils/constants/colors.dart';
import '../utils/helper/helper_function.dart';
import 'api.dart';

// Widget to display popular news articles from BBC News
class BBCPopularNewsAPI extends StatelessWidget {
  const BBCPopularNewsAPI({super.key});

  @override
  Widget build(BuildContext context) {
    // Creating a instance of NewsService to fetch news articles
    final NewsService newsService = NewsService();

    return FutureBuilder<List<Article>>(
      // Fetch top headlines articles asynchronously
      future: newsService.fetchTopHeadlinesArticles(),
      builder: (context, snapshot) {
        // Display skeleton loading container while waiting for data
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Skeletonizer(
            effect: const ShimmerEffect(
              baseColor: MFColors.darkerGrey,
            ),
            enabled: true,
            child: PopularNewsContainer(
              imagelink: "",
              category: "Popular",
              author: "Loading",
              title: "This is the loading title.",
              description: "This is the loading description. This is the loading description. This is the loading description.",
              func: () {},
              time: DateFormat('MMMM d yyyy').format(DateTime.now()),
            ),
          );
        } else if (snapshot.hasError) {
          // Display skeleton loading containers in case of error
          return Skeletonizer(
            enabled: true,
            effect: const ShimmerEffect(
              baseColor: MFColors.darkerGrey,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return PopularNewsContainer(
                  imagelink: "",
                  category: "Popular",
                  author: "Loading",
                  title: "This is test title",
                  description: "This is the loading description. This is the loading description. This is the loading description.",
                  func: () {},
                  time: DateFormat('MMMM d yyyy').format(DateTime.now()),
                );
              },
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          // Display skeleton when no articles are found
          return Skeletonizer(
            enabled: true,
            effect: const ShimmerEffect(
              baseColor: MFColors.darkerGrey,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return PopularNewsContainer(
                  imagelink: "",
                  category: "Popular",
                  author: "Loading",
                  title: "This is test title",
                  description: "This is the loading description. This is the loading description. This is the loading description.",
                  func: () {},
                  time: DateFormat('MMMM d yyyy').format(DateTime.now()),
                );
              },
            ),
          );
        } else {
          // Display list of popular news articles
          final articles = snapshot.data!.where((article) => article.isValid()).take(3).toList(); // only taking 3 article
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return PopularNewsContainer(
                // custom widget to display article
                imagelink: article.urlToImage,
                category: "Popular",
                author: article.author,
                title: article.title,
                description: article.description,

                time: MFHelperFunctions.getFormattedDate(article.publishedAt),
                func: () {
                  // Navigate to article details screen on tap
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
