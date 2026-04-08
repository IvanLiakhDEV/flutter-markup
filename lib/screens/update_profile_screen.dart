import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app_style.dart';
import 'package:flutter_markup/core/enums.dart';
import 'package:flutter_markup/widgets/app_appbar.dart';
import 'package:flutter_markup/widgets/app_bottom_navbar.dart';
import 'package:flutter_markup/widgets/app_button.dart';
import 'package:flutter_markup/widgets/app_circle_button.dart';
import 'package:flutter_markup/widgets/app_input.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Profile',
        actions: [
          AppCircleButton(
            icon: Icons.settings,
            backgroundColor: AppColors.scaffoldBackground,
            textColor: Colors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30),
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
                spacing: 13,
                children: [
                  AppInput(
                    label: 'Full Name',
                    initialValue: 'John Doe',
                    placeholder: 'Full name',
                  ),
                  AppInput(
                    label: 'Phone number',
                    initialValue: '+123 567 89000',
                    placeholder: '+123 567 89000',
                    type: AppInputType.phone,
                  ),
                  AppInput(
                    label: 'Email',
                    initialValue: 'Johndoe@example.com',
                    placeholder: 'example@example.com',
                    type: AppInputType.email,
                  ),
                  AppInput(
                    label: 'Date of birth',
                    initialValue: 'DD / MM /YYY',
                    placeholder: 'DD / MM /YYY',
                    type: AppInputType.date,
                  ),
                  AppButton(
                    text: 'Update Profile',
                    backgroundColor: AppColors.scaffoldBackground,
                    textColor: Colors.white,
                    onPressed: () => Navigator.pop(context),
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
