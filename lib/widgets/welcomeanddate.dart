import 'package:flutter/material.dart';
import '../../../../utils/helper/helper_function.dart';

//Widget to show Text and Date
class WelcomeAndDate extends StatelessWidget {
  const WelcomeAndDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // finding current date
    DateTime today = DateTime.now();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Explore News",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          MFHelperFunctions.getFormattedDate(today), // changing the formate of date
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
