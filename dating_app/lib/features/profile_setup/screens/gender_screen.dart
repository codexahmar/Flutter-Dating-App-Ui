import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/routes/app_routes.dart';
import 'package:dating_app/core/widgets/app_button.dart';
import 'package:dating_app/core/widgets/custom_app_bar.dart';
import 'package:dating_app/features/profile_setup/widgets/gender_option_tile.dart';
import 'package:flutter/material.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String _selectedGender = "Woman";
  bool _showDropdown = false;
  final List<String> _otherGenders = ["Transgender", "Bigender", "Non-binary", "Other"];

  void _selectGender(String gender) {
    setState(() {
      _selectedGender = gender;
      _showDropdown = false;
    });
  }

  void _toggleDropdown() {
    setState(() {
      _showDropdown = !_showDropdown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        showBackButton: true,
        showSkipButton: true,
        onSkip: () {
          Navigator.pushNamed(context, AppRoutes.passions);
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "I am a",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 60),
            GenderOptionTile(
              title: "Man",
              isSelected: _selectedGender == "Man",
              onTap: () => _selectGender("Man"),
            ),
            GenderOptionTile(
              title: "Woman",
              isSelected: _selectedGender == "Woman",
              onTap: () => _selectGender("Woman"),
            ),
            GenderOptionTile(
              title: _otherGenders.contains(_selectedGender) ? _selectedGender : "Choose Another",
              isSelected: _otherGenders.contains(_selectedGender),
              isDropdownTrigger: true,
              onTap: _toggleDropdown,
            ),
            if (_showDropdown)
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: _otherGenders.map((gender) {
                    final isOptionSelected = _selectedGender == gender;
                    return ListTile(
                      title: Text(
                        gender,
                        style: TextStyle(
                          color: isOptionSelected ? AppColors.primary : AppColors.textPrimary,
                          fontWeight: isOptionSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      trailing: isOptionSelected
                          ? const Icon(Icons.check, color: AppColors.primary)
                          : null,
                      onTap: () => _selectGender(gender),
                    );
                  }).toList(),
                ),
              ),
            const SizedBox(height: 60),
            AppButton(
              text: "Continue",
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.passions);
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
