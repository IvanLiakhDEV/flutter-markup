import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app-style.dart';
import 'package:flutter_markup/widgets/app-iconbutton.dart';
import 'package:flutter_markup/widgets/app-category-tile.dart';
import 'package:flutter_markup/widgets/app_searchbar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                        backgroundColor: Colors.grey[200],
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, WelcomeBack',
                            style: AppTextStyles.xsm.copyWith(
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Text('John Doe', style: AppTextStyles.sm),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          AppIconButton(icon: 'notification', size: 24),
                          AppIconButton(icon: 'settings', size: 24),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 23),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppCategoryTile(
                        label: 'Doctors',
                        icon: 'assets/images/stethoscope.svg',
                        onTap: () => {},
                      ),
                      SizedBox(width: 11),
                      AppCategoryTile(
                        label: 'Favorite',
                        icon: 'assets/images/heart.svg',
                        onTap: () => {},
                      ),
                      SizedBox(width: 12),
                      Expanded(child: AppSearchbar()),
                    ],
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
