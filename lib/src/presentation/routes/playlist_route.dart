import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spookify_v2/src/application/paramaters/track_param.dart';
import 'package:spookify_v2/utils/constants/destinations.dart';

import 'package:spookify_v2/src/application/paramaters/track_id_provider.dart';
import 'package:spookify_v2/src/application/paramaters/track_bloc_provider.dart';
import 'package:spookify_v2/src/application/state/bloc/playlist/track/track_bloc.dart';
import 'package:spookify_v2/src/presentation/playlist/ui/ui.dart';
import 'package:spookify_v2/utils/injectors/service_locator.dart';

final List<RouteBase> playlistRoute = [
  GoRoute(
    path: TrackDestination.track.path,
    builder: (context, state) {
      final TrackParam trackData = state.extra as TrackParam;
      return BlocProvider(
        create: (context) => getIt<TrackBloc>(
          param1: TrackBlocProvider(
            id: trackData.id,
            type: trackData.type,
          ),
        )..add(const TrackEvent.loadTrack()),
        child: TrackListPage(
          extra: trackData,
        ),
      );
    },
  ),
  GoRoute(
    path: TrackDestination.player.path,
    pageBuilder: (context, state) {
      final extra = state.extra as TrackIdProvider;
      return _createSlideUpPage(
        PlayerPage(
          extra: extra,
        ),
      );
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
