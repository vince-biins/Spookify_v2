import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spookify_v2/core/theme/app_colors.dart';
import 'package:spookify_v2/features/dashboard/presentation/ui/dashboard/dashboard_page.dart';

class CustomAppBar extends StatelessWidget {
  final double maxHeight;
  final double minHeight;
  const CustomAppBar({
    super.key,
    required this.maxHeight,
    required this.minHeight,
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
                imageUrl:
                    'https://t.scdn.co/images/728ed47fc1674feb95f7ac20236eb6d7.jpeg',
                albumPositionFromTop: imagePositionFromTop,
                padding: padding,
                animateOpacityToZero: animateOpacityToZero,
                animateAlbumImage: animateImage,
                shrinkToMaxAppBarHeightRatio: shrinkToMaxAppBarHeightRatio,
                imageSize: imageSize,
              ),
              _buildFixedAppBar(
                context: context,
                title: 'Daily Mix',
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
                color: AppColors.error,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
                image: DecorationImage(
                  image: NetworkImage(
                    imageUrl,
                  ),
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
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.green,
                  Colors.black54,
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
                  context.pop();
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
