import 'package:go_router/go_router.dart';
import 'package:spookify_v2/core/navigation/destinations.dart';
import 'package:spookify_v2/features/playlist/presentation/ui/tracks/track_list_page.dart';

final List<RouteBase> trackRoute = [
  GoRoute(
    path: TrackDestination.track.path,
    builder: (context, state) => const TrackListPage(),
  ),
];
