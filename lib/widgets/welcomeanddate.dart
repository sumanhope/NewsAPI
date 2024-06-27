import 'package:flutter/material.dart';
import '../../../../utils/helper/helper_function.dart';

class WelcomeAndDate extends StatelessWidget {
  const WelcomeAndDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    //final userController = Get.put(UserController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Welcome, Guest",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          MFHelperFunctions.getFormattedDate(today),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
