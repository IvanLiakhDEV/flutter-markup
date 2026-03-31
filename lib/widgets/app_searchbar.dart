import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSearchbar extends StatelessWidget {
  const AppSearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyles.sm.copyWith(color: AppColors.textPrimary),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: AppColors.surfaceBackground,
        contentPadding: EdgeInsets.zero,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: SvgPicture.asset(
            'assets/images/filter.svg',
            width: 32,
            height: 32,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: SvgPicture.asset(
            'assets/images/search.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(color: Colors.amber),
      ),
    );
  }
}
