import 'package:flutter/material.dart';
import 'package:spookify_v2/utils/constants/playlist_strings.dart';

class SearchAppBar extends StatelessWidget {
  final double maxAppBarHeight;
  const SearchAppBar({super.key, required this.maxAppBarHeight});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      foregroundColor: Colors.white,
      backgroundColor: Colors.transparent,
      elevation: 0,
      expandedHeight: maxAppBarHeight,
      pinned: true,
      snap: false,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          bool expandedAppbar = constraints.biggest.height > 150;
          return Container(
            decoration: BoxDecoration(
              gradient: !expandedAppbar
                  ? LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.green,
                        Theme.of(context).scaffoldBackgroundColor,
                      ],
                    )
                  : null,
            ),
            child: FlexibleSpaceBarSettings(
              hasLeading: false,
              isScrolledUnder: false,
              toolbarOpacity: 1,
              minExtent: 0,
              maxExtent: 100,
              currentExtent: 0,
              child: FlexibleSpaceBar(
                title: expandedAppbar
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            cursorColor: Colors.white,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              prefixIconColor: Colors.white,
                              hintText: PlaylistStrings.search,
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              filled: true,
                              fillColor: Colors.white24,
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            onSubmitted: (value) {},
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 40.0, left: 50.0),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: !expandedAppbar ? 1.0 : 0.0,
                          child: const Text(
                            PlaylistStrings.search,
                          ),
                        ),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
