import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy/screens/program_care.dart';
import 'package:therapy/screens/program_start.dart';
import 'package:therapy/themes/app_image.dart';
import 'package:therapy/themes/const_style.dart';




class ExerciseSummary extends StatefulWidget {
  final List<bool> completedExercises;

  const ExerciseSummary({Key? key, required this.completedExercises}) : super(key: key);

  @override
  _ExerciseSummaryState createState() => _ExerciseSummaryState();
}

class _ExerciseSummaryState extends State<ExerciseSummary> {
  double sliderValue = 5; // Initial value of the slider

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 50),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProgramCare(),
                        ),
                      );
                    },
                        child: Image.asset(AppImages.close),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Postoperative Care',
                          style: GoogleFonts.leagueSpartan(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: bGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Day 1 Complete!',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: aRed,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Indicator(isActive: true, isCompleted: true),
                  SizedBox(width: 10),
                  Indicator(isActive: true, isCompleted: true),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 1150,
                width: 428,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[300],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Image.asset(AppImages.party),
                    Text(
                      'Congratulations!',
                      style: GoogleFonts.leagueSpartan(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: aRed,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'You finished day 1 of your Postoperative Care.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        fontSize: 24,
                        color: const Color(0xFF58595B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 45),
                    Text(
                      'How did you feel after?',
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        EmotionWidget(
                          imagePath: AppImages.lol,
                          text: 'No pain\n',
                          onPressed: () {
                            setState(() {
                              sliderValue = 1; 
                            });
                          },
                        ),
                        EmotionWidget(
                          imagePath: AppImages.happy,
                          text: 'Hurts \na little',
                          onPressed: () {
                            setState(() {
                              sliderValue = 3; 
                            });
                          },
                        ),
                        EmotionWidget(
                          imagePath: AppImages.neutral,
                          text: 'Hurts a \nlitte more',
                          onPressed: () {
                            setState(() {
                              sliderValue = 5; 
                            });
                          },
                        ),
                        EmotionWidget(
                          imagePath: AppImages.sad,
                          text: 'Hurts even \nmore',
                          onPressed: () {
                            setState(() {
                              sliderValue = 7; 
                            });
                          },
                        ),
                        EmotionWidget(
                          imagePath: AppImages.ellipse,
                          text: 'Hurts a\nwhole lot ',
                          onPressed: () {
                            setState(() {
                              sliderValue = 9;
                            });
                          },
                        ),
                        EmotionWidget(
                          imagePath: AppImages.crying,
                          text: 'Hurts \nworst',
                          onPressed: () {
                            setState(() {
                              sliderValue = 10;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Slider(
                      min: 0,
                      max: 10,
                      value: sliderValue,
                      onChanged: (value) {
                        setState(() {
                          sliderValue = value;
                        });
                      },
                      activeColor: aRed,
                    ),
                    GestureDetector(
                      onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProgramCare(),
                        ),
                      );
                    },
                    child: Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: aRed
                      ),
                      child: Text('Submit',
                      textAlign: TextAlign.center,
                      style:GoogleFonts.lato(
                        color:Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                      )),
                    )
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class EmotionWidget extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onPressed;

  const EmotionWidget({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Image.asset(imagePath),
          Text(text),
        ],
      ),
    );
  }
}
