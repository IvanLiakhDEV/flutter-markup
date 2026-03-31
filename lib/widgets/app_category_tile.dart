import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app_style.dart';
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
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: 45,
        width: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 20,
              child: SvgPicture.asset(icon, fit: BoxFit.contain, height: 20),
            ),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.sm.copyWith(color: AppColors.textPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
