import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app_style.dart';
import 'package:flutter_markup/widgets/app_appbar.dart';
import 'package:flutter_markup/widgets/app_bottom_navbar.dart';
import 'package:flutter_markup/widgets/app_circle_button.dart';
import 'package:flutter_markup/widgets/app_icon_button.dart';

class ProflieScreen extends StatelessWidget {
  const ProflieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'My profile'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset('assets/images/doctor1.png', height: 106),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: AppCircleButton(
                      icon: Icons.edit_outlined,
                      textColor: Colors.white,
                      backgroundColor: AppColors.scaffoldBackground,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text('John Doe', style: AppTextStyles.lg),
              SizedBox(height: 40),
              Column(
                spacing: 16,
                children: [
                  _buildMenuItem(icon: Icons.person, text: 'Profile'),
                  _buildMenuItem(
                    icon: Icons.favorite_outline,
                    text: 'Favorite',
                  ),
                  _buildMenuItem(
                    icon: Icons.account_balance_wallet_outlined,
                    text: 'Payment Method',
                  ),
                  _buildMenuItem(
                    icon: Icons.lock_outlined,
                    text: 'Privacy Policy',
                  ),
                  _buildMenuItem(
                    icon: Icons.settings_outlined,
                    text: 'Settings',
                  ),
                  _buildMenuItem(icon: Icons.question_mark, text: 'Help'),
                  _buildMenuItem(icon: Icons.logout, text: 'Logout'),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomNavbar(currentIndex: 0, onTap: (_) => {}),
    );
  }
}

class _buildMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _buildMenuItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColors.surfaceBackground,
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.all(8),
            child: Icon(icon, size: 25, color: AppColors.scaffoldBackground),
          ),
        ),
        SizedBox(width: 21),
        Text(text, style: AppTextStyles.md),
        Spacer(),
        Icon(Icons.chevron_right, color: AppColors.surfaceBackground, size: 25),
      ],
    );
  }
}
