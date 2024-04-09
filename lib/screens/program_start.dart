import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy/programs/program_progress.dart';
import 'package:therapy/screens/program_detail.dart';
import 'package:therapy/themes/app_image.dart';
import 'package:therapy/themes/const_style.dart';

class ProgramStart extends StatelessWidget {
  const ProgramStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0), // Add desired padding here
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProgramDetail(),
                        ),
                      );
                    },
                    child: Image.asset(AppImages.back),
                  ),
                  Text(
                    'Postoperative Care',
                    style: GoogleFonts.leagueSpartan(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: bGray,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProgramProgress(),
                        ),
                      );
                    },
                    child: Image.asset(AppImages.arrownext),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Day 1: Icing',
                style: GoogleFonts.lato(
                  fontSize: 20,
                  color: aRed,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
