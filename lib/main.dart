import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_markup/services/auth_service.dart';
import 'firebase_options.dart';
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
import './screens/preview_screen.dart';
import './screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: AuthService().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const PreviewScreen();
          }
          if (snapshot.hasData) {
            return const ShellScreen();
          }
          return const Welcomescreen();
        },
      ),

      routes: {
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
