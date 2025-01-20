import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spookify_v2/core/navigation/destinations.dart';

import 'package:spookify_v2/features/dashboard/presentation/navigation/dashboard_route.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final mainRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: DashboardDestination.home,
  routes: [
    dashboardRoute,
  ],
);
