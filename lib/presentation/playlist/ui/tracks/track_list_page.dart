import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:spookify_v2/presentation/routes/models/playlist_data_provider.dart';
import 'package:spookify_v2/presentation/components/error_screen.dart';
import 'package:spookify_v2/presentation/utils/track_type.dart';
import 'package:spookify_v2/presentation/components/custom_loading_indicator.dart';
import 'package:spookify_v2/application/state/bloc/playlist/track/track_bloc.dart';
import 'package:spookify_v2/presentation/playlist/ui/tracks/track_list_content.dart';
import 'package:spookify_v2/presentation/theme/app_colors.dart';

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
  PaletteGenerator? paletteGenerator;
  @override
  void initState() {
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
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }

        if (Navigator.of(context).canPop()) {
          GoRouter.of(context).pop<bool>(true);
        }
      },
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
