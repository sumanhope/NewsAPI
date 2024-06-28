import 'package:get/get.dart';

class NewsController extends GetxController {
  static NewsController get instance => Get.find();

  final RxList allnews = [].obs;
}
