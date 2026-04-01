import 'package:flutter/material.dart';
import 'package:flutter_markup/widgets/app_appbar.dart';
import 'package:flutter_markup/widgets/app_bottom_navbar.dart';
import 'package:flutter_markup/widgets/app_nav_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Settings'),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 17),
        child: Column(
          spacing: 16,
          children: [
            AppNavItem(
              icon: Icons.lightbulb_outline,
              text: 'Notification setting',
              onPressed: () =>
                  Navigator.pushNamed(context, '/settings/notifications'),
            ),
            AppNavItem(
              icon: Icons.key_outlined,
              text: 'Password manager',
              onPressed: () =>
                  Navigator.pushNamed(context, '/settings/password-manager'),
            ),
            AppNavItem(icon: Icons.person_outline, text: 'Delete account'),
          ],
        ),
      ),
    );
  }
}
