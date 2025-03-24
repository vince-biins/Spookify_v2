import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spookify_v2/src/presentation/components/error_screen.dart';
import 'package:spookify_v2/src/presentation/components/custom_loading_indicator.dart';
import 'package:spookify_v2/src/application/state/bloc/dashboard/search/search_bloc.dart';
import 'package:spookify_v2/src/presentation/dashboard/pages/search/search_content.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return state.when(
            loading: () => const Center(child: CustomLoadingIndicator()),
            error: (message) => const Center(child: ErrorScreen()),
            loaded: (categories) => SearchContent(
              categories: categories,
            ),
          );
        },
      ),
    );
  }
}
