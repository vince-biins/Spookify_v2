import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spookify_v2/utils/constants/destinations.dart';
import 'package:spookify_v2/src/application/state/bloc/internet_connection/connectivity_bloc.dart';
import 'package:spookify_v2/src/application/resources/connectivity_status.dart';
import 'package:spookify_v2/src/application/state/bloc/dashboard/launch/launch_bloc.dart';
import 'package:spookify_v2/src/presentation/dashboard/components/bottom_bar_content.dart';
import 'package:spookify_v2/utils/injectors/service_locator.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('LaunchPage'));

  final StatefulNavigationShell navigationShell;

  @override
  State<LaunchPage> createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  bool _isVisibleOfflineIndicator = true;
  bool _isInitialState = true;

  @override
  Widget build(BuildContext context) {
    final showBottomNavRoutes = [
      BottomNavBarDestination.home,
      BottomNavBarDestination.library,
      BottomNavBarDestination.search,
      //  DashboardDestination.more,
    ];
    final showBottomNav = showBottomNavRoutes.any((route) {
      final currentPath =
          widget.navigationShell.shellRouteContext.routerState.fullPath;

      return currentPath == route;
    });

    // final showBottomPlayer =
    //     widget.navigationShell.shellRouteContext.routerState.fullPath !=
    //         TrackDestination.player.pathUrl;

    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          widget.navigationShell,
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //         if (showBottomPlayer) const BottomPlayer(),
                if (showBottomNav)
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                    child: BottomNavigationBar(
                      elevation: 0,
                      enableFeedback: false,
                      currentIndex: widget.navigationShell.currentIndex,
                      onTap: (index) {
                        context
                            .read<LaunchBloc>()
                            .add(LaunchEvent.tabChanged(index: index));
                        widget.navigationShell
                            .goBranch(index, initialLocation: true);
                      },
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
                  ),
                BlocBuilder<ConnectivityBloc, ConnectivityState>(
                  bloc: getIt<ConnectivityBloc>(),
                  builder: (context, state) {
                    bool hasInternetConnection =
                        state.status != ConnectivityStatus.disconnected;

                    if (hasInternetConnection) {
                      Future.delayed(const Duration(seconds: 3), () {
                        if (mounted) {
                          setState(() {
                            _isVisibleOfflineIndicator = false;
                            _isInitialState = false;
                          });
                        }
                      });
                    }

                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 350),
                      child: !_isInitialState
                          ? hasInternetConnection
                              ? _isVisibleOfflineIndicator
                                  ? Container(
                                      color: Colors.lightBlue,
                                      height: 20,
                                      child: const Center(
                                        child: Text(
                                          'You\'re back online',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink()
                              : Container(
                                  color: Colors.lightBlue,
                                  height: 20,
                                  child: const Center(
                                    child: Text(
                                      'You\'re offline',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                          : const SizedBox.shrink(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
