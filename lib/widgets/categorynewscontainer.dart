import 'package:flutter/material.dart';
import '../utils/constants/sizes.dart';

class CategoryNewsContianer extends StatelessWidget {
  const CategoryNewsContianer({
    super.key,
    required this.imagelink,
    required this.category,
    required this.author,
    required this.title,
    required this.description,
    required this.func,
  });

  final String imagelink, category, author, title, description;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: func,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width * 0.3,
              height: size.height * 0.135,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FadeInImage(
                  fadeOutDuration: const Duration(milliseconds: 500),
                  fadeInDuration: const Duration(milliseconds: 100),
                  placeholder: const AssetImage("assets/images/defaultnewsimage.jpg"),
                  image: imagelink.isEmpty ? const AssetImage("assets/images/defaultnewsimage.jpg") as ImageProvider : NetworkImage(imagelink),
                  fit: BoxFit.cover,
                  placeholderFit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset("assets/images/defaultnewsimage.jpg", fit: BoxFit.cover);
                  },
                ),
              ),
            ),
            const SizedBox(
              width: MFSizes.md,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * 0.58,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        category,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(
                        width: size.width * 0.34,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            author,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: MFSizes.sm,
                ),
                SizedBox(
                  width: size.width * 0.58,
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(
                  height: MFSizes.sm,
                ),
                SizedBox(
                  width: size.width * 0.58,
                  child: Text(
                    description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
