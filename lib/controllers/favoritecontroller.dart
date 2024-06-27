import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newsapi/utils/popus/loader.dart';
import '../model/newsmodel.dart';

class FavoriteController extends GetxController {
  static FavoriteController get instance => Get.find();
  final box = GetStorage();
  var favorites = <Article>[].obs;
  @override
  void onInit() {
    List? storedFavorites = box.read<List>('favorites');
    if (storedFavorites != null) {
      favorites = storedFavorites.map((e) => Article.favJson(e)).toList().obs;
    }
    ever(favorites, (_) {
      box.write('favorites', favorites.map((e) => e.toJson()).toList());
    });
    super.onInit();
  }

  void toggleFavorite(Article article) {
    if (favorites.contains(article)) {
      favorites.remove(article);
      MFLoader.errorSnackBar(
        title: "Removed from Favorites",
        message: "This article has been removed from favorites.",
      );
    } else {
      favorites.add(article);
      MFLoader.sucessSnackBar(
        title: "Added to Favorites",
        message: "This article has been added to favorites.",
      );
    }
  }
}
