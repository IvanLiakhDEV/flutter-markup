import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app-style.dart';
import 'package:flutter_markup/widgets/app-button.dart';
import '../widgets/app-logo.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 235),
            AppLogo(size: 138, theme: 'light'),
            const SizedBox(height: 84),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                textAlign: TextAlign.center,
                style: AppTextStyles.sm,
              ),
            ),
            const SizedBox(height: 34),
            AppButton(
              text: 'Log in',
              backgroundColor: AppColors.scaffoldBackground,
              textColor: Colors.white,
              onPressed: () => print('Log in'),
            ),
            const SizedBox(height: 7),
            AppButton(
              text: 'Sign Up',
              backgroundColor: AppColors.surfaceBackground,
              textColor: AppColors.textPrimary,
              onPressed: () => print('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
