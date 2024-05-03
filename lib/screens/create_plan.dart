import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy/themes/app_image.dart';
import 'package:therapy/themes/const_style.dart';
import 'package:therapy/widget/bottom_navbar.dart';

class Plans extends StatelessWidget {
  const Plans({super.key});

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
                        text: 'CREATE YOUR PLAN',
                        style: const TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '\nPersonalize your exercies program',
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
              Text("Disclaimer: Only recommended for people who have reached six months postoperation or those who haven’t undergone surgery.",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 15,
                fontWeight: FontWeight.normal
              ) 
              ),
              const SizedBox(height: 25),
              Container(
                width: 363,
                height: 113,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8E8E8),
                  borderRadius: BorderRadius.circular(40)
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:20),
                      child: Image.asset(AppImages.add),
                    ),
                    const SizedBox(width:20 ),
                    Text('Tap to add a plan',
                    style: GoogleFonts.lato(
                      fontWeight:FontWeight.bold,
                      fontSize:20,
                    ))
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}