import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy/screens/program_detail.dart';
import 'package:therapy/screens/program_start.dart';
import 'package:therapy/themes/app_image.dart';
import 'package:therapy/themes/const_style.dart';

class ProgramExer extends StatelessWidget {
  const ProgramExer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: aRed,
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 33, left: 20),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProgramDetail(onAddProgram: (String ) {},),
                            ),
                          );
                        },
                        child: const Image(
                          image: AssetImage(AppImages.backarrow),
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'PROGRAMS',
                          style: const TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '\nOutpatients Exercise Program',
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                color: const Color(0xFFFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                Container(
                  height: 1200,
                  width: 428,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                      color: Color(0xFFE8E8E8)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          'This is a recommended exercise regime that aims to guide outpatients on what exercises to do for a successful recovery at home. You will need walker or crutches, thera band (yellow), ankle weights and a foot stool to complete this program. Do this once daily, for two to three times a week.',
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.lato(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProgramStart(),
                            ),
                          );
                        },
                      child: _buildImageWithText(
                        image: AppImages.hamstring,
                        title: 'Hamstring Stretch',
                        context:
                            context, 
                        navigateTo:
                            const ProgramStart(), 
                      ),
                      ),
                      const SizedBox(height: 10),
                      _buildImageWithText(
                        image: AppImages.calf,
                        title: 'Calf Stretch Heel Cord',
                        context: context, navigateTo: const ProgramStart(),
                      ),
                      const SizedBox(height: 10),
                      _buildImageWithText(
                        image: AppImages.standing,
                        title: 'Standing Exercise',
                        context: context, navigateTo: const ProgramStart(),
                      ),
                      const SizedBox(height: 10),
                      _buildImageWithText(
                        image: AppImages.hip,
                        title: 'Hip Flexion, Abduction, Adduction',
                        context: context, navigateTo: const ProgramStart()
                      ),
                      const SizedBox(height: 10),
                      _buildImageWithText(
                        image: AppImages.wall,
                        title: 'Wall Squats',
                        context: context, navigateTo: const ProgramStart()
                      ),
                      const SizedBox(height: 35),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProgramStart(),
                              ),
                            );
                          },
                          child: Container(
                            height: 60,
                            width: 309,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: aRed,
                            ),
                            child: Center(
                              child: Text(
                                'Start Program',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.leagueSpartan(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          )
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWithText({
    required String image,
    required String title,
     required BuildContext context, 
  required Widget navigateTo,
  }) {
    return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => navigateTo,
        ),
      );
    },
    child: Container(
      height: 125,
      width: 353,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        image: DecorationImage(
            image: AssetImage(image),
            alignment: Alignment.centerLeft,
            fit: BoxFit.fitHeight),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 25, left: 160),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    ),
    );
  }
}
