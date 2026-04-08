import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app_style.dart';

class AppNavItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onPressed;

  const AppNavItem({
    super.key,
    required this.icon,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () {},
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.surfaceBackground,
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.all(8),
              child: Icon(icon, size: 25, color: AppColors.scaffoldBackground),
            ),
          ),
          SizedBox(width: 21),
          Text(text, style: AppTextStyles.md),
          Spacer(),
          Icon(
            Icons.chevron_right,
            color: AppColors.surfaceBackground,
            size: 25,
          ),
        ],
      ),
    );
  }
}
