import 'package:dating_app/core/constants/app_assets.dart';
import 'package:dating_app/features/onboarding/widgets/onboarding_content_widget.dart';
import 'package:flutter/material.dart';

class OnboardingTwoScreen extends StatelessWidget {
  const OnboardingTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingContentWidget(
      imagePath: AppAssets.girl2,
      tag: "Meaningful Matches",
      tagIcon: Icons.favorite_rounded,
      title: "Match On What Matters",
      description: "Connect with people who share your passions, lifestyle, and values for deeper, lasting bonds.",
    );
  }
}
