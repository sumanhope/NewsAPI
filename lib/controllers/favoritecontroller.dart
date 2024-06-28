import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newsapi/utils/popus/loader.dart';
import '../model/newsmodel.dart';

// Controller class to manage favorite articles using GetX and GetStorage
class FavoriteController extends GetxController {
  // Static method to get the instance of the FavoriteController
  static FavoriteController get instance => Get.find();

  // GetStorage instance to persist favorites locally
  final box = GetStorage();

  // Observable list to store favorite articles
  var favorites = <Article>[].obs;

  @override
  void onInit() {
    // Read stored favorites from GetStorage on initialization
    List? storedFavorites = box.read<List>('favorites');
    if (storedFavorites != null) {
      // Convert stored JSON data to Article objects and update the observable list
      favorites = storedFavorites.map((e) => Article.favJson(e)).toList().obs;
    }

    // Save changes to favorites whenever the favorites list is updated
    ever(favorites, (_) {
      box.write('favorites', favorites.map((e) => e.toJson()).toList());
    });

    super.onInit();
  }

  // Method to toggle whether an article is a favorite or not
  void toggleFavorite(Article article) {
    if (favorites.contains(article)) {
      // If article is already a favorite, remove it from the list
      favorites.remove(article);
      // Show warning snackbar indicating removal from favorites
      MFLoader.warningSnackBar(
        title: "Removed from Favorites",
        message: "This article has been removed from favorites.",
      );
    } else {
      // If article is not a favorite, add it to the list
      favorites.add(article);
      // Show success snackbar indicating addition to favorites
      MFLoader.successSnackBar(
        title: "Added to Favorites",
        message: "This article has been added to favorites.",
      );
    }
  }
}
