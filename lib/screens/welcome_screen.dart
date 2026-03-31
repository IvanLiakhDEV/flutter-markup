import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app_style.dart';
import 'package:flutter_markup/core/extensions.dart';
import 'package:flutter_markup/widgets/app_button.dart';
import '../widgets/app_logo.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 52),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 235 - context.paddingTop),
                AppLogo(size: 138, theme: 'light'),
                const SizedBox(height: 84),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.sm,
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
        ),
      ),
    );
  }
}
