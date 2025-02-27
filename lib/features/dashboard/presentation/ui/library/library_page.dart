import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spookify_v2/core/utils/error_screen.dart';
import 'package:spookify_v2/core/widgets/custom_loading_indicator.dart';
import 'package:spookify_v2/features/dashboard/presentation/bloc/library/library_bloc.dart';
import 'package:spookify_v2/features/dashboard/presentation/ui/library/library_content.dart';
import 'package:spookify_v2/features/dashboard/presentation/widgets/header_elevated_button.dart';
import 'package:spookify_v2/service_locator.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              toolbarHeight: 50,
              leading: const Padding(
                padding: EdgeInsets.only(left: 18.0),
                child: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text('V'),
                ),
              ),
              title: const Text(
                'Your Library',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              actions: <Widget>[
                IconButton(
                  iconSize: 30,
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
                IconButton(
                  iconSize: 30,
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                ),
              ],
              pinned: true,
              floating: false,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(70.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 10,
                  ),
                  child: HeaderElevatedButton(
                    startedIndex: -1,
                    text: const [
                      'Playlist',
                      'Album',
                      'Artist',
                    ],
                    onPressed: (text) {},
                  ),
                ),
              ),
            ),
          ];
        },
        body: BlocProvider(
          create: (context) =>
              getIt<LibraryBloc>()..add(const LibraryEvent.loadLibrary()),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: BlocBuilder<LibraryBloc, LibraryState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CustomLoadingIndicator());
                } else if (state.error.isNotEmpty) {
                  return const Center(child: ErrorScreen());
                } else {
                  return LibraryContent(
                    categories: state.saveCategories,
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
