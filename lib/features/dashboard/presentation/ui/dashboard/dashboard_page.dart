import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spookify_v2/core/navigation/navigation.dart';
import 'package:spookify_v2/core/utils/error_screen.dart';
import 'package:spookify_v2/features/dashboard/data/mapper/mapper.dart';
import 'package:spookify_v2/features/dashboard/domain/model/model.dart';
import 'package:spookify_v2/features/dashboard/presentation/bloc/dashboard/dashboard_bloc.dart';
import 'package:spookify_v2/features/dashboard/presentation/widgets/header_elevated_button.dart';
import 'package:spookify_v2/features/dashboard/presentation/widgets/widgets.dart';
import 'package:spookify_v2/service_locator.dart';

import '../../../assets/assets.dart';

part 'dashboard_content.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final dashboardBloc = getIt<DashboardBloc>();

  void _onDashboardHeaderButtonPressed(String buttonName) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 30),
        child: AppBar(
          flexibleSpace: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.blueAccent,
                    child: Text('V'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  HeaderElevatedButton(
                    startedIndex: 0,
                    text: const [
                      DashboardStrings.all,
                      DashboardStrings.music,
                      DashboardStrings.podcast,
                    ],
                    onPressed: _onDashboardHeaderButtonPressed,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            dashboardBloc..add(const DashboardEvent.loadDashboard()),
        child: SingleChildScrollView(
          child: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              return state.when(
                initial: () => Center(child: Container()),
                loading: () => const Center(child: CircularProgressIndicator()),
                loaded: (categories, artists, albums) => SafeArea(
                  child: _DashboardContent(
                    categories: categories,
                    artists: artists,
                    albums: albums,
                  ),
                ),
                error: (message) => Center(child: ErrorScreen()),
              );
            },
          ),
        ),
      ),
    );
  }
}
