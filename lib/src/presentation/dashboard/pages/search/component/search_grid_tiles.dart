// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:spookify_v2/src/domain/models/category.dart';
import 'package:spookify_v2/src/presentation/dashboard/components/category_search_tile.dart';

class SearchGridTiles extends StatelessWidget {
  final List<Category> categories;
  late Color _randomColor;

  Color _generateRandomColor() {
    final Random random = Random();
    int red = random.nextInt(156) + 50;
    int green = random.nextInt(156) + 50;
    int blue = random.nextInt(156) + 50;
    return Color.fromARGB(255, red, green, blue);
  }

  SearchGridTiles({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
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
            imageUrl: categories[index].imageUrl?.imageUrl ?? '',
            color: _randomColor,
          );
        },
        childCount: categories.length,
      ),
    );
  }
}
