import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app-style.dart';

class AppCircleButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const AppCircleButton({super.key, required this.icon, this.text = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: text.isNotEmpty ? 12 : 6,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.textPrimary),
          if (text.isNotEmpty) ...[
            const SizedBox(width: 6),
            Transform.translate(
              offset: const Offset(0, 1.7),
              child: Text(
                text,
                style: AppTextStyles.sm.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
