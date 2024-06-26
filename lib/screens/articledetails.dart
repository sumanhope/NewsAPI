import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../utils/constants/colors.dart';
import '../utils/helper/helper_function.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MFHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark ? Colors.black : MFColors.primary,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(PixelArtIcons.arrow_left),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Article Details",
          style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(),
        ],
      ),
    );
  }
}
