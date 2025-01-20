import 'package:flutter/material.dart';
import 'package:spookify_v2/core/theme/app_colors.dart';

class SongItemTile extends StatefulWidget {
  final String title;
  final String artist;
  const SongItemTile({super.key, required this.title, required this.artist});

  @override
  State<SongItemTile> createState() => _SongItemTileState();
}

class _SongItemTileState extends State<SongItemTile> {
  late bool _isFavorite;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isFavorite = false;
  }

  void _onClickedFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox.square(
            dimension: 50,
            child: Image.network(
              'https://t.scdn.co/images/728ed47fc1674feb95f7ac20236eb6d7.jpeg',
              fit: BoxFit.cover,
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
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  widget.artist,
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
                ? Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                  ),
          ),
        ],
      ),
    );
  }
}
