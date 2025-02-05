import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spookify_v2/core/navigation/navigation.dart';
import 'package:spookify_v2/features/dashboard/domain/model/dashboard_item.dart';

import 'package:spookify_v2/features/dashboard/presentation/widgets/widgets.dart';

import '../../../assets/assets.dart';

class CategoryListContent extends StatelessWidget {
  final List<DashboardItem> args;
  const CategoryListContent({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double tileWidth = (screenWidth - 32) / 2;
    double tileHeight = 230;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                DashboardStrings.browseAll,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 8,
              shrinkWrap: true,
              padding: const EdgeInsets.all(8.0),
              childAspectRatio: tileWidth / tileHeight,
              children: List.generate(args.length, (index) {
                return SectionTile(
                  imageSize: 180,
                  imageUrl: args[index].imageUrl,
                  title: args[index].artist,
                  onItemClicked: () {
                    final extra = TrackDataProvider(
                      id: args[index].id,
                      imageUrl: args[index].imageUrl,
                      artist: args[index].artist,
                      title: args[index].name,
                      type: args[index].type,
                    );
                    GoRouter.of(context).push(
                      TrackDestination.track.pathUrl,
                      extra: extra,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
