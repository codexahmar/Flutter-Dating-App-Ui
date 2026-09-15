import 'package:dating_app/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

class SwipeActionButtons extends StatelessWidget {
  final VoidCallback onDislike;
  final VoidCallback onLike;
  final VoidCallback onStar;

  const SwipeActionButtons({
    super.key,
    required this.onDislike,
    required this.onLike,
    required this.onStar,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Image.asset(
              AppAssets.dislike,
              width: 68,
              height: 68,
            ),
            onPressed: onDislike,
          ),
          IconButton(
            icon: Image.asset(
              AppAssets.like,
              width: 78,
              height: 78,
            ),
            onPressed: onLike,
          ),
          IconButton(
            icon: Image.asset(
              AppAssets.star,
              width: 68,
              height: 68,
            ),
            onPressed: onStar,
          ),
        ],
      ),
    );
  }
}
