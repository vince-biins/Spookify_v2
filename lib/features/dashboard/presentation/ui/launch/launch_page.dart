import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spookify_v2/core/navigation/destinations.dart';

import 'package:spookify_v2/features/dashboard/presentation/widgets/bottom_bar_content.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('LaunchPage'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final showBottomNavRoutes = [
      DashboardDestination.home,
      DashboardDestination.library,
      DashboardDestination.search,
      //  DashboardDestination.more,
    ];
    final showBottomNav = showBottomNavRoutes.any((route) {
      final currentPath =
          navigationShell.shellRouteContext.routerState.fullPath;

      return currentPath == route;
    });

    return Scaffold(
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: showBottomNav
          ? ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              child: BottomNavigationBar(
                elevation: 0,
                enableFeedback: false,
                currentIndex: navigationShell.currentIndex,
                onTap: navigationShell.goBranch,
                unselectedFontSize: 10.0,
                selectedFontSize: 12.0,
                iconSize: 26.0,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.black.withOpacity(0.6),
                items: BottomBarContent.values.map((item) {
                  return BottomNavigationBarItem(
                    backgroundColor: Colors.red,
                    icon: Icon(item.icon),
                    label: item.label,
                  );
                }).toList(),
              ),
            )
          : null,
    );
  }
}
