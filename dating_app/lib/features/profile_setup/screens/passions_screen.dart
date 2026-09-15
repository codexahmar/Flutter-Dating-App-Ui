import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/routes/app_routes.dart';
import 'package:dating_app/core/widgets/app_button.dart';
import 'package:dating_app/core/widgets/custom_app_bar.dart';
import 'package:dating_app/features/profile_setup/widgets/interest_grid_item.dart';
import 'package:flutter/material.dart';

class PassionsScreen extends StatefulWidget {
  const PassionsScreen({super.key});

  @override
  State<PassionsScreen> createState() => _PassionsScreenState();
}

class _PassionsScreenState extends State<PassionsScreen> {
  final List<Map<String, dynamic>> interests = const [
    {"name": "Travel", "icon": Icons.flight},
    {"name": "Music", "icon": Icons.music_note},
    {"name": "Sports", "icon": Icons.sports_basketball},
    {"name": "Cooking", "icon": Icons.restaurant},
    {"name": "Reading", "icon": Icons.menu_book},
    {"name": "Art", "icon": Icons.brush},
    {"name": "Gaming", "icon": Icons.videogame_asset},
    {"name": "Fitness", "icon": Icons.fitness_center},
    {"name": "Movies", "icon": Icons.movie},
    {"name": "Photography", "icon": Icons.camera_alt},
    {"name": "Technology", "icon": Icons.computer},
    {"name": "Writing", "icon": Icons.edit},
    {"name": "Fashion", "icon": Icons.style},
    {"name": "Swimming", "icon": Icons.pool},
  ];

  final Set<String> _selectedInterests = {"Travel", "Music", "Art"};

  void _toggleSelection(String interest) {
    setState(() {
      if (_selectedInterests.contains(interest)) {
        _selectedInterests.remove(interest);
      } else {
        _selectedInterests.add(interest);
      }
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
          Navigator.pushNamed(context, AppRoutes.friends);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your interests",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Select a few of your interests and let everyone know what you're passionate about.",
              style: TextStyle(
                fontSize: 15,
                color: AppColors.textSecondary,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 28),
            Expanded(
              child: GridView.builder(
                itemCount: interests.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2.8,
                ),
                itemBuilder: (context, index) {
                  final interest = interests[index];
                  final name = interest["name"] as String;
                  final icon = interest["icon"] as IconData;
                  final isSelected = _selectedInterests.contains(name);

                  return InterestGridItem(
                    name: name,
                    icon: icon,
                    isSelected: isSelected,
                    onTap: () => _toggleSelection(name),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: AppButton(
                text: "Continue",
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.friends);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
