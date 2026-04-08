import 'package:flutter/material.dart';
import 'package:flutter_markup/core/enums.dart';
import 'package:flutter_markup/widgets/app_appbar.dart';
import 'package:flutter_markup/widgets/app_auth_footer.dart';
import 'package:flutter_markup/widgets/app_input.dart';

class SetPasswordScreen extends StatelessWidget {
  const SetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Set password'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                spacing: 18,
                children: [
                  AppInput(
                    placeholder: '••••••••••••',
                    type: AppInputType.password,
                    label: 'Password ',
                  ),
                  AppInput(
                    placeholder: '••••••••••••',
                    type: AppInputType.password,
                    label: 'Confirm Password',
                  ),
                  AuthFooter(
                    bottomLinkText: '',
                    bottomTextSuffix: '',
                    buttonText: 'Create new password',
                    showSocialIcons: false,
                    onButtonPressed: () {},
                    onBottomLinkPressed: () {},
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
