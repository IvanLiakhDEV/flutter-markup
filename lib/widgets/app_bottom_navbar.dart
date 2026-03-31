import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app-style.dart';

class AppBottomNavbar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final icons = [
      Icons.home_outlined,
      Icons.chat_bubble_outline,
      Icons.person_outline,
      Icons.calendar_today_outlined,
    ];

    return Container(
      margin: const EdgeInsets.fromLTRB(30, 10, 30, 20),
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackground,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          icons.length,
          (index) => GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: currentIndex == index
                    ? Colors.white
                    : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icons[index],
                size: 22,
                color: currentIndex == index
                    ? AppColors.scaffoldBackground
                    : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
