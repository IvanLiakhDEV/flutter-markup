import 'package:flutter/material.dart';
import 'package:flutter_markup/core/app-style.dart';
import 'package:flutter_markup/widgets/app_circle_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<AppCircleButton>? actions;
  const AppBarWidget({super.key, this.title = 'title', this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTextStyles.lg.copyWith(color: AppColors.textPrimary),
      ),
      centerTitle: true,
      leading: IconButton(
        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
        icon: SvgPicture.asset('assets/images/arrow-left.svg'),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      actions: actions != null
          ? [
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Row(spacing: 5, children: actions!),
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
