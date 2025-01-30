class Destinations {
  final String path;
  final String pathUrl;

  const Destinations({required this.path, required this.pathUrl});
}

class DashboardDestination {
  static const String home = '/home';
  static const String search = '/search';
  static const String library = '/library';
  static const String more = '/more';
  static const Destinations categoryList = Destinations(
    path: 'category_list',
    pathUrl: '${DashboardDestination.home}/category_list',
  );
}

class TrackDestination {
  static const Destinations track = Destinations(
    path: 'track',
    pathUrl: '${DashboardDestination.home}/track',
  );

  static Destinations player = Destinations(
    path: 'track/player',
    pathUrl: '${track.pathUrl}/player',
  );
}
