import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app_style.dart';
import 'package:flutter_markup/widgets/app_circle_button.dart';

class DoctorsCard extends StatelessWidget {
  final String img;
  final String doctorsName;
  final String specialty;
  final double rating;
  final bool isFavorite;
  final int reviews;

  const DoctorsCard({
    super.key,
    this.img = 'doctor1',
    required this.doctorsName,
    required this.specialty,
    required this.rating,
    required this.reviews,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceBackground,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              'assets/images/$img.png',
              width: 76,
              height: 76,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctorsName,
                        style: AppTextStyles.sm.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        specialty,
                        style: AppTextStyles.xsm.copyWith(
                          color: Colors.black,
                          height: 1.1,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    AppCircleButton(icon: Icons.star, text: rating.toString()),
                    const SizedBox(width: 8),
                    AppCircleButton(
                      icon: Icons.comment,
                      text: reviews.toString(),
                    ),
                    const Spacer(),
                    AppCircleButton(icon: Icons.question_mark),
                    const SizedBox(width: 8),
                    AppCircleButton(
                      icon: isFavorite
                          ? Icons.favorite
                          : Icons.favorite_outline,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
