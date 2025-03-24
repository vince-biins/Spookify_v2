import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spookify_v2/utils/constants/destinations.dart';
import 'package:spookify_v2/src/presentation/theme/app_colors.dart';

class BottomPlayer extends StatefulWidget {
  const BottomPlayer({super.key});

  @override
  State<BottomPlayer> createState() => _BottomPlayerState();
}

class _BottomPlayerState extends State<BottomPlayer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final result = await GoRouter.of(context).push(
          TrackDestination.player.pathUrl,
          extra: '4tJfQyjaxVOB7NxhMf2a8p',
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          color: AppColors.onSecondary,
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: Image.asset(
                'assets/images/error.png',
                width: 50,
              ),
            ),
            const SizedBox(
              width: 12.0,
            ),
            Expanded(
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'WESTSIDE',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                    ),
                    Text(
                      'Keshi',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 36.0,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
