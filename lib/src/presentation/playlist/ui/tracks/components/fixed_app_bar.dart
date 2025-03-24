import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FixedAppBar extends StatelessWidget {
  final double titleOpacity;
  final bool showFixedAppBar;
  final String title;
  final Color bgColor;
  const FixedAppBar({
    super.key,
    required this.titleOpacity,
    required this.showFixedAppBar,
    required this.title,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        gradient: showFixedAppBar
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  bgColor,
                  Colors.black,
                ],
              )
            : null,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 10,
          left: 10,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: AppBar().preferredSize.height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            textBaseline: TextBaseline.ideographic,
            children: [
              IconButton(
                onPressed: () {
                  if (Navigator.of(context).canPop()) {
                    GoRouter.of(context).pop<bool>(true);
                  }
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 20),
              AnimatedOpacity(
                opacity: titleOpacity.clamp(0, 1),
                duration: const Duration(milliseconds: 100),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
