import 'package:flutter/material.dart';
import 'package:spookify_v2/src/presentation/components/custom_loading_image_indicator.dart';
import 'package:spookify_v2/src/presentation/components/image_network_error_handling.dart';

class CategoryTile extends StatelessWidget {
  final double width;
  final String imageSrc;
  final String title;
  final Function() onTap;
  const CategoryTile({
    super.key,
    required this.width,
    required this.imageSrc,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      onTap: onTap,
      child: Ink(
        width: width,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Ink(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: ImageNetworkErrorHandling(
                  imageSize: 60,
                  loadingIndicatorSize: 20,
                  imageUrl: imageSrc,
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
