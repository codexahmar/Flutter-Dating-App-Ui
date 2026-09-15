import 'package:dating_app/core/constants/app_assets.dart';
import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/routes/app_routes.dart';
import 'package:dating_app/core/widgets/app_button.dart';
import 'package:dating_app/core/widgets/social_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _handleEmailSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.emailAuth);
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
              const SizedBox(height: 50),
              Text(
                "Sign up to continue",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.3,
                ),
              ),
              const SizedBox(height: 32),
              AppButton(
                text: "Continue with email",
                onPressed: () => _handleEmailSignUp(context),
              ),
              const SizedBox(height: 16),
              AppButton(
                text: "Use phone number",
                isOutlined: true,
                borderColor: AppColors.primary,
                textStyle: GoogleFonts.plusJakartaSans(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.verification);
                },
              ),
              const SizedBox(height: 48),
              Row(
                children: [
                  const Expanded(
                    child: Divider(color: AppColors.divider, thickness: 1.5),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "or sign up with",
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Divider(color: AppColors.divider, thickness: 1.5),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Terms of use",
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Privacy Policy",
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
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
