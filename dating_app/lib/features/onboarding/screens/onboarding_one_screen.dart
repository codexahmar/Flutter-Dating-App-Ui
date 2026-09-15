import 'package:dating_app/core/constants/app_assets.dart';
import 'package:dating_app/features/onboarding/widgets/onboarding_content_widget.dart';
import 'package:flutter/material.dart';

class OnboardingOneScreen extends StatelessWidget {
  const OnboardingOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingContentWidget(
      imagePath: AppAssets.girl1,
      tag: "Verified Profiles",
      tagIcon: Icons.verified_rounded,
      title: "Discover Real Connections",
      description: "Explore authentic profiles verified to ensure you meet genuine people who share your vibe and values.",
    );
  }
}
