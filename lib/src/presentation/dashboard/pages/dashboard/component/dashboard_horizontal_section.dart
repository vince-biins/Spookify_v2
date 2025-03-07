// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:spookify_v2/src/application/paramaters/dashboard_item.dart';
import 'package:spookify_v2/src/domain/resources/track_type.dart';
import 'package:spookify_v2/src/presentation/dashboard/components/section_tile.dart';
import 'package:spookify_v2/utils/constants/dashboard_strings.dart';
import 'package:spookify_v2/utils/constants/destinations.dart';

class DashboardHorizontalSection extends StatelessWidget {
  final String sectionTitle;
  final List<DashboardItem> item;
  final Function(int) onItemClicked;
  final bool showButton;
  final bool isClickable;
  final int displayItems;

  const DashboardHorizontalSection({
    super.key,
    required this.sectionTitle,
    required this.item,
    required this.onItemClicked,
    this.showButton = false,
    this.isClickable = true,
    this.displayItems = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sectionTitle,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                ),
                if (showButton)
                  TextButton(
                    onPressed: () {
                      final extra = item;
                      GoRouter.of(context).push(
                        DashboardDestination.categoryList.pathUrl,
                        extra: extra,
                      );
                    },
                    child: const Text(
                      DashboardStrings.showAll,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:
                  item.length > displayItems ? displayItems : item.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SectionTile(
                    imageUrl: item[index].imageUrl!.imageUrl,
                    title: item[index].name,
                    isRoundedImage: item[index].type == TrackType.artist,
                    onItemClicked: isClickable
                        ? () {
                            onItemClicked(index);
                          }
                        : () {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
