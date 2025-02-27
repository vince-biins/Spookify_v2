import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spookify_v2/core/core.dart';
import 'package:spookify_v2/features/dashboard/domain/model/save_category.dart';
import 'package:spookify_v2/features/dashboard/presentation/widgets/library_tile.dart';

class LibraryContent extends StatelessWidget {
  final List<SaveCategory> categories;
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
              final extra = TrackDataProvider(
                id: null,
                imageUrl: null,
                artist: null,
                title: 'Liked songs',
                type: TrackType.favorite,
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
                onClickTile: (id) {
                  final extra = TrackDataProvider(
                    id: id,
                    imageUrl: category.imageUrl,
                    artist: category.artistName,
                    title: category.title,
                    type: category.type,
                  );
                  GoRouter.of(context).push(
                    TrackDestination.track.pathUrl,
                    extra: extra,
                  );
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
