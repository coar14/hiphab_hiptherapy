import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy/programs/program_progress.dart';
import 'package:therapy/screens/exercise_summary.dart';
import 'package:therapy/screens/program_detail.dart';
import 'package:therapy/themes/app_image.dart';
import 'package:therapy/themes/const_style.dart';

class ProgramStart extends StatelessWidget {
  const ProgramStart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ExerciseScreen(),
      ),
    );
  }
}

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  int currentExerciseIndex = 0;
  List<bool> completedExercises = List.filled(exerciseTitles.length, false);

  void goToNextExercise() {
    setState(() {
      completedExercises[currentExerciseIndex] = true;
      if (currentExerciseIndex < exerciseTitles.length - 1) {
        currentExerciseIndex++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ExerciseSummary(completedExercises: completedExercises),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
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
                          builder: (context) => ProgramDetail(onAddProgram: (String ) {  },),
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
                    textAlign: TextAlign.center,
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
                'Day 1: ${exerciseTitles[currentExerciseIndex]}',
                style: GoogleFonts.lato(
                  fontSize: 20,
                  color: aRed,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < exerciseTitles.length; i++)
                    Indicator(
                      isActive: i == currentExerciseIndex,
                      isCompleted: completedExercises[i],
                    ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 1000,
                width: 428,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Color(0xFFE8E8E8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          exerciseImages[currentExerciseIndex],
                          width: 367,
                          height: 326,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Text(
                          'Duration: ${exerciseDurations[currentExerciseIndex]}, rest in between',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: aRed,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        exerciseDescriptions[currentExerciseIndex],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 50),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: goToNextExercise,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFBE1E2D),
                            minimumSize: const Size(158, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            currentExerciseIndex < exerciseTitles.length - 1
                                ? 'Next'
                                : 'Finish',
                            style: GoogleFonts.leagueSpartan(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Indicator extends StatelessWidget {
  final bool isActive;
  final bool isCompleted;

  const Indicator({super.key, required this.isActive, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 11,
      width: 28,
      decoration: BoxDecoration(
        color: isCompleted ? aRed : (isActive ? aRed : Colors.grey),
        borderRadius: BorderRadius.circular(40),
      ),
      margin: const EdgeInsets.only(right: 10),
    );
  }
}

List<String> exerciseTitles = ['Icing', 'Ankle Pumping'];
List<String> exerciseDescriptions = [
  'An ice pack is wrapped in a thin towel and placed gently above the hip. This is to reduce pain and inflammation in the area.',
  'Description of exercise 2',
];
List<String> exerciseImages = [
  AppImages.icing,
  AppImages.ankle,
];
List<String> exerciseDurations = [
  '4 hours, rest in between',
  'Duration of exercise 2',
];
