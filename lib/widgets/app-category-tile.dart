import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app-style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppCategoryTile extends StatelessWidget {
  final String label;
  final String icon;
  final VoidCallback onTap;
  const AppCategoryTile({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Column(
            spacing: 6,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(icon),
              Text(
                label,
                style: AppTextStyles.sm.copyWith(color: AppColors.textPrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
