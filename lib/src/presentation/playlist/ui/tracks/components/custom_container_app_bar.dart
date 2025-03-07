import 'package:flutter/material.dart';
import 'package:spookify_v2/src/application/paramaters/track_param.dart';
import 'package:spookify_v2/src/presentation/playlist/ui/tracks/components/custom_sliver_app_bar.dart';
import 'package:spookify_v2/src/presentation/playlist/ui/tracks/components/custom_sliver_app_bar_delegate.dart';
import 'package:spookify_v2/src/presentation/playlist/ui/tracks/components/fixed_app_bar.dart';

class CustomContainerAppBar extends StatelessWidget {
  final double maxHeight;
  final double minHeight;
  final TrackParam extra;
  final Color bgColor;
  const CustomContainerAppBar({
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
      delegate: SliverAppBarDelegate(
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
              CustomSliverAppBar(
                imageUrl: extra.imageUrl!.imageUrl,
                albumPositionFromTop: imagePositionFromTop,
                padding: padding,
                animateOpacityToZero: animateOpacityToZero,
                animateAlbumImage: animateImage,
                shrinkToMaxAppBarHeightRatio: shrinkToMaxAppBarHeightRatio,
                imageSize: imageSize,
              ),
              FixedAppBar(
                title: extra.title,
                titleOpacity: titleOpacity,
                showFixedAppBar: showFixedAppBar,
                bgColor: bgColor,
              ),
            ],
          );
        },
      ),
    );
  }
}
