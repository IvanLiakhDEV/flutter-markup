import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app_style.dart';
import 'package:flutter_markup/services/auth_service.dart';
import 'package:flutter_markup/widgets/app_appbar.dart';
import 'package:flutter_markup/widgets/app_circle_button.dart';
import 'package:flutter_markup/widgets/app_nav_item.dart';

class ProflieScreen extends StatefulWidget {
  const ProflieScreen({super.key});

  @override
  State<ProflieScreen> createState() => _ProflieScreenState();
}

class _ProflieScreenState extends State<ProflieScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  void signOut() async {
    try {
      await AuthService().signOut();
      if (mounted) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

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
                  AppNavItem(
                    icon: Icons.person,
                    text: 'Profile',
                    onPressed: () =>
                        Navigator.pushNamed(context, '/profile/update'),
                  ),
                  AppNavItem(icon: Icons.favorite_outline, text: 'Favorite'),
                  AppNavItem(
                    icon: Icons.account_balance_wallet_outlined,
                    text: 'Payment Method',
                  ),
                  AppNavItem(icon: Icons.lock_outlined, text: 'Privacy Policy'),
                  AppNavItem(
                    icon: Icons.settings_outlined,
                    text: 'Settings',
                    onPressed: () => Navigator.pushNamed(context, '/settings'),
                  ),
                  AppNavItem(icon: Icons.question_mark, text: 'Help'),
                  AppNavItem(
                    icon: Icons.logout,
                    text: 'Logout',
                    onPressed: signOut,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
