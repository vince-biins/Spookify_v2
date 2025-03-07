import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:spookify_v2/src/application/paramaters/track_param.dart';
import 'package:spookify_v2/src/presentation/components/error_screen.dart';
import 'package:spookify_v2/src/domain/resources/track_type.dart';
import 'package:spookify_v2/src/presentation/components/custom_loading_indicator.dart';
import 'package:spookify_v2/src/application/state/bloc/playlist/track/track_bloc.dart';
import 'package:spookify_v2/src/presentation/playlist/ui/tracks/page/track_list_content.dart';
import 'package:spookify_v2/src/presentation/theme/app_colors.dart';
import 'package:spookify_v2/utils/constants/destinations.dart';

class TrackListPage extends StatelessWidget {
  final TrackParam extra;

  final PaletteGenerator? paletteGenerator;

  const TrackListPage({
    super.key,
    required this.extra,
    this.paletteGenerator,
  });

  @override
  Widget build(BuildContext context) {
    final Color gradientColor = extra.color ?? AppColors.primary;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }

        if (Navigator.of(context).canPop()) {
          context.read<TrackBloc>().add(const TrackEvent.navigateBack());
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
          child: BlocConsumer<TrackBloc, TrackState>(
            listener: (context, state) {
              state.maybeWhen(
                loaded: (track, isDownloaded, event) async {
                  if (event is NavigateBack) {
                    GoRouter.of(context).pop<bool>(true);
                  }

                  if (event is NavigateToPlayerPage) {
                    final result = await GoRouter.of(context).push(
                      TrackDestination.player.pathUrl,
                      extra: event.track,
                    );

                    if (result == true && context.mounted) {
                      context
                          .read<TrackBloc>()
                          .add(const TrackEvent.loadTrack());
                    }
                  }
                },
                orElse: () {},
              );
            },
            builder: (context, state) {
              return state.when(
                initial: () => Center(child: Container()),
                loading: () => const Center(child: CustomLoadingIndicator()),
                loaded: (track, isDownloaded, event) => TrackListContent(
                  bgColor: gradientColor,
                  track: track,
                  extra: extra,
                  showDefaultAppbar: extra.type != TrackType.favorite,
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
