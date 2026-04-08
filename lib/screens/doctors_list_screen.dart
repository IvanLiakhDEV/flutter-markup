import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app_style.dart';
import 'package:flutter_markup/widgets/app_appbar.dart';
import 'package:flutter_markup/widgets/app_bottom_navbar.dart';
import 'package:flutter_markup/widgets/app_circle_button.dart';

class DoctorsListScreen extends StatefulWidget {
  const DoctorsListScreen({super.key});

  @override
  State<DoctorsListScreen> createState() => _DoctorsListScreen();
}

class _DoctorsListScreen extends State<DoctorsListScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Doctors',
        actions: [
          AppCircleButton(
            icon: Icons.search,
            backgroundColor: AppColors.surfaceBackground,
          ),
          AppCircleButton(
            icon: Icons.tune,
            backgroundColor: AppColors.surfaceBackground,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 23),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Text('Sort by'),
                    AppCircleButton(
                      backgroundColor: AppColors.scaffoldBackground,
                      customChild: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'A',
                            style: AppTextStyles.sm.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 14,
                            color: Colors.white,
                          ),
                          Text(
                            'Z',
                            style: AppTextStyles.sm.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppCircleButton(
                      icon: Icons.star_outline,
                      backgroundColor: AppColors.surfaceBackground,
                    ),
                    AppCircleButton(
                      icon: Icons.favorite_outline,
                      backgroundColor: AppColors.surfaceBackground,
                    ),
                    AppCircleButton(
                      icon: Icons.female,
                      backgroundColor: AppColors.surfaceBackground,
                    ),
                    AppCircleButton(
                      icon: Icons.male,
                      backgroundColor: AppColors.surfaceBackground,
                    ),
                  ],
                ),
                SizedBox(height: 13),
                Column(
                  spacing: 15,
                  children: [
                    _buildDoctorsCard(
                      doctorsName: 'Dr. Alexander Bennett, Ph.D.',
                      specialty: 'Dermato-Genetics',
                      imgPath: 'assets/images/doctor1.png',
                    ),
                    _buildDoctorsCard(
                      doctorsName: 'Dr. Michael Davidson, M.D.',
                      specialty: 'Solar Dermatology',
                      imgPath: 'assets/images/doctor3.png',
                    ),
                    _buildDoctorsCard(
                      doctorsName: 'Dr. Olivia Turner, M.D.',
                      specialty: 'Dermato-Endocrinology',
                      imgPath: 'assets/images/doctor4.png',
                    ),
                    _buildDoctorsCard(
                      doctorsName: 'Dr. Sophia Martinez, Ph.D.',
                      specialty: 'Cosmetic Bioengineering',
                      imgPath: 'assets/images/doctor2.png',
                    ),
                    _buildDoctorsCard(
                      doctorsName: 'Dr. Alexander Bennett, Ph.D.',
                      specialty: 'Dermato-Genetics',
                      imgPath: 'assets/images/doctor1.png',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _buildDoctorsCard extends StatelessWidget {
  final String doctorsName;
  final String specialty;
  final String imgPath;

  const _buildDoctorsCard({
    required this.doctorsName,
    required this.specialty,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 130),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceBackground,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 20, 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(child: Image.asset(imgPath, width: 107, height: 107)),
              const SizedBox(width: 9),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctorsName,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                            height: 1.2,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          specialty,
                          style: TextStyle(
                            color: Colors.black,
                            height: 1.1,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        AppCircleButton(
                          text: 'Info',
                          backgroundColor: AppColors.scaffoldBackground,
                          textColor: Colors.white,
                        ),
                        const Spacer(),
                        Row(
                          spacing: 4,
                          children: [
                            AppCircleButton(
                              icon: Icons.calendar_month,
                              backgroundColor: Colors.white,
                            ),
                            AppCircleButton(
                              icon: Icons.info_outline_rounded,
                              backgroundColor: Colors.white,
                            ),
                            AppCircleButton(
                              icon: Icons.help_outline,
                              backgroundColor: Colors.white,
                            ),
                            AppCircleButton(
                              icon: Icons.favorite_outline,
                              backgroundColor: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
