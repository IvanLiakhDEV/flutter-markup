import 'package:flutter/material.dart';
import 'package:flutter_markup/core/enums.dart';
import 'package:flutter_markup/widgets/app_appbar.dart';
import 'package:flutter_markup/widgets/app_auth_footer.dart';
import 'package:flutter_markup/widgets/app_input.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'New Account'),
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
                  AppInput(placeholder: 'John Doe', label: 'Full name'),
                  Column(
                    children: [
                      AppInput(
                        placeholder: '••••••••••••',
                        type: AppInputType.password,
                        label: 'Password ',
                        visibility: true,
                      ),
                      AppInput(
                        placeholder: 'example@example.com',
                        type: AppInputType.email,
                        label: 'Email',
                      ),
                    ],
                  ),
                  AppInput(
                    placeholder: '+1(XXX)XXX-XXXX',
                    type: AppInputType.phone,
                    label: 'Mobile Number',
                  ),
                  AppInput(
                    placeholder: 'DD / MM /YYY',
                    type: AppInputType.date,
                    label: 'Date of birth',
                  ),

                  AuthFooter(
                    bottomLinkText: 'already have an account?',
                    bottomTextSuffix: 'Log in',
                    buttonText: 'Sign Up',
                    onButtonPressed: () {
                      print('Sign Up');
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
