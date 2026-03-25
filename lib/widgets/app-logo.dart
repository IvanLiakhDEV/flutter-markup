import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/app-style.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final String theme;
  const AppLogo({super.key, this.size = 130, this.theme = 'dark'});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/images/logo-img-${theme == 'dark' ? 'white' : 'blue'}.svg',
          width: size,
          height: size,
          semanticsLabel: 'preview logo',
        ),
        const SizedBox(height: 19),
        Text(
          'Skin\nFirst',
          style: AppTextStyles.xxlg.copyWith(
            color: theme == 'dark' ? Colors.white : AppColors.textPrimary,
            height: 0.8,
          ),
        ),
        const SizedBox(height: 17),
        Text(
          'Dermatology Center',
          style: TextStyle(
            fontSize: 14,
            color: theme == 'dark' ? Colors.white : AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
