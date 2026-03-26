import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app-style.dart';
import 'package:flutter_markup/core/enums.dart';
import 'package:flutter_svg/svg.dart';

class AppAuthMethodButton extends StatelessWidget {
  final String icon;
  const AppAuthMethodButton({super.key, this.icon = 'google'});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        onPressed: () => print('123'),
        icon: SvgPicture.asset(
          'assets/images/$icon.svg',
          width: 24,
          height: 24,
        ),
        style: IconButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          backgroundColor: AppColors.surfaceBackground,
          padding: EdgeInsets.symmetric(horizontal: 11, vertical: 11),
        ),
      ),
    );
  }
}
