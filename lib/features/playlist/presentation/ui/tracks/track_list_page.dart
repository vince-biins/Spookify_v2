import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spookify_v2/core/core.dart';
import 'package:spookify_v2/core/theme/app_colors.dart';
import 'package:spookify_v2/core/navigation/providers/playlist/playlist_data_provider.dart';
import 'package:spookify_v2/features/playlist/presentation/bloc/provider/track_bloc_provider.dart';
import 'package:spookify_v2/features/playlist/presentation/bloc/track/track_bloc.dart';
import 'package:spookify_v2/features/playlist/presentation/ui/tracks/track_list_content.dart';

import 'package:spookify_v2/service_locator.dart';

class TrackListPage extends StatefulWidget {
  final TrackDataProvider extra;

  const TrackListPage({
    super.key,
    required this.extra,
  });

  @override
  State<TrackListPage> createState() => _TrackListPageState();
}

class _TrackListPageState extends State<TrackListPage> {
  late TrackBloc trackBloc;
  @override
  void initState() {
    trackBloc = getIt<TrackBloc>(
      param1: TrackBlocProvider(
        id: widget.extra.id,
        type: widget.extra.type,
      ),
    )..add(const TrackEvent.loadTrack());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => trackBloc,
      child: Scaffold(
        extendBody: true,
        body: DecoratedBox(
          decoration: const BoxDecoration(
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
          child: BlocBuilder<TrackBloc, TrackState>(
            builder: (context, state) {
              return state.when(
                initial: () => Center(child: Container()),
                loading: () => const Center(child: CircularProgressIndicator()),
                loaded: (albumTrack) => TrackListContent(
                  track: albumTrack,
                  extra: widget.extra,
                  showDefaultAppbar: widget.extra.type != TrackType.favorite,
                ),
                error: (message) => Center(child: Text(message)),
              );
            },
          ),
        ),
      ),
    );
  }
}
