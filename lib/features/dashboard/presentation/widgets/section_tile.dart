import 'package:flutter/material.dart';

class SectionTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Function() onItemClicked;
  final double imageSize;
  const SectionTile({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.onItemClicked,
    this.imageSize = 150.0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onItemClicked,
      customBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Ink(
        width: 150,
        height: 230,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Ink(
              height: imageSize,
              width: imageSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(
                    imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelSmall,
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
