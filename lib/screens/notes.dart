import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy/themes/app_image.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});

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
                  Text('Therapy',
                  style: GoogleFonts.leagueSpartan(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color:const Color(0xFF58595B)  
                   ),
                  ),
                  const SizedBox(height: 15),
                  Stack(
                  children: [
                    Container(
                      height: 269,
                      width: 362,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(40),
                        image: const DecorationImage(
                          image: AssetImage(AppImages.programs)
                          )
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
                          image: AssetImage(AppImages.exercises)
                          )
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
                          )
                      ),
                    ),
                    Positioned(
                      top: 225,
                      left: 120,
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
        )
      ),
    );
  }
}