import 'dart:async';
import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/routes/app_routes.dart';
import 'package:dating_app/core/widgets/app_button.dart';
import 'package:dating_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _otp = '';
  late Timer _timer;
  int _start = 60;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _start = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
      } else {
        if (mounted) {
          setState(() {
            _start--;
          });
        }
      }
    });
  }

  void _resendOtp() {
    _timer.cancel();
    _startTimer();
    Fluttertoast.showToast(msg: "Verification code resent");
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        showBackButton: true,
        showSkipButton: true,
        onSkip: () {
          Navigator.pushNamed(context, AppRoutes.profileDetails);
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Text(
              _start > 0
                  ? "00:${_start < 10 ? '0$_start' : _start}"
                  : "00:00",
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Type the verification code\nwe've sent you.",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textSecondary,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            PinCodeTextField(
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              appContext: context,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(16),
                fieldHeight: 64,
                fieldWidth: 48,
                activeFillColor: AppColors.primaryLight,
                inactiveFillColor: Colors.transparent,
                selectedFillColor: Colors.transparent,
                activeColor: AppColors.primary,
                inactiveColor: AppColors.border,
                selectedColor: AppColors.primary,
              ),
              cursorColor: AppColors.primary,
              animationDuration: const Duration(milliseconds: 200),
              backgroundColor: Colors.transparent,
              enableActiveFill: true,
              textStyle: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              onChanged: (value) {
                _otp = value;
              },
              onCompleted: (value) {
                Navigator.pushNamed(context, AppRoutes.profileDetails);
              },
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 60),
            AppButton(
              text: "Continue",
              onPressed: () {
                if (_otp.length == 6 || _otp.isEmpty) {
                  Navigator.pushNamed(context, AppRoutes.profileDetails);
                } else {
                  Fluttertoast.showToast(msg: "Please enter complete OTP");
                }
              },
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: _start == 0 ? _resendOtp : null,
              child: Text(
                "Send again",
                style: TextStyle(
                  color: _start == 0 ? AppColors.primary : AppColors.textMuted,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
