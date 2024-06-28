import 'package:get/get.dart';

// Controller class to manage the index of landing screen using GetX
class LandingScreenController extends GetxController {
  // Static method to get the instance of the Landing Screen Controller
  static LandingScreenController get instance => Get.find();

  // Observable integer to track the index
  RxInt index = 0.obs;

  // Method to change the change the index
  void changeindex(int currentindex) {
    index.value = currentindex;
  }
}
