class Destinations {
  final String name;
  final String path;
  final String pathUrl;

  const Destinations({
    required this.name,
    required this.path,
    required this.pathUrl,
  });
}

class BottomNavBarDestination {
  static const String home = '/home';
  static const String search = '/search';
  static const String library = '/library';
  static const String more = '/more';
}

class DashboardDestination {
  static const Destinations categoryList = Destinations(
    name: 'category_list',
    path: 'category_list',
    pathUrl: '${BottomNavBarDestination.home}/category_list',
  );
}

class TrackDestination {
  static const Destinations track = Destinations(
    name: 'track',
    path: 'track',
    pathUrl: '${BottomNavBarDestination.home}/track',
  );

  static const Destinations player = Destinations(
    name: 'player',
    path: 'player',
    pathUrl: '${BottomNavBarDestination.home}/player',
  );
}
