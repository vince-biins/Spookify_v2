import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spookify_v2/core/assets/assets.dart';
import 'package:spookify_v2/core/navigation/navigation.dart';
import 'package:spookify_v2/features/dashboard/domain/model/model.dart';
import 'package:spookify_v2/features/dashboard/presentation/bloc/dashboard/dashboard_bloc.dart';
import 'package:spookify_v2/features/dashboard/presentation/widgets/widgets.dart';
import 'package:spookify_v2/service_locator.dart';

part 'dashboard_content.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final dashboardBloc = getIt<DashboardBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(CoreStrings.appName),
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
                error: (message) => Center(child: Text(message)),
              );
            },
          ),
        ),
      ),
    );
  }
}
