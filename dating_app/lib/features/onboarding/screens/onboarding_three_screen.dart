import 'package:dating_app/core/constants/app_assets.dart';
import 'package:dating_app/features/onboarding/widgets/onboarding_content_widget.dart';
import 'package:flutter/material.dart';

class OnboardingThreeScreen extends StatelessWidget {
  const OnboardingThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingContentWidget(
      imagePath: AppAssets.girl3,
      tag: "VIP Perks",
      tagIcon: Icons.workspace_premium_rounded,
      title: "Premium Experience",
      description: "Sign up today and unlock unlimited likes, instant matches, and spotlight perks on us.",
    );
  }
}
