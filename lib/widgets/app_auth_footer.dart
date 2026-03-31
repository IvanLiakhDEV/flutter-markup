import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app_style.dart';
import 'package:flutter_markup/widgets/app_icon_button.dart';
import 'package:flutter_markup/widgets/app_button.dart';

class AuthFooter extends StatelessWidget {
  final String buttonText;
  final VoidCallback onButtonPressed;
  final String? socialText;
  final bool showSocialIcons;
  final String bottomTextSuffix;
  final String bottomLinkText;
  final VoidCallback onBottomLinkPressed;
  final Widget? extraWidget;
  const AuthFooter({
    super.key,
    required this.buttonText,
    required this.onButtonPressed,
    this.socialText,
    this.showSocialIcons = true,
    required this.bottomTextSuffix,
    required this.bottomLinkText,
    required this.onBottomLinkPressed,
    this.extraWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (extraWidget != null) ...[extraWidget!, const SizedBox(height: 20)],
        AppButton(
          text: buttonText,
          backgroundColor: AppColors.scaffoldBackground,
          textColor: Colors.white,
          onPressed: onButtonPressed,
        ),
        if (showSocialIcons) ...[
          const SizedBox(height: 16),
          Text(
            socialText ?? 'or sign up with',
            style: AppTextStyles.sm,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          const Center(
            child: SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIconButton(icon: 'google', size: 24),
                  AppIconButton(icon: 'facebook', size: 24),
                  AppIconButton(icon: 'fingerprint', size: 24),
                ],
              ),
            ),
          ),
        ],
        const SizedBox(height: 38),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$bottomLinkText ', style: AppTextStyles.sm),
            GestureDetector(
              onTap: onBottomLinkPressed,
              child: Text(
                bottomTextSuffix,
                style: AppTextStyles.sm.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
