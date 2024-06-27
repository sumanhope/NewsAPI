// api key: 9a55a44db15745279416675490b1f513, d7f93ff8bf55409284b4782642bbd978

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapi/utils/popus/loader.dart';
import '../model/newsmodel.dart';

class NewsService {
  final String _apiKey = 'd7f93ff8bf55409284b4782642bbd978';
  final String _baseUrl = 'https://newsapi.org/v2';

  Future<List<Article>> fetchTopHeadlinesArticles() async {
    final response = await http.get(Uri.parse('$_baseUrl/top-headlines?sources=bbc-news&apiKey=$_apiKey'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> articlesJson = jsonData['articles'];
      return articlesJson.map((json) => Article.fromJson(json)).toList();
    } else if (response.statusCode == 429) {
      return MFLoader.errorSnackBar(
        title: "Too Many Request",
        message: "You made too many requests within a window of time and have been rate limited. Back off for a while.",
      );
    } else if (response.statusCode == 500) {
      return MFLoader.errorSnackBar(
        title: "Server Error",
        message: "Something went wrong on our server side.",
      );
    } else {
      throw Exception('Failed to load articles');
    }
  }

  Future<List<Article>> fetchCategoryArticles(String category) async {
    final response = await http.get(Uri.parse('$_baseUrl/top-headlines?country=us&category=$category&apiKey=$_apiKey'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      if (jsonData.containsKey('articles') && jsonData['articles'] != null) {
        final List<dynamic> articlesJson = jsonData['articles'];
        return articlesJson.map((json) => Article.fromJson(json)).toList();
      } else {
        throw Exception('No articles found');
      }
    } else if (response.statusCode == 429) {
      return MFLoader.errorSnackBar(
        title: "Too Many Request",
        message: "You made too many requests within a window of time and have been rate limited. Back off for a while.",
      );
    } else if (response.statusCode == 500) {
      return MFLoader.errorSnackBar(
        title: "Server Error",
        message: "Something went wrong on our server side.",
      );
    } else {
      throw Exception('Failed to load articles: ${response.body}');
    }
  }
}
