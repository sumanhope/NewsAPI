import 'package:flutter/material.dart';
import '../utils/constants/colors.dart';
import '../utils/helper/helper_function.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MFHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark ? Colors.black : MFColors.primary,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Favorites",
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
