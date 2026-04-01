import 'package:flutter/material.dart';
import 'package:flutter_markup/screens/authentication/login-screen.dart';
import 'package:flutter_markup/screens/authentication/set-password-screen.dart';
import 'package:flutter_markup/screens/authentication/signup-screen.dart';
import 'package:flutter_markup/screens/doctors_list_screen.dart';
import 'package:flutter_markup/screens/notification_settings_screen.dart';
import 'package:flutter_markup/screens/password_manager_screen.dart';
import 'package:flutter_markup/screens/proflie_screen.dart';
import 'package:flutter_markup/screens/settings_screen.dart';
import 'package:flutter_markup/screens/shell_screen.dart';
import 'package:flutter_markup/screens/update_profile_screen.dart';
import './screens/home_screen.dart';
import './screens/preview_screen.dart';
import './screens/welcome_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/preview',
      routes: {
        '/preview': (context) => PreviewScreen(),
        '/welcome': (context) => Welcomescreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/set-password': (context) => SetPasswordScreen(),
        '/home': (context) => ShellScreen(),
        '/doctors': (context) => DoctorsListScreen(),
        '/profile': (context) => ProflieScreen(),
        '/profile/update': (context) => UpdateProfileScreen(),
        '/settings': (context) => SettingsScreen(),
        '/settings/notifications': (context) => NotificationSettingsScreen(),
        '/settings/password-manager': (context) => PasswordManagerScreen(),
      },
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'League Spartan',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
    );
  }
}
