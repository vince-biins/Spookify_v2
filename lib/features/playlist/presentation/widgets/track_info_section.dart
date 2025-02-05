import 'package:flutter/material.dart';
import 'package:spookify_v2/core/navigation/providers/playlist/playlist_data_provider.dart';
import 'package:spookify_v2/core/theme/app_colors.dart';
import 'package:spookify_v2/features/playlist/assets/playlist_strings.dart';

class TrackInfoSection extends StatelessWidget {
  final TrackDataProvider extra;
  final double infoBoxHeight;
  const TrackInfoSection({
    super.key,
    required this.infoBoxHeight,
    required this.extra,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              AppColors.background,
            ],
            stops: [
              0.00022,
              1.0,
            ],
          ),
        ),
        child: SizedBox(
          height: infoBoxHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'With ${extra.artist}',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (extra.imageUrl != null) ...[
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        backgroundImage: NetworkImage(
                          extra.imageUrl!,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                    Text(
                      PlaylistStrings.madeForYou,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.info_outline_rounded),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          PlaylistStrings.aboutRecommendation,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Album . 2025',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          iconSize: 30,
                          icon: const Icon(
                            Icons.add_circle_outline_outlined,
                            color: Colors.white70,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          iconSize: 30,
                          icon: const Icon(
                            Icons.download_for_offline_outlined,
                            color: Colors.white70,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          iconSize: 30,
                          icon: const Icon(
                            Icons.more_vert_rounded,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          iconSize: 30,
                          icon: const Icon(
                            Icons.shuffle,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox.shrink(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
