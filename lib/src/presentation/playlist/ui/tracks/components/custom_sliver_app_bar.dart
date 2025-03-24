import 'package:flutter/material.dart';
import 'package:spookify_v2/src/presentation/components/custom_loading_image_indicator.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String imageUrl;
  final double? albumPositionFromTop;
  final EdgeInsets padding;
  final bool animateOpacityToZero;
  final bool animateAlbumImage;
  final double shrinkToMaxAppBarHeightRatio;
  final double imageSize;
  const CustomSliverAppBar({
    super.key,
    required this.imageUrl,
    this.albumPositionFromTop,
    required this.padding,
    required this.animateOpacityToZero,
    required this.animateAlbumImage,
    required this.shrinkToMaxAppBarHeightRatio,
    required this.imageSize,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: albumPositionFromTop,
      child: Center(
        child: Padding(
          padding: padding,
          child: AnimatedOpacity(
            opacity: animateOpacityToZero
                ? 0
                : animateAlbumImage
                    ? 1 - shrinkToMaxAppBarHeightRatio
                    : 1,
            duration: const Duration(milliseconds: 100),
            child: Container(
              padding: padding,
              height: imageSize,
              width: imageSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
                image: DecorationImage(
                  image: Image.network(
                    imageUrl,
                    loadingBuilder: (
                      BuildContext context,
                      Widget child,
                      ImageChunkEvent? loadingProgress,
                    ) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CustomLoadingImageIndicator(),
                      );
                    },
                    errorBuilder: (
                      BuildContext context,
                      Object exception,
                      StackTrace? stackTrace,
                    ) {
                      return Image.asset(
                        'assets/images/error.png',
                        fit: BoxFit.cover,
                      );
                    },
                  ).image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
