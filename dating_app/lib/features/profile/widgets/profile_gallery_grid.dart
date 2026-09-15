import 'package:flutter/material.dart';

class ProfileGalleryGrid extends StatelessWidget {
  final List<String> images;

  const ProfileGalleryGrid({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        if (images.length >= 2)
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    images[0],
                    fit: BoxFit.cover,
                    height: 160,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    images[1],
                    fit: BoxFit.cover,
                    height: 160,
                  ),
                ),
              ),
            ],
          ),
        if (images.length > 2) ...[
          const SizedBox(height: 12),
          Row(
            children: images.sublist(2).map((img) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      img,
                      fit: BoxFit.cover,
                      height: 110,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ],
    );
  }
}
