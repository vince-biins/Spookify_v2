import 'package:flutter/material.dart';
import 'package:spookify_v2/features/dashboard/presentation/ui/library/library_content.dart';
import 'package:spookify_v2/features/dashboard/presentation/widgets/header_elevated_button.dart';

import '../../../assets/assets.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const LibraryContent(),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(150.0),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: AppBar(
          toolbarHeight: 50,
          leadingWidth: 27,
          leading: const CircleAvatar(
            backgroundColor: Colors.blueAccent,
            child: Text('V'),
          ),
          title: const Text(
            DashboardStrings.yourLibrary,
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
          flexibleSpace: Container(
            margin: const EdgeInsets.only(top: 70.0),
            child: HeaderElevatedButton(
              startedIndex: -1,
              text: const [
                DashboardStrings.playlist,
                DashboardStrings.album,
                DashboardStrings.artist,
              ],
              onPressed: (text) {},
            ),
          ),
        ),
      ),
    );
  }
}
