import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:spookify_v2/core/widgets/custom_loading_image_indicator.dart';

class CategorySearchTile extends StatelessWidget {
  final Color color;
  final String imageUrl;
  final String title;
  const CategorySearchTile({
    super.key,
    required this.color,
    required this.imageUrl,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4.0),
      ),
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            right: -20,
            bottom: 0,
            child: Transform.rotate(
              angle: 15 * math.pi / 180,
              child: Image.network(
                imageUrl,
                height: 70,
                width: 70,
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
                    child: CustomLoadingImageIndicator(),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/error.png',
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
