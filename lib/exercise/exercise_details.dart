import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy/exercise/exercise_test.dart';
import 'package:therapy/themes/app_image.dart';
import 'package:therapy/themes/const_style.dart';
import 'package:therapy/widget/bottom_navbar.dart';

class ExerciseDetails extends StatelessWidget {
  const ExerciseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 19.5, right: 10),
          child: Column(
            children: [
              Container(
                height: 160,
                width: 370,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  color: aRed,
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BottomNavBar(),
                          ),
                        );
                      },
                      child: const Image(
                        image: AssetImage(AppImages.backarrow),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'EXERCISES',
                        style: const TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '\nFollow along with our exercises',
                            style: GoogleFonts.lato(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Expanded(
                child: ExerciseCare(),
              ),
            ],
            
          ),
        ),
      ),
    );
  }
}
