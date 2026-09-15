import 'package:dating_app/controllers/nav_bar_controller.dart';
import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final navBarController = Provider.of<BottomNavBarController>(context);

    return BottomNavigationBar(
      backgroundColor: AppColors.background,
      currentIndex: navBarController.currentIndex,
      onTap: (index) {
        if (navBarController.currentIndex == index) return;
        navBarController.setIndex(index);
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, AppRoutes.explore);
            break;
          case 1:
            Navigator.pushReplacementNamed(context, AppRoutes.matches);
            break;
          case 2:
            Navigator.pushReplacementNamed(context, AppRoutes.chats);
            break;
          case 3:
            Navigator.pushReplacementNamed(context, AppRoutes.profile);
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.style_outlined),
          activeIcon: Icon(Icons.style),
          label: 'Cards',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          activeIcon: Icon(Icons.favorite),
          label: 'Matches',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          activeIcon: Icon(Icons.chat_bubble),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.iconInactive,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    );
  }
}
