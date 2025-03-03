import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spookify_v2/presentation/routes/models/playlist_data_provider.dart';
import 'package:spookify_v2/presentation/components/custom_loading_image_indicator.dart';

class CustomAppBar extends StatelessWidget {
  final double maxHeight;
  final double minHeight;
  final TrackDataProvider extra;
  final Color bgColor;
  const CustomAppBar({
    super.key,
    required this.maxHeight,
    required this.minHeight,
    required this.extra,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    final extraTopPadding = MediaQuery.of(context).size.height * 0.05;
    final padding = EdgeInsets.only(
      top: MediaQuery.of(context).padding.top + extraTopPadding,
      right: 10,
      left: 10,
    );
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: minHeight,
        maxHeight: maxHeight,
        builder: (context, shrinkOffset) {
          final double shrinkToMaxAppBarHeightRatio = shrinkOffset / maxHeight;
          const double animateImageFromPoint = 0.4;
          final animateImage =
              shrinkToMaxAppBarHeightRatio >= animateImageFromPoint;
          final animateOpacityToZero = shrinkToMaxAppBarHeightRatio > 0.6;
          final imagePositionFromTop = animateImage
              ? (animateImageFromPoint - shrinkToMaxAppBarHeightRatio) *
                  maxHeight
              : null;
          final imageSize =
              MediaQuery.of(context).size.height * 0.3 - shrinkOffset / 2;
          final showFixedAppBar = shrinkToMaxAppBarHeightRatio > 0.7;
          final double titleOpacity =
              showFixedAppBar ? 1 - (maxHeight - shrinkOffset) / minHeight : 0;

          return Stack(
            alignment: Alignment.topCenter,
            children: [
              _buildSliverAppBar(
                context,
                imageUrl: extra.imageUrl!,
                albumPositionFromTop: imagePositionFromTop,
                padding: padding,
                animateOpacityToZero: animateOpacityToZero,
                animateAlbumImage: animateImage,
                shrinkToMaxAppBarHeightRatio: shrinkToMaxAppBarHeightRatio,
                imageSize: imageSize,
              ),
              _buildFixedAppBar(
                context: context,
                title: extra.title,
                titleOpacity: titleOpacity,
                showFixedAppBar: showFixedAppBar,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSliverAppBar(
    BuildContext context, {
    required String imageUrl,
    required double? albumPositionFromTop,
    required EdgeInsets padding,
    required bool animateOpacityToZero,
    required bool animateAlbumImage,
    required double shrinkToMaxAppBarHeightRatio,
    required double imageSize,
  }) {
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

  Widget _buildFixedAppBar({
    required BuildContext context,
    required double titleOpacity,
    required bool showFixedAppBar,
    required String title,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      decoration: BoxDecoration(
        gradient: showFixedAppBar
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  bgColor,
                  Colors.black,
                ],
              )
            : null,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 10,
          left: 10,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: AppBar().preferredSize.height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            textBaseline: TextBaseline.ideographic,
            children: [
              IconButton(
                onPressed: () {
                  if (Navigator.of(context).canPop()) {
                    GoRouter.of(context).pop<bool>(true);
                  }
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 20),
              AnimatedOpacity(
                opacity: titleOpacity.clamp(0, 1),
                duration: const Duration(milliseconds: 100),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.builder,
  });
  final double minHeight;
  final double maxHeight;

  final Widget Function(BuildContext context, double shrinkOffset) builder;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: builder(context, shrinkOffset));
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        builder != oldDelegate.builder;
  }
}
