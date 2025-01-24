import 'package:flutter/material.dart';
import 'package:spookify_v2/features/dashboard/assets/dashboard_strings.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverAppBar(
          expandedHeight: 200.0,
          floating: false,
          pinned: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
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
        const SliverFillRemaining(),
      ],
    );
  }
}
