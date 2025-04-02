import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spookify_v2/utils/constants/destinations.dart';

import 'package:spookify_v2/src/presentation/routes/dashboard_route.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final mainRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: BottomNavBarDestination.home,
  routes: [
    dashboardRoute,
  ],
);
