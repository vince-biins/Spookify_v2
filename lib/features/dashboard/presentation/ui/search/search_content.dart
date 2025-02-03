import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spookify_v2/features/dashboard/assets/assets.dart';
import 'package:spookify_v2/features/dashboard/domain/model/model.dart';
import 'package:spookify_v2/features/dashboard/presentation/widgets/category_search_tile.dart';

class SearchContent extends StatefulWidget {
  final List<Category> categories;
  const SearchContent({super.key, required this.categories});

  @override
  State<SearchContent> createState() => _SearchContentState();
}

class _SearchContentState extends State<SearchContent> {
  late Color _randomColor;

  Color _generateRandomColor() {
    final Random random = Random();
    int red = random.nextInt(156) + 50;
    int green = random.nextInt(156) + 50;
    int blue = random.nextInt(156) + 50;
    return Color.fromARGB(255, red, green, blue);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverAppBar(
          expandedHeight: 200.0,
          floating: true,
          pinned: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: SizedBox(
                height: 50,
                child: TextField(
                  cursorColor: Theme.of(context).scaffoldBackgroundColor,
                  style: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: DashboardStrings.searchHintText,
                  ),
                  onSubmitted: (value) {},
                ),
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'Browse all',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(
            16.0,
            8.0,
            16.0,
            100,
          ),
          sliver:
              _buildCategory(context: context, categories: widget.categories),
        ),
      ],
    );
  }

  Widget _buildCategory({
    required BuildContext context,
    required List<Category> categories,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    double tileWidth = (screenWidth - 32) / 2;
    double tileHeight = 100;

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: tileWidth / tileHeight,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          _randomColor = _generateRandomColor();
          return CategorySearchTile(
            title: categories[index].name,
            imageUrl: categories[index].imageUrl,
            color: _randomColor,
          );
        },
        childCount: categories.length,
      ),
    );
  }
}
