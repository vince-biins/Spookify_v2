import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:spookify_v2/core/core.dart';
import 'package:spookify_v2/core/utils/error_screen.dart';
import 'package:spookify_v2/core/widgets/custom_loading_indicator.dart';
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
  PaletteGenerator? paletteGenerator;
  @override
  void initState() {
    trackBloc = getIt<TrackBloc>(
      param1: TrackBlocProvider(
        id: widget.extra.id,
        type: widget.extra.type,
      ),
    )..add(const TrackEvent.loadTrack());
    if (widget.extra.imageUrl != null) {
      _updatePaletteGenerator(widget.extra.imageUrl!);
    }
    super.initState();
  }

  Future<void> _updatePaletteGenerator(String imageUrl) async {
    try {
      paletteGenerator = await PaletteGenerator.fromImageProvider(
        NetworkImage(imageUrl),
      );
    } catch (e) {
      paletteGenerator =
          PaletteGenerator.fromColors([PaletteColor(Colors.grey, 1)]);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Color gradientColor =
        paletteGenerator?.dominantColor?.color ?? AppColors.primary;
    return BlocProvider(
      create: (context) => trackBloc,
      child: Scaffold(
        extendBody: true,
        body: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                gradientColor,
                AppColors.background,
              ],
              stops: const [
                0,
                0.7,
              ],
            ),
          ),
          child: BlocBuilder<TrackBloc, TrackState>(
            builder: (context, state) {
              return state.when(
                initial: () => Center(child: Container()),
                loading: () => const Center(child: CustomLoadingIndicator()),
                loaded: (track, isDownloaded) => TrackListContent(
                  bgColor: gradientColor,
                  track: track,
                  extra: widget.extra,
                  showDefaultAppbar: widget.extra.type != TrackType.favorite,
                  isDownloaded: isDownloaded,
                ),
                error: (message) => const Center(child: ErrorScreen()),
              );
            },
          ),
        ),
      ),
    );
  }
}
