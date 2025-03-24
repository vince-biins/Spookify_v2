import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spookify_v2/src/application/state/bloc/dashboard/dashboard/dashboard_bloc.dart';
import 'package:spookify_v2/src/application/state/bloc/dashboard/launch/launch_bloc.dart';
import 'package:spookify_v2/src/application/state/bloc/dashboard/library/library_bloc.dart';
import 'package:spookify_v2/src/application/state/bloc/dashboard/search/search.dart';
import 'package:spookify_v2/src/application/paramaters/dashboard_item.dart';
import 'package:spookify_v2/src/presentation/dashboard/pages/category/category_list_page.dart';
import 'package:spookify_v2/src/presentation/dashboard/pages/dashboard/dashboard_page.dart';
import 'package:spookify_v2/src/presentation/dashboard/pages/launch/launch_page.dart';
import 'package:spookify_v2/src/presentation/dashboard/pages/library/library_page.dart';
import 'package:spookify_v2/src/presentation/dashboard/pages/search/search_page.dart';
import 'package:spookify_v2/src/presentation/dashboard/pages/wrapper/refresh_wrapper.dart';
import 'package:spookify_v2/utils/constants/destinations.dart';
import 'package:spookify_v2/src/presentation/routes/playlist_route.dart';
import 'package:spookify_v2/utils/injectors/service_locator.dart';

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
          path: BottomNavBarDestination.home,
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
          path: BottomNavBarDestination.search,
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
          path: BottomNavBarDestination.library,
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
  ],
);
