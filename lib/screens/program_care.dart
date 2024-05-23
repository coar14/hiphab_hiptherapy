import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy/screens/program_detail.dart';
import 'package:therapy/screens/program_start.dart';
import 'package:therapy/themes/app_image.dart';
import 'package:therapy/themes/const_style.dart';
import '../providers.dart';

final currentDayProvider = StateProvider<int>((ref) => 1);
final currentExerciseIndexProvider = StateProvider<int>((ref) => 0);
class ProgramCare extends ConsumerWidget {
  const ProgramCare({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final programStarted = ref.watch(programStartedProvider);
    final currentDay = ref.watch(currentDayProvider);
    final currentExerciseIndex = ref.watch(currentExerciseIndexProvider);

    return Scaffold(
      backgroundColor: aRed,
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 40),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
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
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      const SizedBox(width: 10),
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
                              text: '\nPostoperative Care',
                              style: GoogleFonts.lato(
                                fontSize: 24,
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
                      topLeft: Radius.circular(40),
                    ),
                    color: Color(0xFFE8E8E8),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          'This program aims to guide the in-patient on what exercises they will encounter right after their total hip replacement surgery. Do note that these exercises are done in the hospital and require the assistance of physical therapists and assistive devices. Exercises may vary.',
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.lato(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '1 DAY POST-OP',
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: aRed,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildImageWithText(
                        image: AppImages.icing,
                        title: 'Icing',
                        subTitle: '4 hours, rest in between',
                        context: context,
                      ),
                      const SizedBox(height: 10),
                      _buildImageWithText(
                        image: AppImages.ankle,
                        title: 'Ankle Pumping',
                        subTitle: '3 sec hold, 10-15 times',
                        context: context,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '2-5 DAY POST-OP',
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: aRed,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildImageWithText(
                        image: AppImages.dangle,
                        title: 'Sitting Dangle',
                        subTitle: '10 reps, 2x daily',
                        context: context,
                      ),
                      const SizedBox(height: 10),
                      _buildImageWithText(
                        image: AppImages.leg,
                        title: 'Sitting Leg Raises',
                        subTitle: '10 reps, 2x daily',
                        context: context,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '6 + DAY POST-OP',
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: aRed,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildImageWithText(
                        image: AppImages.march,
                        title: 'Alternating March',
                        subTitle: '10 reps, 2x daily',
                        context: context,
                      ),
                      const SizedBox(height: 10),
                      _buildImageWithText(
                        image: AppImages.squats,
                        title: 'Mini Squats',
                        subTitle: '10 reps, 2x daily',
                        context: context,
                      ),
                      const SizedBox(height: 35),
                      GestureDetector(
                        onTap: () {
                          if (programStarted) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProgramStart(
                                  currentDay: currentDay,
                                  currentExerciseIndex: currentExerciseIndex,
                                ),
                              ),
                            );
                          } else {
                            ref.read(programStartedProvider.state).state = true;
                            ref.read(currentExerciseIndexProvider.state).state = 0; 
                            ref.read(currentDayProvider.state).state = 1; 
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProgramStart(
                                  currentDay: 1,
                                  currentExerciseIndex: 0,
                                ),
                              ),
                            );
                          }
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
                              programStarted ? 'Continue Program' : 'Start Program',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.leagueSpartan(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
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
    required String subTitle,
    required BuildContext context,
  }) {
    return Container(
      height: 113,
      width: 353,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        image: DecorationImage(
          image: AssetImage(image),
          alignment: Alignment.centerLeft,
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 160),
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
            Text(
              subTitle,
              style: GoogleFonts.lato(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
