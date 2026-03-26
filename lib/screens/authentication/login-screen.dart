import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app-style.dart';
import 'package:flutter_markup/core/enums.dart';
import 'package:flutter_markup/widgets/app-appbar.dart';
import 'package:flutter_markup/widgets/app-auth-footer.dart';
import 'package:flutter_markup/widgets/app-input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Log in'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Welcome',
                    style: AppTextStyles.lg.copyWith(
                      color: AppColors.textPrimary,
                      height: 1,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                    style: AppTextStyles.xsm.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 47),
                  AppInput(
                    placeholder: 'example@example.com',
                    type: AppInputType.text,
                    label: 'Email or Mobile Number',
                  ),
                  SizedBox(height: 20),
                  AppInput(
                    placeholder: '••••••••••••',
                    type: AppInputType.password,
                    label: 'Password ',
                  ),
                  SizedBox(height: 55),
                  AuthFooter(
                    bottomLinkText: 'Don’t have an account?',
                    bottomTextSuffix: 'Sign Up',
                    buttonText: 'Log In',
                    onButtonPressed: () {
                      print('Log In');
                    },
                    onBottomLinkPressed: () {
                      print('Bottom link');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
