import 'package:flutter/material.dart';

class StickyPlayButton extends StatefulWidget {
  const StickyPlayButton({
    super.key,
    required this.scrollController,
    required this.maxAppBarHeight,
    required this.minAppBarHeight,
    required this.playPauseButtonSize,
    required this.infoBoxHeight,
  });

  final ScrollController scrollController;
  final double maxAppBarHeight;
  final double minAppBarHeight;
  final double playPauseButtonSize;
  final double infoBoxHeight;

  @override
  State<StickyPlayButton> createState() => _StickyPlayButtonState();
}

class _StickyPlayButtonState extends State<StickyPlayButton> {
  @override
  void initState() {
    super.initState();

    widget.scrollController.addListener(() {
      setState(() {});
    });
  }

  double get getPositionFromTop {
    double position = widget.maxAppBarHeight;
    double finalPosition =
        widget.minAppBarHeight - widget.playPauseButtonSize / 2;

    if (widget.scrollController.hasClients) {
      double offset = widget.scrollController.offset;

      double addOrSubtractValue =
          widget.infoBoxHeight - widget.playPauseButtonSize - 10;
      final bool isFinalPosition =
          offset > (position - finalPosition + addOrSubtractValue);
      if (!isFinalPosition) {
        position = position - offset + addOrSubtractValue + 15;
      } else {
        position = finalPosition - 20;
      }
    }
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: getPositionFromTop,
      right: 10,
      child: ElevatedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          fixedSize:
              Size(widget.playPauseButtonSize, widget.playPauseButtonSize),
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
        ),
        onPressed: () {},
        child: const Icon(
          Icons.play_arrow,
          color: Colors.black,
        ),
      ),
    );
  }
}
