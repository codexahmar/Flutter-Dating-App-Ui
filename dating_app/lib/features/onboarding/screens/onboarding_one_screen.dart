import 'package:dating_app/core/constants/app_assets.dart';
import 'package:dating_app/features/onboarding/widgets/onboarding_content_widget.dart';
import 'package:flutter/material.dart';

class OnboardingOneScreen extends StatelessWidget {
  const OnboardingOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingContentWidget(
      imagePath: AppAssets.girl1,
      title: "Algorithm",
      description: "Users going through a vetting process\nto ensure you never match with bots.",
    );
  }
}
