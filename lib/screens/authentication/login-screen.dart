import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app_style.dart';
import 'package:flutter_markup/services/auth_service.dart';
import 'package:flutter_markup/widgets/app_appbar.dart';
import 'package:flutter_markup/widgets/app_auth_footer.dart';
import 'package:flutter_markup/widgets/app_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  bool isLoading = false;
  bool showError = false;
  String errorText = '';

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  void login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() => isLoading = true);
    try {
      await AuthService().signIn(
        email: controllerEmail.text.trim(),
        password: controllerPassword.text.trim(),
      );
      if (mounted) Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      setState(() {
        setState(() {
          showError = true;
          errorText = e.message!;
        });
      });
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Log in'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Заповніть поле';
                        } else if (!value.contains('@')) {
                          return 'Некоректний Email';
                        }
                      },
                      controller: controllerEmail,
                      placeholder: 'example@example.com',

                      label: 'Email or Mobile Number',
                    ),
                    SizedBox(height: 20),
                    AppInput(
                      controller: controllerPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Заповніть поле';
                        } else if (value.length < 8) {
                          return 'Мінімальна кількість символів 8';
                        }
                        return null;
                      },
                      placeholder: '••••••••••••',
                      type: TextInputType.visiblePassword,
                      label: 'Password ',
                      showHelp: true,
                      onHelpPress: () => Navigator.pushReplacementNamed(
                        context,
                        '/set-password',
                      ),
                    ),
                    Visibility(
                      visible: showError,
                      child: Column(
                        children: [
                          SizedBox(height: 8),
                          Text(
                            errorText,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                    SizedBox(height: 55),
                    AuthFooter(
                      bottomLinkText: 'Don’t have an account?',
                      bottomTextSuffix: 'Sign Up',
                      buttonText: 'Log In',
                      onButtonPressed: login,
                      onBottomLinkPressed: () =>
                          Navigator.pushReplacementNamed(context, '/signup'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
