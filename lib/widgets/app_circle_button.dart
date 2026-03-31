import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app_style.dart';

class AppCircleButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Widget? customChild;

  const AppCircleButton({
    super.key,
    this.icon,
    this.text = '',
    this.backgroundColor = Colors.white,
    this.textColor = AppColors.textPrimary,
    this.customChild,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: text.isNotEmpty || customChild != null ? 12 : 6,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child:
          customChild ??
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (icon != null) Icon(icon!, size: 18, color: textColor),
              if (text.isNotEmpty) ...[
                if (icon != null) const SizedBox(width: 6),
                Text(
                  text,
                  style: AppTextStyles.sm.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.w400,
                    height: 1.0,
                  ),
                ),
              ],
            ],
          ),
    );
  }
}
