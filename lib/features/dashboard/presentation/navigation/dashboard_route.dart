import 'package:go_router/go_router.dart';
import 'package:spookify_v2/core/navigation/navigation.dart';
import 'package:spookify_v2/features/dashboard/domain/model/dashboard_item.dart';
import 'package:spookify_v2/features/dashboard/presentation/ui/ui.dart';
import 'package:spookify_v2/features/playlist/presentation/navigation/navigation.dart';

final dashboardRoute = StatefulShellRoute.indexedStack(
  builder: (context, state, navigationShell) => LaunchPage(
    navigationShell: navigationShell,
  ),
  branches: [
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: DashboardDestination.home,
          builder: (context, state) => DashboardPage(),
          routes: [
            ...playlistRoute,
            GoRoute(
              path: DashboardDestination.categoryList.path,
              builder: (context, state) {
                final data = state.extra as List<DashboardItem>;
                return CategoryListPage(
                  args: data,
                );
              },
            ),
          ],
        ),
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
