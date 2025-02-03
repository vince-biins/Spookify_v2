import 'package:flutter/material.dart';
import 'package:spookify_v2/features/dashboard/assets/assets.dart';

enum BottomBarContent {
  home(label: DashboardStrings.navHomeTitle, icon: Icons.home),
  search(label: DashboardStrings.navSearchTitle, icon: Icons.search),
  library(label: DashboardStrings.navLibraryTitle, icon: Icons.library_books);
//  more(label: DashboardStrings.navMoreTitle, icon: Icons.more);

  final IconData icon;
  final String label;

  const BottomBarContent({required this.icon, required this.label});
}
