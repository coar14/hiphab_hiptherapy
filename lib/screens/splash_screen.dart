import 'package:flutter/material.dart';
import 'auth_page.dart'; // Import the AuthPage

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToAuthPage();
  }

  _navigateToAuthPage() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {});
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AuthPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 0),
            Image.asset(
              'assets/hiphab.png',
              width: 350,
              height: 350,
            ),
          ],
        ),
      ),
    );
  }
}
