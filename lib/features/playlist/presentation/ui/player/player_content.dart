import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spookify_v2/features/playlist/domain/model/model.dart';
import 'package:spookify_v2/features/playlist/presentation/bloc/player/cubit/player_cubit.dart';

class PlayerContent extends StatefulWidget {
  final Track _track;
  const PlayerContent({super.key, required Track track}) : _track = track;

  @override
  State<PlayerContent> createState() => _PlayerContentState();
}

class _PlayerContentState extends State<PlayerContent>
    with SingleTickerProviderStateMixin {
  late bool _isPlaying;
  late Duration duration;

  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    _isPlaying = false;
    duration = Duration(milliseconds: widget._track.durationMs);

    controller = AnimationController(
      duration: Duration(
        seconds: duration.inSeconds,
      ),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _isPlaying = false;
          });
        }
      });

    super.initState();
  }

  void _onClickedPlayButton() {
    setState(() {
      _isPlaying = !_isPlaying;
    });

    if (_isPlaying) {
      controller.forward();
    } else {
      controller.stop();
    }
  }

  void _skipForward() {
    final newValue = controller.value + (10 / duration.inSeconds);
    final clampedValue = newValue.clamp(0.0, 1.0);
    controller.forward(from: clampedValue);
  }

  void _skipBackward() {
    final newValue = controller.value - (10 / duration.inSeconds);
    final clampedValue = newValue.clamp(0.0, 1.0);
    controller.forward(from: clampedValue);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildTrackDetails(context),
              const SizedBox(
                height: 16.0,
              ),
              _buildPlayerActions(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrackDetails(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (widget._track.imageUrl != null) ...[
          SizedBox.square(
            dimension: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                widget._track.imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget._track.trackName,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              if (widget._track.artistName != null) ...[
                Text(
                  widget._track.artistName!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.grey),
                ),
              ],
            ],
          ),
        ),
        BlocBuilder<PlayerCubit, PlayerState>(
          builder: (context, state) {
            return IconButton(
              onPressed: () => context.read<PlayerCubit>().toggleFavorite(
                    isFavorite: !state.isFavorite,
                    track: widget._track,
                  ),
              icon: state.isFavorite
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30,
                    )
                  : const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 30,
                    ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPlayerActions(BuildContext context) {
    final duration =
        Duration(seconds: (animation.value * this.duration.inSeconds).toInt());
    final formattedTime =
        "${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";
    return Column(
      children: [
        Column(
          children: [
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 2,
                activeTrackColor: Colors.white,
                inactiveTrackColor: Colors.white.withOpacity(0.3),
                thumbColor: Colors.white,
                overlayShape: SliderComponentShape.noOverlay,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5),
                trackShape: const RoundedRectSliderTrackShape(),
                tickMarkShape: SliderTickMarkShape.noTickMark,
              ),
              child: Container(
                width: double.infinity,
                height: 20,
                padding: EdgeInsets.zero,
                child: Slider(
                  min: 0,
                  max: 1,
                  value: animation.value,
                  onChanged: (value) {
                    setState(() {
                      controller.value = value;
                      if (_isPlaying) {
                        controller.forward();
                      }
                    });
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formattedTime,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  "${this.duration.inMinutes}:${(this.duration.inSeconds % 60).toString().padLeft(2, '0')}",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.shuffle_rounded,
                size: 30,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: _skipBackward,
              icon: const Icon(
                Icons.skip_previous_rounded,
                size: 30,
                color: Colors.white,
              ),
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: _onClickedPlayButton,
                icon: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
            IconButton(
              onPressed: _skipForward,
              icon: const Icon(
                Icons.skip_next_rounded,
                size: 30,
                color: Colors.white,
              ),
            ),
            const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.timer_outlined,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
