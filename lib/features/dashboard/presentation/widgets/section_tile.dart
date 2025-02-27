import 'package:flutter/material.dart';
import 'package:spookify_v2/core/widgets/custom_loading_image_indicator.dart';

class SectionTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  final bool isRoundedImage;
  final Function() onItemClicked;
  final double imageSize;

  const SectionTile({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.onItemClicked,
    required this.isRoundedImage,
    this.imageSize = 150.0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onItemClicked,
      customBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Ink(
        width: 150,
        height: 230,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Ink(
              height: imageSize,
              width: imageSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(isRoundedImage ? 80 : 16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(isRoundedImage ? 80 : 16),
                child: Image.network(
                  imageUrl,
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit.cover,
                  loadingBuilder: (
                    BuildContext context,
                    Widget child,
                    ImageChunkEvent? loadingProgress,
                  ) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const Center(
                      child: CustomLoadingImageIndicator(
                        size: 50,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/error.png',
                      width: imageSize,
                      height: imageSize,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelSmall,
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
