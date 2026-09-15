import 'package:dating_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class GenderOptionTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final bool isDropdownTrigger;
  final VoidCallback onTap;

  const GenderOptionTile({
    super.key,
    required this.title,
    required this.isSelected,
    this.isDropdownTrigger = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryLight : AppColors.background,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: isSelected ? AppColors.primary : AppColors.textPrimary,
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
            if (isSelected && !isDropdownTrigger)
              const Icon(
                Icons.check_circle_rounded,
                color: AppColors.primary,
                size: 22,
              )
            else if (isDropdownTrigger)
              const Icon(
                Icons.arrow_drop_down,
                color: AppColors.textMuted,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}
