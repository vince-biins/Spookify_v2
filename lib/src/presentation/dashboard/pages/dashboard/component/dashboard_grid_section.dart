import 'package:flutter/material.dart';
import 'package:spookify_v2/src/domain/models/entity/category.dart';
import 'package:spookify_v2/src/presentation/dashboard/components/category_tile.dart';

class DashboardGridSection extends StatelessWidget {
  final List<Category> categories;
  const DashboardGridSection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double tileWidth = (screenWidth - 32) / 2;
    double tileHeight = 60;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: SizedBox(
        height: 280,
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          padding: const EdgeInsets.all(8.0),
          childAspectRatio: tileWidth / tileHeight,
          children: List.generate(categories.length, (index) {
            return CategoryTile(
              width: tileWidth,
              imageSrc: categories[index].imageUrl?.imageUrl ?? '',
              title: categories[index].name,
              onTap: () {},
            );
          }),
        ),
      ),
    );
  }
}
