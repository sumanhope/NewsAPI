import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';
import '../utils/helper/helper_function.dart';

// Widget to display a container for Popular news items
class PopularNewsContainer extends StatelessWidget {
  const PopularNewsContainer({
    super.key,
    required this.imagelink,
    required this.category,
    required this.author,
    required this.title,
    required this.description,
    required this.time,
    required this.func,
  });

  final String imagelink, category, author, title, description, time;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    //Current theme mode
    final dark = MFHelperFunctions.isDarkMode(context);
    // Get screen size
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: func, // Function to be executed on tap
        child: SizedBox(
          width: size.width * 0.85,
          child: Stack(
            children: [
              //Image container
              Container(
                width: size.width,
                height: size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                // Display default image when the news image is loading
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  // default image fade away when the news image is completely loaded
                  child: FadeInImage(
                    fadeOutDuration: const Duration(milliseconds: 500),
                    fadeInDuration: const Duration(milliseconds: 100),
                    placeholder: const AssetImage("assets/images/defaultnewsimage.jpg"),
                    // Display the article's image or default image if empty
                    image: imagelink.isEmpty ? const AssetImage("assets/images/defaultnewsimage.jpg") as ImageProvider : NetworkImage(imagelink),
                    fit: BoxFit.cover,
                    placeholderFit: BoxFit.cover,
                    // Display default image on error
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset("assets/images/defaultnewsimage.jpg", fit: BoxFit.cover);
                    },
                  ),
                ),
              ),
              //Text Content
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: size.height * 0.22,
                  padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                  decoration: BoxDecoration(
                    color: dark ? MFColors.darkContainer : const Color(0xFFDBD3E0),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Category text
                          Text(
                            category,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            width: MFSizes.sm,
                          ),
                          // Author text
                          Text(
                            author,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: MFSizes.sm,
                      ),
                      // Title text
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: MFSizes.sm,
                      ),
                      // Description text
                      Text(
                        description,
                        maxLines: 3,
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: MFSizes.xs,
                      ),
                      // Published date
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            LineAwesome.clock,
                          ),
                          const SizedBox(
                            width: MFSizes.xs,
                          ),
                          Text(
                            time,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: MFSizes.xs,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
