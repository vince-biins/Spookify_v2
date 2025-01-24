import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spookify_v2/core/navigation/destinations.dart';
import 'package:spookify_v2/core/navigation/providers/playlist/playlist_data_provider.dart';
import 'package:spookify_v2/features/playlist/presentation/ui/player/player_page.dart';
import 'package:spookify_v2/features/playlist/presentation/ui/tracks/track_list_page.dart';

final List<RouteBase> trackRoute = [
  GoRoute(
    path: TrackDestination.track.path,
    builder: (context, state) {
      final trackData = state.extra as TrackDataProvider;
      return TrackListPage(
        extra: trackData,
      );
    },
  ),
  GoRoute(
    path: TrackDestination.player.path,
    pageBuilder: (context, state) {
      final trackData = state.extra as TrackDataProvider;
      return _createSlideUpPage(PlayerPage(
        track: trackData,
      ));
    },
  ),
];

CustomTransitionPage _createSlideUpPage(Widget page) {
  return CustomTransitionPage(
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
