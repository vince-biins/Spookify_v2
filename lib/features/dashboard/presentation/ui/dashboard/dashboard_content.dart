part of 'dashboard_page.dart';

class _DashboardContent extends StatelessWidget {
  final List<Category> categories;
  final List<Artist> artists;
  final List<Album> albums;
  const _DashboardContent({
    required this.categories,
    required this.artists,
    required this.albums,
  });

  @override
  Widget build(BuildContext context) {
    DashboardRepository repository = DashboardRepositoryImpl(service: getIt());
    repository.getCategories();
    return Column(
      children: [
        _buildCategorySection(context: context, categories: categories),
        const SizedBox(
          height: 16.0,
        ),
        // _buildHorizontalSection(
        //   context: context,
        //   sectionTitle: 'Recommendations',
        // ),
        // _buildHorizontalSection(
        //   context: context,
        //   sectionTitle: 'Playlists',
        //   showButton: true,
        //   onPressed: () {},
        // ),

        _buildHorizontalSection(
          context: context,
          sectionTitle: 'Albums',
          item: albums
              .map(
                (albums) => DashboardItem(
                    id: albums.id,
                    name: albums.name,
                    imageUrl: albums.imageUrl,
                    artist:
                        albums.artist.map((artist) => artist.name).join(','),
                    type: albums.type),
              )
              .toList(),
          showButton: true,
          onPressed: () {},
        ),
        _buildHorizontalSection(
          context: context,
          sectionTitle: 'Artists',
          item: artists
              .map(
                (artist) => DashboardItem(
                    id: artist.id,
                    name: artist.name,
                    imageUrl: artist.imageUrl,
                    artist: artist.name,
                    type: artist.type),
              )
              .toList(),
          showButton: true,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildHorizontalSection({
    required BuildContext context,
    required String sectionTitle,
    required List<DashboardItem> item,
    bool showButton = false,
    void Function()? onPressed,
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
                if (showButton && onPressed != null)
                  TextButton(
                    onPressed: onPressed,
                    child: const Text(
                      'Show all',
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
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: item.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SectionTile(
                    imageUrl: item[index].imageUrl,
                    title: item[index].name,
                    onItemClicked: () {
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
                    },
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
}
