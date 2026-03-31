import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app_style.dart';
import 'package:flutter_markup/core/enums.dart';
import 'package:flutter_markup/widgets/app_appbar.dart';
import 'package:flutter_markup/widgets/app_button.dart';
import 'package:flutter_markup/widgets/app_input.dart';

class PasswordManagerScreen extends StatelessWidget {
  const PasswordManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Password manager'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        spacing: 18,
                        children: [
                          const SizedBox(height: 18),
                          AppInput(
                            placeholder: '••••••••••••',
                            type: AppInputType.password,
                            label: 'Current Password',

                            showHelp: true,
                          ),
                          AppInput(
                            placeholder: '••••••••••••',
                            type: AppInputType.password,
                            label: 'New Password',
                          ),
                          AppInput(
                            placeholder: '••••••••••••',
                            type: AppInputType.password,
                            label: 'Confirm New Password',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: AppButton(
                      text: 'Change Password',
                      textColor: Colors.white,
                      onPressed: () {},
                      backgroundColor: AppColors.scaffoldBackground,
                    ),
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
