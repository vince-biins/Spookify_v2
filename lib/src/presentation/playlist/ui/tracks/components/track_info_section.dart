import 'package:flutter/material.dart';
import 'package:spookify_v2/src/application/paramaters/track_param.dart';
import 'package:spookify_v2/src/presentation/theme/app_colors.dart';
import 'package:spookify_v2/utils/constants/playlist_strings.dart';

class TrackInfoSection extends StatelessWidget {
  final TrackParam extra;
  final double infoBoxHeight;
  final bool isDownloaded;
  final VoidCallback onClickDownloadTrack;
  const TrackInfoSection({
    super.key,
    required this.infoBoxHeight,
    required this.extra,
    required this.onClickDownloadTrack,
    required this.isDownloaded,
  });

  @override
  Widget build(BuildContext context) {
    final String title =
        extra.artist == null ? extra.title : 'With ${extra.artist}';
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
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge,
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
                          extra.imageUrl!.imageUrl,
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
                          onPressed: onClickDownloadTrack,
                          iconSize: 30,
                          icon: Icon(
                            isDownloaded
                                ? Icons.download_done_rounded
                                : Icons.download_for_offline_outlined,
                            color: isDownloaded ? Colors.green : Colors.white70,
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
