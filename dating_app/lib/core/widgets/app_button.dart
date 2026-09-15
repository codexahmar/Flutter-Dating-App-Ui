import 'package:dating_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color color;
  final TextStyle? textStyle;
  final double elevation;
  final double width;
  final double height;
  final VoidCallback? onPressed;
  final String? routeName;
  final Widget? destination;

  const AppButton({
    super.key,
    required this.text,
    this.color = AppColors.primary,
    this.textStyle,
    this.elevation = 0,
    this.width = double.infinity,
    this.height = 56,
    this.onPressed,
    this.routeName,
    this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width == double.infinity ? null : width,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          if (onPressed != null) {
            onPressed!();
          } else if (routeName != null) {
            Navigator.pushNamed(context, routeName!);
          } else if (destination != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destination!),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: color == AppColors.primary ? Colors.white : AppColors.primary,
          elevation: elevation,
          minimumSize: Size(width == double.infinity ? 295 : width, height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          text,
          style: textStyle ??
              TextStyle(
                color: color == AppColors.primary ? Colors.white : AppColors.primary,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
        ),
      ),
    );
  }
}
