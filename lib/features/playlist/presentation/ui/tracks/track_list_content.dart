import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spookify_v2/core/navigation/navigation.dart';
import 'package:spookify_v2/core/utils/utils.dart';
import 'package:spookify_v2/features/playlist/domain/model/model.dart';
import 'package:spookify_v2/features/playlist/presentation/bloc/track/track.dart';

import 'package:spookify_v2/features/playlist/presentation/widgets/widgets.dart';

class TrackListContent extends StatefulWidget {
  final List<Track> track;
  final TrackDataProvider extra;
  const TrackListContent({
    super.key,
    required this.track,
    required this.extra,
  });

  @override
  State<TrackListContent> createState() => _TrackListContentState();
}

class _TrackListContentState extends State<TrackListContent> {
  late ScrollController _scrollController;

  late double playPauseButtonSize;
  late double infoBoxHeight;

  late List<Track> track;
  late bool _shouldShowHeader;

  @override
  void initState() {
    super.initState();
    track = widget.track;
    _scrollController = ScrollController();
    _shouldShowHeader = track.first.type == TrackType.artist;
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
              extra: widget.extra,
            ),
            TrackInfoSection(
              infoBoxHeight: infoBoxHeight,
              extra: widget.extra,
            ),
            if (_shouldShowHeader)
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Text(
                    'Top Tracks',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SongItemTile(
                        track: track[index],
                        onFavoritClicked: () {
                          context.read<TrackBloc>().add(
                                TrackEvent.updateFavoriteTrack(
                                  track: track[index],
                                  isFavorite: !track[index].isFavorite,
                                ),
                              );
                        },
                        onClickTrack: () {
                          final extra = TrackDataProvider(
                            id: track[index].trackId,
                            imageUrl:
                                track[index].imageUrl ?? widget.extra.imageUrl,
                            artist:
                                track[index].artistName ?? widget.extra.artist,
                            title: track[index].trackName,
                            type: track[index].type,
                          );
                          GoRouter.of(context).push(
                            TrackDestination.player.pathUrl,
                            extra: extra,
                          );
                        }),
                  ),
                ),
                childCount: track.length,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: minAppBarHeight * 2,
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
