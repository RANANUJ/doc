import 'package:doc/screens/onboardscreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:doc/screens/anuj.dart';
//import 'package:doc/screens/onboarding_screen.dart';

class SplasScreen extends StatefulWidget {
  const SplasScreen({super.key});

  @override
  _SplasScreenState createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplasScreen> {
  @override
  void initState() {
    super.initState();
    _initializeAndNavigate();
  }

  Future<void> _initializeAndNavigate() async {
    // Minimum splash duration (3 seconds) while checking auth state
    await Future.wait([
      Future.delayed(const Duration(seconds: 3)), // Minimum display time
      _checkAuthState(),
    ]);
  }

  Future<void> _checkAuthState() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) =>
                user != null ? const HomeScreen() : const OnboardingScreen(),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const OnboardingScreen()),
        );
      }
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
            SizedBox(
              height: 200,
              width: 200,
              child: Lottie.asset(
                'assets/Animation - 1740655575311.json',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            // Loading indicator
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
