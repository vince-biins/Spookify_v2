import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spookify_v2/core/navigation/navigation.dart';
import 'package:spookify_v2/features/dashboard/dashboard.dart';
import 'package:spookify_v2/features/dashboard/presentation/bloc/launch/launch_bloc.dart';
import 'package:spookify_v2/features/dashboard/presentation/bloc/library/library_bloc.dart';
import 'package:spookify_v2/features/dashboard/presentation/bloc/search/search.dart';
import 'package:spookify_v2/features/dashboard/presentation/ui/wrapper/refresh_wrapper.dart';
import 'package:spookify_v2/features/playlist/presentation/navigation/navigation.dart';
import 'package:spookify_v2/service_locator.dart';

final dashboardRoute = StatefulShellRoute.indexedStack(
  builder: (context, state, navigationShell) => BlocProvider(
    create: (context) => getIt<LaunchBloc>(),
    child: LaunchPage(
      navigationShell: navigationShell,
    ),
  ),
  branches: [
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: DashboardDestination.home,
          builder: (context, state) => BlocProvider(
            create: (context) => getIt<DashboardBloc>()
              ..add(const DashboardEvent.loadDashboard()),
            child: RefreshWrapper(
              refreshFunction: (context) => context
                  .read<DashboardBloc>()
                  .add(const DashboardEvent.loadDashboard()),
              child: const DashboardPage(),
            ),
          ),
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
          builder: (context, state) => BlocProvider(
            create: (context) =>
                getIt<SearchBloc>()..add(const SearchEvent.loadedSearch()),
            child: const SearchPage(),
          ),
          routes: const [],
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: DashboardDestination.library,
          builder: (context, state) => BlocProvider(
            create: (context) =>
                getIt<LibraryBloc>()..add(const LibraryEvent.loadLibrary()),
            child: RefreshWrapper(
              refreshFunction: (context) => context
                  .read<LibraryBloc>()
                  .add(const LibraryEvent.loadLibrary()),
              child: const LibraryPage(),
            ),
          ),
          routes: const [],
        ),
      ],
    ),
    // StatefulShellBranch(
    //   routes: [
    //     GoRoute(
    //       path: DashboardDestination.more,
    //       builder: (context, state) => const MorePage(),
    //       routes: const [],
    //     ),
    //   ],
    // ),
  ],
);
