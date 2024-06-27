import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final RxList allCategories = [
    "General",
    "Sports",
    "Business",
    "Health",
    "Technology",
  ].obs;
}
