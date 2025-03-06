import 'package:flutter/material.dart';
import 'package:spookify_v2/src/presentation/components/custom_loading_image_indicator.dart';

class ImageNetworkErrorHandling extends StatelessWidget {
  final double imageSize;
  final double loadingIndicatorSize;
  final String imageUrl;
  String errorImageUrl;

  ImageNetworkErrorHandling({
    super.key,
    required this.imageSize,
    required this.loadingIndicatorSize,
    required this.imageUrl,
    this.errorImageUrl = 'assets/images/error.png',
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
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
        return Center(
          child: CustomLoadingImageIndicator(
            size: loadingIndicatorSize,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          errorImageUrl,
          width: imageSize,
          height: imageSize,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
