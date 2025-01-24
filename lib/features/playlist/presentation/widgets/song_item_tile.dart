import 'package:flutter/material.dart';

import 'package:spookify_v2/core/theme/app_colors.dart';

import 'package:spookify_v2/features/playlist/domain/model/track.dart';

class SongItemTile extends StatefulWidget {
  final Track track;
  void Function()? onClickTrack;

  SongItemTile({
    super.key,
    required this.track,
    required this.onClickTrack,
  });

  @override
  State<SongItemTile> createState() => _SongItemTileState();
}

class _SongItemTileState extends State<SongItemTile> {
  late bool _isFavorite;
  late Track _track;
  late final bool _isImageAvailable;

  @override
  void initState() {
    super.initState();
    _isFavorite = false;
    _track = widget.track;
    _isImageAvailable = widget.track.imageUrl != null;
  }

  void _onClickedFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClickTrack,
      child: Container(
        color: AppColors.background,
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _isImageAvailable
                ? SizedBox.square(
                    dimension: 50,
                    child: Image.network(
                      _track.imageUrl!,
                      fit: BoxFit.cover,
                    ),
                  )
                : SizedBox.square(
                    dimension: 50,
                    child: Center(
                      child: Text(
                        _track.trackNumber.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.grey),
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
                    _track.trackName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    _track.artistName ?? '',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
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
                    )
                  : const Icon(
                      Icons.favorite_border,
                      color: Colors.grey,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
