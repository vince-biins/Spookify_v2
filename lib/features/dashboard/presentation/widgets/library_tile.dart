import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:spookify_v2/core/utils/track_type.dart';
import 'package:spookify_v2/core/widgets/custom_loading_image_indicator.dart';

class LibraryTile extends StatelessWidget {
  final TrackType type;
  final String? id;
  final String title;
  final String description;
  final Function(String?) onClickTile;
  final String? imageUrl;
  final IconData? icon;
  const LibraryTile({
    super.key,
    required this.type,
    this.id,
    required this.title,
    required this.description,
    required this.onClickTile,
    this.imageUrl,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClickTile(id);
      },
      child: _buildGenericCard(
        context: context,
        cardTitle: title,
        cardSubtitle: description,
        icon: icon,
        imageUrl: imageUrl,
      ),
    );
  }

  Widget _buildGenericCard({
    required BuildContext context,
    required String cardTitle,
    required String cardSubtitle,
    IconData? icon,
    String? imageUrl,
  }) {
    final bool useImage = type != TrackType.favorite && imageUrl != null;
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          useImage
              ? _buildImageFromImageUrl(imageUrl: imageUrl, type: type)
              : _buildGenericFromIconData(),
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
    );
  }

  Widget _buildImageFromImageUrl({
    required String imageUrl,
    required TrackType type,
    double imageSize = 70.0,
  }) {
    final bool isArtistType = type == TrackType.artist;
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        isArtistType ? 80 : 12.0,
      ), // Apply borderRadius here
      child: SizedBox(
        width: imageSize,
        height: imageSize,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => const CustomLoadingImageIndicator(),
          errorWidget: (context, url, error) => Image.asset(
            'assets/images/error.png',
            width: imageSize,
          ),
        ),
      ),
    );
  }

  Widget _buildGenericFromIconData({
    double imageSize = 70.0,
  }) {
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
