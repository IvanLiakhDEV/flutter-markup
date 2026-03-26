import 'package:flutter/material.dart';

extension ContextUtils on BuildContext {
  double get paddingTop => MediaQuery.of(this).padding.top;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
}
