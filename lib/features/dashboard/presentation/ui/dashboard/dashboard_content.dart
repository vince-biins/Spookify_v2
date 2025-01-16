part of 'dashboard_page.dart';

class _DashboardContent extends StatelessWidget {
  const _DashboardContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCategorySection(context: context),
        const SizedBox(
          height: 16.0,
        ),
        _buildHorizontalSection(context: context),
        _buildHorizontalSection(context: context),
        _buildHorizontalSection(context: context),
      ],
    );
  }

  Widget _buildHorizontalSection({required BuildContext context}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Recommendations',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 1.5),
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: SectionTile(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySection({required BuildContext context}) {
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
          children: List.generate(8, (index) {
            return CategoryTile(
              width: tileWidth,
              imageSrc:
                  'https://t.scdn.co/images/728ed47fc1674feb95f7ac20236eb6d7.jpeg',
              title: 'Daily Mix 1',
            );
          }),
        ),
      ),
    );
  }
}
