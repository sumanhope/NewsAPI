import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapi/utils/popus/loader.dart';
import '../model/newsmodel.dart';

// Service class to fetch news articles from NewsAPI
class NewsService {
  // api keys: 9a55a44db15745279416675490b1f513, d7f93ff8bf55409284b4782642bbd978
  final String apiKey = 'd7f93ff8bf55409284b4782642bbd978';

  // Base URL of NewsAPI
  final String newsapibaseUrl = 'https://newsapi.org/v2';

  // Method to fetch top headlines articles from NewsAPI
  Future<List<Article>> fetchTopHeadlinesArticles() async {
    try {
      // Parsing the URL for fetching top headlines from a specific source (BBC News)
      Uri parsedUrl = Uri.parse('$newsapibaseUrl/top-headlines?sources=bbc-news&apiKey=$apiKey');

      // Making a GET request to the NewsAPI
      final response = await http.get(parsedUrl);

      // Handling different HTTP response status codes
      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON response
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final List<dynamic> articlesJson = jsonData['articles'];
        // Convert the JSON data to a list of Article objects
        return articlesJson.map((json) => Article.fromJson(json)).toList();
      } else {
        // finding error message
        String errorMessage = _handleHttpError(response.statusCode);
        MFLoader.errorSnackBar(
          title: "HTTP Error ${response.statusCode}",
          message: errorMessage,
        );
        return [];
      }
    } //Error Handling
    on http.ClientException catch (e) {
      MFLoader.errorSnackBar(
        title: "Network Error",
        message: "A network error occurred: ${e.message}",
      );
      return [];
    } on FormatException {
      MFLoader.errorSnackBar(
        title: "Data Error",
        message: "Invalid data format received.",
      );
      return [];
    } catch (e) {
      MFLoader.errorSnackBar(
        title: "Unexpected Error",
        message: "An unexpected error occurred: ${e.toString()}",
      );
      return [];
    }
  }

  // Method to fetch category-specific articles from NewsAPI
  Future<List<Article>> fetchCategoryArticles(String category) async {
    try {
      // Parsing the URL for fetching top headlines from a specific category (e.g., business, health)
      Uri parsedUrl = Uri.parse('$newsapibaseUrl/top-headlines?country=us&category=$category&apiKey=$apiKey');

      // Making a GET request to the NewsAPI
      final response = await http.get(parsedUrl);

      // Handling different HTTP response status codes
      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON response
        final Map<String, dynamic> jsonData = json.decode(response.body);
        if (jsonData.containsKey('articles') && jsonData['articles'] != null) {
          final List<dynamic> articlesJson = jsonData['articles'];
          // Convert the JSON data to a list of Article objects
          return articlesJson.map((json) => Article.fromJson(json)).toList();
        } else {
          // If no articles found in the response, throw an exception
          throw Exception('No articles found');
        }
      } else {
        // finding error message
        String errorMessage = _handleHttpError(response.statusCode);
        MFLoader.errorSnackBar(
          title: "HTTP Error ${response.statusCode}",
          message: errorMessage,
        );
        return [];
      }
    } on http.ClientException catch (e) {
      //Error Handling
      MFLoader.errorSnackBar(
        title: "Network Error",
        message: "A network error occurred: ${e.message}",
      );
      return [];
    } on FormatException {
      MFLoader.errorSnackBar(
        title: "Data Error",
        message: "Invalid data format received.",
      );
      return [];
    } catch (e) {
      MFLoader.errorSnackBar(
        title: "Unexpected Error",
        message: "An unexpected error occurred: ${e.toString()}",
      );
      return [];
    }
  }

  // Http Errors
  String _handleHttpError(int statusCode) {
    switch (statusCode) {
      case 400:
        return "Bad Request. The server could not understand the request.";
      case 401:
        return "Unauthorized. Access is denied due to invalid credentials.";
      case 403:
        return "Forbidden. You don't have permission to access this resource.";
      case 404:
        return "Not Found. The requested resource could not be found.";
      case 500:
        return "Internal Server Error. Something went wrong on the server.";
      case 503:
        return "Service Unavailable. The server is currently unavailable.";
      default:
        return "An unexpected error occurred. Please try again later.";
    }
  }
}
