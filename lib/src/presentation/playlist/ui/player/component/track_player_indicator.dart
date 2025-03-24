import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spookify_v2/src/application/state/cubit/player/player_cubit.dart';

class TrackPlayerIndicator extends StatefulWidget {
  final int durationMs;
  const TrackPlayerIndicator({super.key, required this.durationMs});

  @override
  State<TrackPlayerIndicator> createState() => _TrackPlayerIndicatorState();
}

class _TrackPlayerIndicatorState extends State<TrackPlayerIndicator>
    with SingleTickerProviderStateMixin {
  late PlayerCubit cubit;
  late Duration duration;
  final int skippedBySeconds = 10;
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    cubit = context.read<PlayerCubit>();
    duration = Duration(milliseconds: widget.durationMs);

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
          cubit.pauseMusic();
        }
      });

    super.initState();
  }

  void _onClickedPlayButton() {
    if (cubit.state.isPlaying) {
      cubit.pauseMusic();
      controller.stop();
    } else {
      cubit.playMusic();
      controller.forward();
    }
  }

  void _skipForward() {
    final newValue = controller.value + (skippedBySeconds / duration.inSeconds);
    final clampedValue = newValue.clamp(0.0, 1.0);
    controller.forward(from: clampedValue);
  }

  void _skipBackward() {
    final newValue = controller.value - (skippedBySeconds / duration.inSeconds);
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
    final duration =
        Duration(seconds: (animation.value * this.duration.inSeconds).toInt());
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
                      if (cubit.state.isPlaying) {
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
                  cubit.formatTimeDuration(
                    minutes: duration.inMinutes,
                    seconds: duration.inSeconds,
                  ),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  cubit.formatTimeDuration(
                    minutes: this.duration.inMinutes,
                    seconds: this.duration.inSeconds,
                  ),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: _skipBackward,
              icon: const Icon(
                Icons.replay_10,
                size: 30,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: cubit.state.hasNext
                  ? () {
                      controller.reset();
                      controller.forward();
                      cubit.onPrevTrack();
                    }
                  : null,
              icon: Icon(
                Icons.skip_previous_rounded,
                size: 30,
                color: cubit.state.hasNext ? Colors.white : Colors.grey,
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
                  cubit.state.isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
            IconButton(
              onPressed: cubit.state.hasNext
                  ? () {
                      controller.reset();
                      controller.forward();
                      cubit.onNextTrack();
                    }
                  : null,
              icon: Icon(
                Icons.skip_next_rounded,
                size: 30,
                color: cubit.state.hasNext ? Colors.white : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: _skipForward,
              icon: const Icon(
                Icons.forward_10,
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
