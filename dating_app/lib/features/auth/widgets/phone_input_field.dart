import 'package:country_code_picker/country_code_picker.dart';
import 'package:dating_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class PhoneInputField extends StatelessWidget {
  final TextEditingController controller;
  final String initialCountryCode;
  final ValueChanged<String> onCountryChanged;

  const PhoneInputField({
    super.key,
    required this.controller,
    required this.initialCountryCode,
    required this.onCountryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border, width: 1.2),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Positioned.fill(
                  child: CountryCodePicker(
                    onChanged: (country) {
                      if (country.dialCode != null) {
                        onCountryChanged(country.dialCode!);
                      }
                    },
                    initialSelection: 'PK',
                    favorite: const ['PK', 'US', 'GB'],
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: true,
                    showFlag: true,
                    showFlagMain: true,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    searchDecoration: InputDecoration(
                      hintText: 'Search for a country',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    searchStyle: const TextStyle(color: AppColors.textPrimary),
                  ),
                ),
                const Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          const VerticalDivider(
            color: AppColors.divider,
            thickness: 1.2,
            width: 1.2,
            indent: 8,
            endIndent: 8,
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 3,
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: AppColors.textPrimary),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '331 623 8141',
                hintStyle: const TextStyle(color: AppColors.textMuted),
                prefixText: '$initialCountryCode ',
                prefixStyle: const TextStyle(
                  fontSize: 16,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
