import 'dart:io';
import 'package:dating_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ProfilePhotoPicker extends StatelessWidget {
  final File? image;
  final VoidCallback onPickImage;

  const ProfilePhotoPicker({
    super.key,
    required this.image,
    required this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(28),
            ),
            child: image == null
                ? const Center(
                    child: Text(
                      "Upload Profile\nPhoto",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: Image.file(
                      image!,
                      fit: BoxFit.cover,
                      width: 150,
                      height: 150,
                    ),
                  ),
          ),
          Positioned(
            bottom: -6,
            right: -6,
            child: GestureDetector(
              onTap: onPickImage,
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.shadow,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
