import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app_style.dart';
import 'package:flutter_markup/widgets/app_icon_button.dart';
import 'package:flutter_markup/widgets/app_category_tile.dart';
import 'package:flutter_markup/widgets/doctor_card.dart';
import 'package:flutter_markup/widgets/schedule/app_schedule.dart';
import 'package:flutter_markup/widgets/app_searchbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 14,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                      backgroundColor: Colors.grey[200],
                    ),
                    const SizedBox(width: 10),
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
              ),

              const SizedBox(height: 23),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppCategoryTile(
                      label: 'Doctors',
                      icon: 'assets/images/stethoscope.svg',
                      onTap: () {},
                    ),
                    const SizedBox(width: 11),
                    AppCategoryTile(
                      label: 'Favorite',
                      icon: 'assets/images/heart.svg',
                      onTap: () {},
                    ),
                    const SizedBox(width: 12),
                    const Expanded(child: AppSearchbar()),
                  ],
                ),
              ),

              const SizedBox(height: 23),
              const AppSchedule(),
              const SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  spacing: 8,
                  children: [
                    const DoctorsCard(
                      doctorsName: 'Dr. Olivia Turner, M.D.',
                      specialty: 'Dermato-Endocrinology',
                      img: 'doctor4',
                      rating: 5,
                      reviews: 60,
                    ),
                    const DoctorsCard(
                      doctorsName: 'Dr. Alexander Bennett, Ph.D.',
                      specialty: 'Dermato-Genetics',
                      rating: 4,
                      reviews: 40,
                    ),
                    const DoctorsCard(
                      doctorsName: 'Dr. Sophia Martinez, Ph.D.',
                      specialty: 'Cosmetic Bioengineering',
                      rating: 5,
                      reviews: 150,
                      img: 'doctor2',
                    ),
                    const DoctorsCard(
                      doctorsName: 'Dr. Michael Davidson, M.D.',
                      specialty: 'Nano-Dermatology',
                      rating: 4,
                      reviews: 90,
                      img: 'doctor3',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
