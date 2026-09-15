import 'package:dating_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ActivityStoryAvatar extends StatelessWidget {
  final String name;
  final String imagePath;
  final bool isNew;
  final VoidCallback? onTap;

  const ActivityStoryAvatar({
    super.key,
    required this.name,
    required this.imagePath,
    required this.isNew,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(2.5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: isNew
                    ? const LinearGradient(
                        colors: [AppColors.primary, Colors.purpleAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
                border: isNew ? null : Border.all(color: AppColors.border, width: 1.5),
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.cardBackground,
                backgroundImage: AssetImage(imagePath),
              ),
            ),
            const SizedBox(height: 6),
            SizedBox(
              width: 66,
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
