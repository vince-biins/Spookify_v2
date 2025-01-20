import 'package:flutter/material.dart';
import 'package:spookify_v2/features/playlist/presentation/widgets/custom_app_bar.dart';
import 'package:spookify_v2/features/playlist/presentation/widgets/song_item_tile.dart';
import 'package:spookify_v2/features/playlist/presentation/widgets/sticky_play_button.dart';
import 'package:spookify_v2/features/playlist/presentation/widgets/track_info_section.dart';

class TrackListContent extends StatefulWidget {
  const TrackListContent({super.key});

  @override
  State<TrackListContent> createState() => _TrackListContentState();
}

class _TrackListContentState extends State<TrackListContent> {
  late ScrollController _scrollController;

  late double playPauseButtonSize;
  late double infoBoxHeight;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  late double maxAppBarHeight;
  late double minAppBarHeight;
  @override
  Widget build(BuildContext context) {
    maxAppBarHeight = MediaQuery.of(context).size.height * 0.5;
    minAppBarHeight = MediaQuery.of(context).padding.top +
        MediaQuery.of(context).size.height * 0.1;

    playPauseButtonSize = (MediaQuery.of(context).size.width / 320) * 50 > 80
        ? 80
        : (MediaQuery.of(context).size.width / 320) * 50;
    infoBoxHeight = 180;

    return Stack(
      children: [
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            CustomAppBar(
              maxHeight: maxAppBarHeight,
              minHeight: minAppBarHeight,
            ),
            TrackInfoSection(infoBoxHeight: infoBoxHeight),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: SongItemTile(
                    title: 'Item #$index',
                    artist: 'Dionela',
                  ),
                ),
                childCount: 50,
              ),
            ),
          ],
        ),
        StickyPlayButton(
          scrollController: _scrollController,
          maxAppBarHeight: maxAppBarHeight,
          minAppBarHeight: minAppBarHeight,
          playPauseButtonSize: playPauseButtonSize,
          infoBoxHeight: infoBoxHeight,
        ),
      ],
    );
  }
}
