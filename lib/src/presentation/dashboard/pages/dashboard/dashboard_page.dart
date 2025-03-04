import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spookify_v2/src/domain/models/album.dart';
import 'package:spookify_v2/src/domain/models/artist.dart';
import 'package:spookify_v2/src/domain/models/category.dart';
import 'package:spookify_v2/src/infrastructure/data_source/mappers/dashboard_mapper.dart';
import 'package:spookify_v2/src/application/paramaters/dashboard_item.dart';
import 'package:spookify_v2/src/application/paramaters/track_data_provider.dart';
import 'package:spookify_v2/src/application/paramaters/track_id_provider.dart';
import 'package:spookify_v2/src/presentation/dashboard/pages/dashboard/component/dashboard_grid_section.dart';
import 'package:spookify_v2/src/presentation/dashboard/pages/dashboard/component/dashboard_horizontal_section.dart';
import 'package:spookify_v2/utils/constants/destinations.dart';
import 'package:spookify_v2/src/presentation/components/error_screen.dart';
import 'package:spookify_v2/src/presentation/components/custom_loading_indicator.dart';
import 'package:spookify_v2/src/domain/models/favorite.dart';
import 'package:spookify_v2/src/application/state/bloc/dashboard/dashboard/dashboard_bloc.dart';
import 'package:spookify_v2/src/presentation/dashboard/components/header_elevated_button.dart';
import 'package:spookify_v2/utils/constants/dashboard_strings.dart';

part 'dashboard_content.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

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
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return state.when(
            initial: () => Center(child: Container()),
            loading: () => const Center(child: CustomLoadingIndicator()),
            loaded: (categories, artists, albums, favorites) => SafeArea(
              child: SingleChildScrollView(
                child: _DashboardContent(
                  categories: categories,
                  artists: artists,
                  albums: albums,
                  favorites: favorites,
                ),
              ),
            ),
            error: (message) => const Center(child: ErrorScreen()),
          );
        },
      ),
    );
  }
}
