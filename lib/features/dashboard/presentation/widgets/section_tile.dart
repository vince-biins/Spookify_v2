import 'package:flutter/material.dart';

class SectionTile extends StatelessWidget {
  const SectionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              'https://t.scdn.co/images/728ed47fc1674feb95f7ac20236eb6d7.jpeg',
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
              'Dionela, Denise Julia, mrld, DEMI, Kristine Dawn',
              style: Theme.of(context).textTheme.labelSmall,
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
