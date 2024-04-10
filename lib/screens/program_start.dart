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
          padding: const EdgeInsets.only(top: 18.0), 
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
                    child: const Image(
                      image: AssetImage(AppImages.backarrow),
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Postoperative Care',
                    style: GoogleFonts.leagueSpartan(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: aGray,
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
                    child: const Image(
                      image: AssetImage(AppImages.arrownext),
                      color: aGray,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Day 1: Icing',
                style: GoogleFonts.lato(
                  fontSize: 20,
                  color: aRed,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Image.asset(
                'assets/postoCare.png',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
