import 'package:flutter/material.dart';
import 'package:spookify_v2/core/theme/app_colors.dart';
import 'package:spookify_v2/features/playlist/presentation/ui/tracks/track_list_content.dart';

class TrackListPage extends StatefulWidget {
  const TrackListPage({super.key});

  @override
  State<TrackListPage> createState() => _TrackListPageState();
}

class _TrackListPageState extends State<TrackListPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primary,
              AppColors.background,
            ],
            stops: [
              0,
              0.7,
            ],
          ),
        ),
        child: TrackListContent(),
      ),
    );
  }
}
