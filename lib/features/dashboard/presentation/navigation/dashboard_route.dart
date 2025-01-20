import 'package:go_router/go_router.dart';
import 'package:spookify_v2/core/navigation/destinations.dart';
import 'package:spookify_v2/features/dashboard/presentation/ui/dashboard/dashboard_page.dart';
import 'package:spookify_v2/features/dashboard/presentation/ui/launch/launch_page.dart';
import 'package:spookify_v2/features/dashboard/presentation/ui/library/library_page.dart';
import 'package:spookify_v2/features/dashboard/presentation/ui/more/more_page.dart';
import 'package:spookify_v2/features/dashboard/presentation/ui/search/search_page.dart';
import 'package:spookify_v2/features/playlist/presentation/navigation/track_route.dart';

import 'package:spookify_v2/features/playlist/presentation/ui/tracks/track_list_page.dart';

final dashboardRoute = StatefulShellRoute.indexedStack(
  builder: (context, state, navigationShell) => LaunchPage(
    navigationShell: navigationShell,
  ),
  branches: [
    StatefulShellBranch(
      routes: [
        GoRoute(
            path: DashboardDestination.home,
            builder: (context, state) => const DashboardPage(),
            routes: trackRoute),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: DashboardDestination.search,
          builder: (context, state) => const SearchPage(),
          routes: const [],
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: DashboardDestination.library,
          builder: (context, state) => const LibraryPage(),
          routes: const [],
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: DashboardDestination.more,
          builder: (context, state) => const MorePage(),
          routes: const [],
        ),
      ],
    ),
  ],
);
