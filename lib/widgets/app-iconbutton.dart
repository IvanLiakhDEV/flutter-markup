import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app-style.dart';
import 'package:flutter_markup/core/enums.dart';
import 'package:flutter_svg/svg.dart';

class AppIconButton extends StatelessWidget {
  final String icon;
  final double size;
  final double padding;
  const AppIconButton({
    super.key,
    this.icon = 'google',
    required this.size,
    this.padding = 10,
  });
  @override
  Widget build(BuildContext context) {
    final double totalSize = size + (padding * 2);
    return Container(
      child: IconButton(
        onPressed: () => print('123'),
        constraints: BoxConstraints.tightFor(
          width: totalSize,
          height: totalSize,
        ),
        icon: SvgPicture.asset(
          'assets/images/$icon.svg',
          width: size,
          height: size,
        ),
        style: IconButton.styleFrom(
          shape: CircleBorder(),
          backgroundColor: AppColors.surfaceBackground,
        ),
      ),
    );
  }
}
