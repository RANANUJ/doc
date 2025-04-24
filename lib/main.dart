import 'package:doc/firebase_options.dart';
//import 'package:doc/screens/app_theme.dart';
import 'package:doc/screens/splash_screen.dart';
import 'package:doc/screens/onboardscreen.dart';
import 'package:doc/screens/login_screen.dart';
import 'package:doc/screens/signup_screen.dart';
import 'package:doc/screens/forgot_password_screen.dart';
import 'package:doc/home/home_screen.dart';
//import 'package:doc/theme/app_theme.dart'; // Import the theme file
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //  theme: AppTheme.lightTheme, // Use light theme
      //darkTheme: AppTheme.darkTheme, // Use dark theme
      themeMode: ThemeMode.system, // Follow system theme settings
      home: const SplashScreen(),
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
