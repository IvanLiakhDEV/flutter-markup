import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app_style.dart';

class AppDayTile extends StatelessWidget {
  final String day;
  final String weekday;
  final VoidCallback onTap;
  final bool isSelected;
  const AppDayTile({
    super.key,
    required this.day,
    required this.weekday,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: 42,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.scaffoldBackground : Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text(
              day,
              style: AppTextStyles.lg.copyWith(
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            Text(
              weekday,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.xsm.copyWith(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
