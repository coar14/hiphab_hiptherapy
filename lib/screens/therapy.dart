import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy/screens/exercise_details.dart';
import 'package:therapy/screens/program_detail.dart';

import '../themes/app_image.dart';

class Therapy extends StatelessWidget {
  const Therapy({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:10, vertical: 30),
              child: Column(
                children: [
                  Text('THERAPY',
                  style: GoogleFonts.leagueSpartan(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color:const Color(0xFF58595B)  
                   ),
                  ),
                  const SizedBox(height: 25),
                  GestureDetector(
                    onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProgramDetail(),
                          ),
                        );
                      },
                  child: Stack(
                  children: [
                    Container(
                      height: 265,
                      width: 360,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(40),
                        image: const DecorationImage(
                          image: AssetImage(AppImages.programs)
                          ),
                          boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(159, 87, 87, 87),
                            offset: Offset(0, 3),
                            blurStyle: BlurStyle.outer,
                            blurRadius: 15,
                          ),
                        ], 
                      ),
                    ),
                    Positioned(
                      top: 225,
                      left: 120,
                      child:Text('Programs',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                      color: Colors.white
                    )
                    ),
                    ),
                  ],
                  ),
                  ),
                  const SizedBox(height: 45),
                  GestureDetector(
                    onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ExerciseDetails(),
                          ),
                        );
                      },
                  child: Stack(
                  children: [
                    Container(
                      height: 269,
                      width: 362,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(40),
                        image: const DecorationImage(
                          image: AssetImage(AppImages.exercises)
                          ),
                          boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(159, 87, 87, 87),
                            offset: Offset(0, 3),
                            blurStyle: BlurStyle.outer,
                            blurRadius: 15,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 225,
                      left: 120,
                      child:Text('Exercises',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                      color: Colors.white
                    )
                    ),
                    ),
                  ],
                  ),
                  ),
                  const SizedBox(height: 45),
                  Stack(
                  children: [
                    Container(
                      height: 269,
                      width: 362,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(40),
                        image: const DecorationImage(
                          image: AssetImage(AppImages.plan)
                          ),
                          boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(159, 87, 87, 87),
                            offset: Offset(0, 3),
                            blurStyle: BlurStyle.outer,
                            blurRadius: 15,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 225,
                      left: 80,
                      child:Text('Create your plan',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                      color: Colors.white
                    )
                    ),
                    ),
                  ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}