import 'package:dating_app/core/constants/app_assets.dart';
import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/routes/app_routes.dart';
import 'package:dating_app/core/widgets/app_button.dart';
import 'package:dating_app/core/widgets/social_auth_button.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _handleEmailSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.verification);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Center(
                child: Image.asset(
                  AppAssets.logo,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 60),
              const Text(
                "Sign up to continue",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 32),
              AppButton(
                text: "Continue with email",
                color: AppColors.primary,
                onPressed: () => _handleEmailSignUp(context),
              ),
              const SizedBox(height: 16),
              AppButton(
                text: "Use phone number",
                color: Colors.white,
                elevation: 2,
                textStyle: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.verification);
                },
              ),
              const SizedBox(height: 48),
              const Row(
                children: [
                  Expanded(
                    child: Divider(color: AppColors.divider, thickness: 1),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "or sign up with",
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: AppColors.divider, thickness: 1),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialAuthButton(
                    icon: Icons.facebook,
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.profileDetails);
                    },
                  ),
                  const SizedBox(width: 20),
                  SocialAuthButton(
                    icon: Icons.apple,
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.profileDetails);
                    },
                  ),
                  const SizedBox(width: 20),
                  SocialAuthButton(
                    icon: Icons.send_rounded,
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.profileDetails);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 48),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Terms of use",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Privacy Policy",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
