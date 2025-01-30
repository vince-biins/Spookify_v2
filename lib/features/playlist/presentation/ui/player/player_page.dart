import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spookify_v2/core/navigation/providers/playlist/playlist.dart';

import 'package:spookify_v2/features/playlist/presentation/ui/player/player_content.dart';

class PlayerPage extends StatelessWidget {
  final TrackDataProvider _track;
  const PlayerPage({super.key, required TrackDataProvider track})
      : _track = track;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'PLAYING FROM PLAYLIST',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: Colors.white54),
            ),
            Text(
              _track.artist,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.keyboard_arrow_down_outlined,
            size: 30,
            color: Colors.white,
          ),
        ),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.more_vert_outlined,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              _track.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            child: PlayerContent(track: _track),
          ),
        ],
      ),
    );
  }
}
