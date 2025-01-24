import 'package:flutter/material.dart';

class SectionTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Function() onItemClicked;
  const SectionTile({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.onItemClicked,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemClicked,
      child: Container(
        width: 150,
        height: 230,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                imageUrl,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
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
