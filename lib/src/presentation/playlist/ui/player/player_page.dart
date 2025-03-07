import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spookify_v2/src/application/paramaters/track_id_provider.dart';
import 'package:spookify_v2/src/presentation/components/error_screen.dart';
import 'package:spookify_v2/src/presentation/components/custom_loading_indicator.dart';
import 'package:spookify_v2/src/presentation/components/image_network_error_handling.dart';
import 'package:spookify_v2/utils/constants/playlist_strings.dart';
import 'package:spookify_v2/src/application/state/cubit/player/player_cubit.dart';
import 'package:spookify_v2/src/presentation/playlist/ui/player/player_content.dart';
import 'package:spookify_v2/utils/injectors/service_locator.dart';

class PlayerPage extends StatelessWidget {
  final TrackIdProvider _extra;
  const PlayerPage({super.key, required TrackIdProvider extra})
      : _extra = extra;
  @override
  Widget build(BuildContext context) {
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
      child: BlocProvider(
        create: (context) => getIt<PlayerCubit>()..initialize(_extra),
        child: BlocBuilder<PlayerCubit, PlayerState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CustomLoadingIndicator());
            } else if (state.error.isNotEmpty) {
              return const Center(child: ErrorScreen());
            } else {
              return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  centerTitle: true,
                  title: Column(
                    children: [
                      Text(
                        PlaylistStrings.playingFromPlaylist,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(color: Colors.white54),
                      ),
                      Text(
                        state.track.artistName ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () {
                      if (Navigator.of(context).canPop()) {
                        GoRouter.of(context).pop<bool>(true);
                      }
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  actions: const [
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.more_vert_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                body: Stack(
                  children: [
                    Positioned.fill(
                      child: ImageNetworkErrorHandling(
                        imageSize: double.infinity,
                        loadingIndicatorSize: 20,
                        imageUrl: state.track.imageUrl?.imageUrl ?? '',
                      ),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.5),
                      child: PlayerContent(track: state.track),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
