import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy/themes/const_style.dart';
import 'package:therapy/widget/bottom_navbar.dart';

class GettingStarted extends StatefulWidget {
  const GettingStarted({Key? key}) : super(key: key);

  @override
  State<GettingStarted> createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const BottomNavBar()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/hiphab.png',
              width: 350,
              height: 350,
            ),
            Text(
              'Move.Recover.Thrive',
              style: GoogleFonts.lato(
                  fontSize: 20, 
                  fontWeight: FontWeight.w400, 
                  color: aGray),
            ),
          ],
        ),
      ),
    );
  }
}
