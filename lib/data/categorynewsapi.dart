import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapi/screens/articledetails.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../model/newsmodel.dart';
import '../widgets/categorynewscontainer.dart';
import 'api.dart';

class CategoryNewsAPI extends StatelessWidget {
  const CategoryNewsAPI({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    final NewsService newsService = NewsService();
    return FutureBuilder<List<Article>>(
      future: newsService.fetchCategoryArticles(category),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Skeletonizer(
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
          return Skeletonizer(
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
          return const Center(child: Text('No articles found'));
        } else {
          final articles = snapshot.data!.where((article) => article.isValid()).toList();
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return CategoryNewsContianer(
                imagelink: article.urlToImage,
                category: category,
                author: article.author,
                title: article.title,
                description: article.description,
                func: () {
                  Get.to(
                    () => ArticleDetailsScreen(article: article),
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}
