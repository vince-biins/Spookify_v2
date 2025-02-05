import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spookify_v2/core/core.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          _buildCard(
            context: context,
            cardTitle: 'Favorites',
            cardSubtitle: 'Saved playlists',
            icon: Icons.favorite,
            image: _buildImage(),
            action: () {
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
        ],
      ),
    );
  }

  Widget _buildCard({
    required BuildContext context,
    required String cardTitle,
    required String cardSubtitle,
    IconData? icon,
    required Widget image,
    required VoidCallback action,
  }) {
    return InkWell(
      onTap: action,
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            image,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardTitle,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (icon != null) ...[
                        Icon(
                          icon,
                          size: 18,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(
                          width: 4.0,
                        ),
                      ],
                      Text(
                        cardSubtitle,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage({double imageSize = 70}) {
    return Container(
      width: imageSize,
      height: imageSize,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue,
            Colors.green,
          ],
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.favorite,
          size: 36,
        ),
      ),
    );
  }
}
