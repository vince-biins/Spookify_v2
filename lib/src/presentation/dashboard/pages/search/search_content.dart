import 'package:flutter/material.dart';
import 'package:spookify_v2/src/domain/models/category.dart';
import 'package:spookify_v2/src/presentation/dashboard/pages/search/component/search_grid_tiles.dart';
import 'package:spookify_v2/utils/constants/dashboard_strings.dart';

class SearchContent extends StatelessWidget {
  final List<Category> categories;
  const SearchContent({super.key, required this.categories});

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
              DashboardStrings.browseAll,
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
          sliver: SearchGridTiles(categories: categories),
        ),
      ],
    );
  }
}
