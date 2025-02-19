import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spookify_v2/core/utils/error_screen.dart';
import 'package:spookify_v2/features/dashboard/presentation/bloc/search/search_bloc.dart';
import 'package:spookify_v2/features/dashboard/presentation/ui/search/search_content.dart';
import 'package:spookify_v2/service_locator.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: BlocProvider(
        create: (context) =>
            getIt<SearchBloc>()..add(const SearchEvent.loadedSearch()),
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (message) => const Center(child: ErrorScreen()),
              loaded: (categories) => SearchContent(
                categories: categories,
              ),
            );
          },
        ),
      ),
    );
  }
}
