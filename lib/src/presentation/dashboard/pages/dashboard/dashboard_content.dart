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
          DashboardGridSection(
            categories: categories.take(8).toList(),
          ),
          const SizedBox(
            height: 16.0,
          ),
          DashboardHorizontalSection(
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
          DashboardHorizontalSection(
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
          DashboardHorizontalSection(
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
          DashboardHorizontalSection(
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

  void _navigateToTrackListPage({
    required BuildContext context,
    required List<DashboardItem> item,
    required int index,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final extra = TrackDataProvider(
        id: item[index].id,
        imageUrl: item[index].imageUrl,
        artist: item[index].artist,
        title: item[index].name,
        type: item[index].type,
      );

      final result = await GoRouter.of(context).push(
        TrackDestination.track.pathUrl,
        extra: extra,
      );

      if (context.mounted && result == true) {
        context.read<DashboardBloc>().add(const DashboardEvent.loadDashboard());
      }
    });
  }

  void _navigateToPlayerPage({
    required BuildContext context,
    required List<DashboardItem> item,
    required int index,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final extra = TrackIdProvider(
        currId: item[index].id,
        trackIds: item.map((item) => item.id).toList(),
      );

      final result = await GoRouter.of(context).push(
        TrackDestination.player.pathUrl,
        extra: extra,
      );

      if (context.mounted && result == true) {
        context.read<DashboardBloc>().add(const DashboardEvent.loadDashboard());
      }
    });
  }
}
