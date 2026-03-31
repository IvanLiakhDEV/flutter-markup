import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app_style.dart';

class AppSwitchItem extends StatelessWidget {
  final String text;
  final bool isOn;
  final ValueChanged<bool>? onChanged;
  const AppSwitchItem({
    super.key,
    required this.text,
    this.isOn = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: AppTextStyles.md),
        Spacer(),
        Switch(
          value: isOn,
          onChanged: onChanged,
          activeThumbColor: Colors.white,
          activeTrackColor: AppColors.scaffoldBackground,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: AppColors.surfaceBackground,
          trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ],
    );
  }
}
