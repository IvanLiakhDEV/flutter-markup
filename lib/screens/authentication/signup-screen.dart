import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app_style.dart';
import 'package:flutter_markup/services/auth_service.dart';
import 'package:flutter_markup/widgets/app_appbar.dart';
import 'package:flutter_markup/widgets/app_auth_footer.dart';
import 'package:flutter_markup/widgets/app_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerFullName = TextEditingController();

  bool isLoading = false;
  bool showError = false;
  String errorText = '';
  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerFullName.dispose();
    super.dispose();
  }

  void signUp() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() => isLoading = true);
    try {
      await AuthService().createUser(
        email: controllerEmail.text.trim(),
        password: controllerPassword.text.trim(),
        fullName: controllerFullName.text.trim(),
      );
      if (mounted) Navigator.pushReplacementNamed(context, '/login');
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
      appBar: AppBarWidget(title: 'New Account'),
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
                  spacing: 18,
                  children: [
                    AppInput(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Поле не може бути порожнім';
                        }
                        return null;
                      },
                      controller: controllerFullName,
                      placeholder: 'John Doe',
                      label: 'Full name',
                    ),
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
                      visibility: true,
                    ),
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
                      type: TextInputType.emailAddress,
                      label: 'Email',
                    ),
                    AppInput(
                      placeholder: '+1(XXX)XXX-XXXX',
                      type: TextInputType.phone,
                      label: 'Mobile Number',
                    ),
                    AppInput(
                      placeholder: 'DD / MM /YYY',
                      type: TextInputType.datetime,
                      label: 'Date of birth',
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
                    isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.scaffoldBackground,
                            ),
                          )
                        : AuthFooter(
                            bottomLinkText: 'already have an account?',
                            bottomTextSuffix: 'Log in',
                            buttonText: 'Sign Up',
                            onButtonPressed: signUp,
                            onBottomLinkPressed: () =>
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/login',
                                ),
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
