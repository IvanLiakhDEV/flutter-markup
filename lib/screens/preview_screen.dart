import 'package:flutter/material.dart';
import '../core/app_style.dart';
import '../widgets/app_logo.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Center(
        child: Column(children: [const SizedBox(height: 309), AppLogo()]),
      ),
    );
  }
}
