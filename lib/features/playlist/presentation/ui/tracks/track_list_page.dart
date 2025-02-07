import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:spookify_v2/core/core.dart';
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
    _updatePaletteGenerator();
    super.initState();
  }

  Future<void> _updatePaletteGenerator() async {
    if (widget.extra.imageUrl != null) {
      paletteGenerator = await PaletteGenerator.fromImageProvider(
        Image.network(widget.extra.imageUrl!).image,
      );
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
                loading: () => const Center(child: CircularProgressIndicator()),
                loaded: (albumTrack) => TrackListContent(
                  bgColor: gradientColor,
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
