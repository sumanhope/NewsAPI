import 'package:get/get.dart';

class InitialScreenController extends GetxController {
  static InitialScreenController get instance => Get.find();
  RxInt index = 0.obs;

  void changeindex(int currentindex) {
    index.value = currentindex;
  }
}
