import 'package:get/get.dart';

// Controller class to manage categories using GetX
class CategoryController extends GetxController {
  // Static method to get the instance of the CategoryController
  static CategoryController get instance => Get.find();

  // List of all category tabs, wrapped in an observable for reactivity
  final RxList allCategories = [
    "General",
    "Sports",
    "Business",
    "Health",
    "Technology",
  ].obs;
}
