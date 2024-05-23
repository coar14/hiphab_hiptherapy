import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToGetStarted(context);
  }

  _navigateToGetStarted(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 2500), () {});
    Navigator.of(context).pushReplacementNamed('/auth');
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
