import 'package:flutter/material.dart';

import 'package:spookify_v2/core/theme/app_colors.dart';

import 'package:spookify_v2/features/playlist/domain/model/track.dart';

class SongItemTile extends StatefulWidget {
  final Track track;
  void Function()? onClickTrack;
  VoidCallback onFavoritClicked;

  SongItemTile({
    super.key,
    required this.track,
    required this.onClickTrack,
    required this.onFavoritClicked,
  });

  @override
  State<SongItemTile> createState() => _SongItemTileState();
}

class _SongItemTileState extends State<SongItemTile> {
  late bool isFavorite;

  @override
  void initState() {
    isFavorite = widget.track.isFavorite;
    super.initState();
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
            widget.track.imageUrl != null
                ? SizedBox.square(
                    dimension: 50,
                    child: Image.network(
                      widget.track.imageUrl!,
                      fit: BoxFit.cover,
                    ),
                  )
                : widget.track.trackNumber != null
                    ? SizedBox.square(
                        dimension: 50,
                        child: Center(
                          child: Text(
                            widget.track.trackNumber.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.grey),
                          ),
                        ),
                      )
                    : const SizedBox(),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.track.trackName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    widget.track.artistName ?? '',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                widget.onFavoritClicked();
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: isFavorite
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
