import 'package:flutter/material.dart';
import 'package:spookify_v2/core/navigation/providers/playlist/playlist.dart';

class PlayerContent extends StatefulWidget {
  final TrackDataProvider _track;
  const PlayerContent({super.key, required TrackDataProvider track})
      : _track = track;

  @override
  State<PlayerContent> createState() => _PlayerContentState();
}

class _PlayerContentState extends State<PlayerContent> {
  late bool _isFavorite;
  late bool _isPlaying;

  @override
  void initState() {
    _isFavorite = false;
    _isPlaying = false;
    super.initState();
  }

  void _onClickedFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  void _onClickedPlayButton() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
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
        SizedBox.square(
          dimension: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              widget._track.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget._track.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                widget._track.artist,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: _onClickedFavorite,
          icon: _isFavorite
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
        ),
      ],
    );
  }

  Widget _buildPlayerActions(BuildContext context) {
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
                  max: 100,
                  divisions: 5,
                  value: 50,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '1:43',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  '3:00',
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
            const IconButton(
              onPressed: null,
              icon: Icon(
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
                  _isPlaying ? Icons.play_arrow : Icons.pause,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
            const IconButton(
              onPressed: null,
              icon: Icon(
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
