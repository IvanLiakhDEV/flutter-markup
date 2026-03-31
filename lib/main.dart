import 'package:flutter/material.dart';
import 'package:flutter_markup/screens/authentication/login-screen.dart';
import 'package:flutter_markup/screens/authentication/set-password-screen.dart';
import 'package:flutter_markup/screens/authentication/signup-screen.dart';
import 'package:flutter_markup/screens/doctors_list_screen.dart';
import 'package:flutter_markup/screens/notification_settings_screen.dart';
import 'package:flutter_markup/screens/proflie_screen.dart';
import 'package:flutter_markup/screens/settings_screen.dart';
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

      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'League Spartan',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),

      // home: PreviewScreen(),
      // home: Welcomescreen(),
      // home: LoginScreen(),
      // home: SignUpScreen(),
      // home: SetPasswordScreen(),
      // home: HomeScreen(),
      // home: DoctorsListScreen(),
      // home: ProflieScreen(),
      // home: UpdateProfileScreen(),
      // home: SettingsScreen(),
      home: NotificationSettingsScreen(),
    );
  }
}
