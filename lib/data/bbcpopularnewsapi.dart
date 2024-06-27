import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newsapi/screens/articledetails.dart';
import 'package:newsapi/widgets/popularnewscontainer.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../model/newsmodel.dart';
import 'api.dart';

class BBCPopularNewsAPI extends StatelessWidget {
  const BBCPopularNewsAPI({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsService newsService = NewsService();
    return FutureBuilder<List<Article>>(
      future: newsService.fetchTopHeadlinesArticles(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Skeletonizer(
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
          return Skeletonizer(
            enabled: true,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return PopularNewsContainer(
                  imagelink: "",
                  category: "Popular",
                  author: "Loading",
                  title: "This is the loading title.",
                  description: "This is the loading description. This is the loading description. This is the loading description.",
                  func: () {},
                  time: DateFormat('MMMM d yyyy').format(DateTime.now()),
                );
              },
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No articles found'));
        } else {
          final articles = snapshot.data!.where((article) => article.isValid()).take(3).toList();
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return PopularNewsContainer(
                imagelink: article.urlToImage,
                category: "Popular",
                author: article.author,
                title: article.title,
                description: article.description,
                func: () {
                  Get.to(() => ArticleDetailsScreen(article: article));
                },
                time: DateFormat('MMMM d yyyy').format(article.publishedAt),
              );
            },
          );
        }
      },
    );
  }
}
