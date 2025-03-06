import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spookify_v2/src/domain/models/models.dart';
import 'package:spookify_v2/src/application/paramaters/track_param.dart';
import 'package:spookify_v2/src/application/paramaters/track_id_provider.dart';
import 'package:spookify_v2/src/presentation/playlist/ui/tracks/components/search_app_bar.dart';
import 'package:spookify_v2/utils/constants/playlist_strings.dart';
import 'package:spookify_v2/src/application/state/bloc/playlist/track/track.dart';

import 'package:spookify_v2/src/presentation/playlist/widgets/widgets.dart';

class TrackListContent extends StatelessWidget {
  final Color bgColor;
  final List<Track> track;
  final TrackParam extra;
  final bool showDefaultAppbar;
  final bool isDownloaded;
  final ScrollController _scrollController = ScrollController();
  TrackListContent({
    super.key,
    required this.track,
    required this.extra,
    required this.showDefaultAppbar,
    required this.bgColor,
    required this.isDownloaded,
  });

  @override
  Widget build(BuildContext context) {
    double maxAppBarHeight = MediaQuery.of(context).size.height * 0.5;
    double minAppBarHeight = MediaQuery.of(context).padding.top +
        MediaQuery.of(context).size.height * 0.1;

    double playPauseButtonSize =
        (MediaQuery.of(context).size.width / 320) * 50 > 80
            ? 80
            : (MediaQuery.of(context).size.width / 320) * 50;
    double infoBoxHeight = 150;

    return Stack(
      children: [
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            showDefaultAppbar
                ? CustomContainerAppBar(
                    maxHeight: maxAppBarHeight,
                    minHeight: minAppBarHeight,
                    extra: extra,
                    bgColor: bgColor,
                  )
                : const SearchAppBar(
                    maxAppBarHeight: 200,
                  ),
            TrackInfoSection(
              infoBoxHeight: infoBoxHeight,
              extra: extra,
              isDownloaded: isDownloaded,
              onClickDownloadTrack: () {
                context.read<TrackBloc>().add(
                      TrackEvent.saveAllTracks(
                        saveCategory: Category(
                          id: extra.id ?? '',
                          name: extra.title,
                          imageUrl: extra.imageUrl,
                          artistName: extra.artist,
                          type: extra.type,
                        ),
                        tracks: track,
                      ),
                    );
              },
            ),
            if (!showDefaultAppbar)
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
                                tempImageUrl: extra.imageUrl ?? '',
                              ),
                            );
                      },
                      onClickTrack: () async {
                        final extra = TrackIdProvider(
                          currId: track[index].trackId,
                          trackIds: track.map((item) => item.trackId).toList(),
                        );

                        context
                            .read<TrackBloc>()
                            .add(TrackEvent.navigateToPlayerPage(extra));
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
          maxAppBarHeight:
              showDefaultAppbar ? maxAppBarHeight - 20 : maxAppBarHeight * 0.4,
          minAppBarHeight: minAppBarHeight,
          playPauseButtonSize: playPauseButtonSize,
          infoBoxHeight: showDefaultAppbar ? infoBoxHeight : infoBoxHeight + 50,
        ),
      ],
    );
  }
}
