import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final double width;
  final String imageSrc;
  final String title;
  const CategoryTile({
    super.key,
    required this.width,
    required this.imageSrc,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              height: 60,
              width: 60,
              imageSrc,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
