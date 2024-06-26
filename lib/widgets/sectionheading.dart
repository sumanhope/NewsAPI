import 'package:flutter/material.dart';
import 'package:newsapi/utils/constants/colors.dart';
import 'package:newsapi/utils/helper/helper_function.dart';

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
    final dark = MFHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.apply(fontWeightDelta: 2),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showButton)
          TextButton(
            onPressed: func,
            child: Text(
              buttontitle,
              style: Theme.of(context).textTheme.bodySmall!.apply(color: dark ? MFColors.darkGrey : Colors.blue),
            ),
          ),
      ],
    );
  }
}
