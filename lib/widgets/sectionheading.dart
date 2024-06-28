import 'package:flutter/material.dart';
import 'package:newsapi/utils/constants/colors.dart';
import 'package:newsapi/utils/helper/helper_function.dart';

// widget to display section heading
class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.title,
    this.buttontitle = "View all",
    this.showButton = true,
    this.func,
  });

  final String title, buttontitle;

  final bool showButton;
  final void Function()? func;

  @override
  Widget build(BuildContext context) {
    // Current theme mode
    final dark = MFHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Title
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.apply(fontWeightDelta: 2),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        // Shows button is the show Button is true
        if (showButton)
          TextButton(
            onPressed: func, // function that execute when the button is clicked
            child: Text(
              buttontitle,
              style: Theme.of(context).textTheme.bodySmall!.apply(color: dark ? MFColors.darkGrey : Colors.blue),
            ),
          ),
      ],
    );
  }
}
