import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spookify_v2/core/navigation/navigation.dart';
import 'package:spookify_v2/core/navigation/providers/playlist/track_id_provider.dart';
import 'package:spookify_v2/features/playlist/assets/playlist_strings.dart';
import 'package:spookify_v2/features/playlist/domain/model/model.dart';
import 'package:spookify_v2/features/playlist/domain/model/save_category_dto.dart';
import 'package:spookify_v2/features/playlist/presentation/bloc/track/track.dart';

import 'package:spookify_v2/features/playlist/presentation/widgets/widgets.dart';

class TrackListContent extends StatefulWidget {
  final Color bgColor;
  final List<Track> track;
  final TrackDataProvider extra;
  final bool showDefaultAppbar;
  final bool isDownloaded;
  const TrackListContent({
    super.key,
    required this.track,
    required this.extra,
    required this.showDefaultAppbar,
    required this.bgColor,
    required this.isDownloaded,
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
    _shouldShowHeader = !widget.showDefaultAppbar;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _refreshPage() {
    context.read<TrackBloc>().add(const TrackEvent.loadTrack());
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
    infoBoxHeight = 150;

    return Stack(
      children: [
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            widget.showDefaultAppbar
                ? CustomAppBar(
                    maxHeight: maxAppBarHeight,
                    minHeight: minAppBarHeight,
                    extra: widget.extra,
                    bgColor: widget.bgColor,
                  )
                : _buildLibraryAppbar(
                    minAppBarHeight: 90,
                    maxAppBarHeight: 200,
                  ),
            TrackInfoSection(
              infoBoxHeight: infoBoxHeight,
              extra: widget.extra,
              isDownloaded: widget.isDownloaded,
              onClickDownloadTrack: () {
                context.read<TrackBloc>().add(
                      TrackEvent.saveAllTracks(
                        saveCategory: SaveCategoryDto(
                          id: widget.extra.id ?? '',
                          title: widget.extra.title,
                          imageUrl: widget.extra.imageUrl,
                          artistName: widget.extra.artist,
                          type: widget.extra.type,
                        ),
                        tracks: track,
                      ),
                    );
              },
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
                    PlaylistStrings.playingFromPlaylist,
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
                                tempImageUrl: widget.extra.imageUrl ?? '',
                              ),
                            );
                      },
                      onClickTrack: () async {
                        final extra = TrackIdProvider(
                          currId: track[index].trackId,
                          trackIds: track.map((item) => item.trackId).toList(),
                        );

                        final result = await GoRouter.of(context).push(
                          TrackDestination.player.pathUrl,
                          extra: extra,
                        );

                        if (result == true) {
                          _refreshPage();
                        }
                      },
                    ),
                  ),
                ),
                childCount: track.length,
              ),
            ),
            SliverFillRemaining(
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ],
        ),
        StickyPlayButton(
          scrollController: _scrollController,
          maxAppBarHeight: widget.showDefaultAppbar
              ? maxAppBarHeight - 20
              : maxAppBarHeight * 0.4,
          minAppBarHeight: minAppBarHeight,
          playPauseButtonSize: playPauseButtonSize,
          infoBoxHeight:
              widget.showDefaultAppbar ? infoBoxHeight : infoBoxHeight + 50,
        ),
      ],
    );
  }

  Widget _buildLibraryAppbar({
    required double maxAppBarHeight,
    required double minAppBarHeight,
  }) {
    return SliverAppBar(
      foregroundColor: Colors.white,
      backgroundColor: Colors.transparent,
      elevation: 0,
      expandedHeight: maxAppBarHeight,
      pinned: true,
      snap: false,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          bool expandedAppbar = constraints.biggest.height > 150;
          return Container(
            decoration: BoxDecoration(
              gradient: !expandedAppbar
                  ? LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.green,
                        Theme.of(context).scaffoldBackgroundColor,
                      ],
                    )
                  : null,
            ),
            child: FlexibleSpaceBarSettings(
              hasLeading: false,
              isScrolledUnder: false,
              toolbarOpacity: 1,
              minExtent: 0,
              maxExtent: 100,
              currentExtent: 0,
              child: FlexibleSpaceBar(
                title: expandedAppbar
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            cursorColor: Colors.white,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              prefixIconColor: Colors.white,
                              hintText: PlaylistStrings.search,
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              filled: true,
                              fillColor: Colors.white24,
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            onSubmitted: (value) {},
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 40.0, left: 50.0),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: !expandedAppbar ? 1.0 : 0.0,
                          child: const Text(
                            PlaylistStrings.search,
                          ),
                        ),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
