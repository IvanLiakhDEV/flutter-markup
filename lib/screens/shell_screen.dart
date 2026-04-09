import 'package:flutter/material.dart';
import 'package:flutter_markup/screens/doctors_list_screen.dart';
import 'package:flutter_markup/screens/home_screen.dart';
import 'package:flutter_markup/screens/proflie_screen.dart';
import 'package:flutter_markup/widgets/app_bottom_navbar.dart';

class ShellScreen extends StatefulWidget {
  const ShellScreen({super.key});

  @override
  State<ShellScreen> createState() => _ShellScreenState();
}

class _ShellScreenState extends State<ShellScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    DoctorsListScreen(),
    ProflieScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: AppBottomNavbar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
