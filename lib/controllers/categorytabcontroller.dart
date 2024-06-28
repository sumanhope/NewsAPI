import 'package:get/get.dart';

// Controller class to manage the selected tab index using GetX
class CategoryTabController extends GetxController {
  // Observable integer to track the selected tab index
  var selectedIndex = 0.obs;

  // Method to change the selected tab index
  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}
