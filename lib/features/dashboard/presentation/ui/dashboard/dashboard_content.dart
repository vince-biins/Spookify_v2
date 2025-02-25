part of 'dashboard_page.dart';

class _DashboardContent extends StatelessWidget {
  final List<Category> categories;
  final List<Artist> artists;
  final List<Album> albums;
  final List<Favorite> favorites;
  const _DashboardContent({
    required this.categories,
    required this.artists,
    required this.albums,
    required this.favorites,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (categories.isNotEmpty) ...[
          _buildCategorySection(
            context: context,
            categories: categories.take(8).toList(),
          ),
          const SizedBox(
            height: 16.0,
          ),
          _buildHorizontalSection(
            context: context,
            sectionTitle: DashboardStrings.categories,
            item: categories.toDashboardItem(),
            showButton: true,
            isClickable: false,
            onItemClicked: (index) => _navigateToTrackListPage(
              context: context,
              item: categories.toDashboardItem(),
              index: index,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
        ],
        if (artists.isNotEmpty) ...[
          _buildHorizontalSection(
            context: context,
            sectionTitle: DashboardStrings.artist,
            item: artists.toDashboardItem(),
            showButton: false,
            onItemClicked: (index) => _navigateToTrackListPage(
              context: context,
              item: artists.toDashboardItem(),
              index: index,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
        ],
        if (albums.isNotEmpty) ...[
          _buildHorizontalSection(
            context: context,
            sectionTitle: DashboardStrings.album,
            item: albums.toDashboardItem(),
            showButton: true,
            onItemClicked: (index) => _navigateToTrackListPage(
              context: context,
              item: albums.toDashboardItem(),
              index: index,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
        ],
        if (favorites.isNotEmpty) ...[
          _buildHorizontalSection(
            context: context,
            sectionTitle: DashboardStrings.favorite,
            item: favorites.toDashboardItem(),
            showButton: false,
            onItemClicked: (index) => _navigateToPlayerPage(
              context: context,
              item: favorites.toDashboardItem(),
              index: index,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
        ],
        const SizedBox(
          height: 100.0,
        ),
      ],
    );
  }

  Widget _buildHorizontalSection({
    required BuildContext context,
    required String sectionTitle,
    required List<DashboardItem> item,
    required Function(int) onItemClicked,
    bool showButton = false,
    bool isClickable = true,
    int displayItems = 8,
  }) {
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
                    imageUrl: item[index].imageUrl,
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

  Widget _buildCategorySection({
    required BuildContext context,
    required List<Category> categories,
  }) {
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
              imageSrc: categories[index].imageUrl,
              title: categories[index].name,
              onTap: () {},
            );
          }),
        ),
      ),
    );
  }

  void _navigateToTrackListPage({
    required BuildContext context,
    required List<DashboardItem> item,
    required int index,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final extra = TrackDataProvider(
        id: item[index].id,
        imageUrl: item[index].imageUrl,
        artist: item[index].artist,
        title: item[index].name,
        type: item[index].type,
      );
      GoRouter.of(context).push(
        TrackDestination.track.pathUrl,
        extra: extra,
      );
    });
  }

  void _navigateToPlayerPage({
    required BuildContext context,
    required List<DashboardItem> item,
    required int index,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final extra = TrackIdProvider(
        currId: item[index].id,
        trackIds: item.map((item) => item.id).toList(),
      );

      GoRouter.of(context).push(
        TrackDestination.player.pathUrl,
        extra: extra,
      );
    });
  }
}
