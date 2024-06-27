import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';
import '../utils/helper/helper_function.dart';

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

  final String imagelink, category, author, title, description;
  final String time;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    final dark = MFHelperFunctions.isDarkMode(context);
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: func,
        child: SizedBox(
          width: size.width * 0.85,
          child: Stack(
            children: [
              Container(
                height: size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: imagelink == ""
                      ? const DecorationImage(
                          image: AssetImage("assets/images/defaultnewsimage.jpg"),
                          fit: BoxFit.cover,
                        )
                      : DecorationImage(
                          image: NetworkImage(imagelink),
                          fit: BoxFit.fill,
                        ),
                ),
              ),
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
                          Text(
                            category,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            width: MFSizes.sm,
                          ),
                          Text(
                            author,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: MFSizes.sm,
                      ),
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: MFSizes.sm,
                      ),
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
