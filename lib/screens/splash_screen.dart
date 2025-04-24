import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    // Ensure splash screen is shown for at least 3 seconds
    await Future.delayed(const Duration(seconds: 5));

    if (!mounted) return;

    // Check authentication status
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // User is logged in - go to home screen
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // No user logged in - go to onboarding
      Navigator.pushReplacementNamed(context, '/onboarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your Lottie animation
            Lottie.asset(
              'assets/Animation - 1740655575311.json',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            // Optional loading indicator
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
            ),
            // Optional app name/text
            const SizedBox(height: 20),
            const Text(
              'Beauty Solutions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
