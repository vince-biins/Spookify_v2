import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spookify_v2/src/application/paramaters/track_param.dart';

import 'package:spookify_v2/src/domain/resources/track_type.dart';
import 'package:spookify_v2/src/domain/models/downloads.dart';
import 'package:spookify_v2/src/presentation/dashboard/components/library_tile.dart';
import 'package:spookify_v2/utils/constants/destinations.dart';
import 'package:spookify_v2/utils/helper/dominant_color_helper.dart';

class LibraryContent extends StatelessWidget {
  final List<Downloads> categories;
  const LibraryContent({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: LibraryTile(
            type: TrackType.favorite,
            icon: Icons.favorite,
            title: 'Favorites',
            description: 'Saved playlists',
            onClickTile: (_) {
              final extra = TrackParam(
                id: null,
                imageUrl: null,
                artist: null,
                title: 'Liked songs',
                type: TrackType.favorite,
                color: null,
              );
              GoRouter.of(context).push(
                TrackDestination.track.pathUrl,
                extra: extra,
              );
            },
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final category = categories[index];
              return LibraryTile(
                id: category.trackId,
                type: category.type,
                title: category.title,
                description: category.type.name,
                imageUrl: category.imageUrl,
                onClickTile: (id) async {
                  Color dominantColor =
                      await DominantColorHelper.getDominantColor(
                    category.imageUrl ?? '',
                  );

                  final extra = TrackParam(
                    id: id,
                    imageUrl: category.imageUrl,
                    artist: category.artistName,
                    title: category.title,
                    type: category.type,
                    color: dominantColor,
                  );

                  if (context.mounted) {
                    GoRouter.of(context).push(
                      TrackDestination.track.pathUrl,
                      extra: extra,
                    );
                  }
                },
              );
            },
            childCount: categories.length,
          ),
        ),
      ],
    );
  }
}
