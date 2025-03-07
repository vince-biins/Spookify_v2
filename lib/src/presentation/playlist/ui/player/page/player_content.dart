import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spookify_v2/src/domain/models/entity/track.dart';
import 'package:spookify_v2/src/application/state/cubit/player/player_cubit.dart';
import 'package:spookify_v2/src/presentation/components/image_network_error_handling.dart';
import 'package:spookify_v2/src/presentation/playlist/ui/player/component/track_player_indicator.dart';

class PlayerContent extends StatelessWidget {
  final Track _track;
  const PlayerContent({super.key, required Track track}) : _track = track;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildTrackDetails(context),
              const SizedBox(
                height: 16.0,
              ),
              TrackPlayerIndicator(durationMs: _track.durationMs),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrackDetails(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (_track.imageUrl != null) ...[
          SizedBox.square(
            dimension: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ImageNetworkErrorHandling(
                imageSize: 60,
                loadingIndicatorSize: 20,
                imageUrl: _track.imageUrl!.imageUrl,
              ),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _track.trackName,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              if (_track.artistName != null) ...[
                Text(
                  _track.artistName!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.grey),
                ),
              ],
            ],
          ),
        ),
        BlocBuilder<PlayerCubit, PlayerState>(
          builder: (context, state) {
            return IconButton(
              onPressed: () => context.read<PlayerCubit>().toggleFavorite(
                    isFavorite: !state.isFavorite,
                    track: _track,
                  ),
              icon: state.isFavorite
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30,
                    )
                  : const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 30,
                    ),
            );
          },
        ),
      ],
    );
  }
}
