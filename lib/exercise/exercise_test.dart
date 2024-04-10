import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy/themes/app_image.dart';
import 'package:therapy/themes/const_style.dart';

class ExerciseCare extends StatelessWidget {
  const ExerciseCare({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Text(
              'STRETCHES',
              style: GoogleFonts.lato(
                fontSize: 20,
                color: aRed,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildImageWithText(
            image: ExsImg.eHam,
            title: 'Hamstring Stretch',
          ),
          const SizedBox(height: 10),
          _buildImageWithText(
            image: ExsImg.eCalf,
            title: 'Calf Stretch Heel Cord',
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              'STRENGTHENING',
              style: GoogleFonts.lato(
                fontSize: 20,
                color: aRed,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildImageWithText(
            image: ExsImg.eHip,
            title: 'Hip Flexion, Abduction, Adduction',
          ),
          const SizedBox(height: 10),
          _buildImageWithText(
            image: ExsImg.eStep,
            title: 'Step up and Down',
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              'ENDURANCE',
              style: GoogleFonts.lato(
                fontSize: 20,
                color: aRed,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildImageWithText(
            image: ExsImg.eWall,
            title: 'Wall Squats',
          ),
          const SizedBox(height: 10),
          _buildImageWithText(
            image: ExsImg.eWalking,
            title: 'Walking on Flat Surface Uphill and Downhill',
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              'BALANCE',
              style: GoogleFonts.lato(
                fontSize: 20,
                color: aRed,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildImageWithText(
            image: ExsImg.eStanding,
            title: 'Standing Exercise',
          ),
          const SizedBox(height: 10),
          _buildImageWithText(
            image: ExsImg.eAlt,
            title: 'Alternate Marching',
          ),
        ],
      ),
    );
  }
}

Widget _buildImageWithText({
  required String image,
  required String title,
}) {
  return GestureDetector(
    onTap: () {
      
    },
    child: Container(
      height: 113,
      width: 353,
      decoration: BoxDecoration(
        color: bGray,
        borderRadius: BorderRadius.circular(40),
        image: DecorationImage(
          image: AssetImage(image),
          alignment: Alignment.centerLeft,
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 160, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    ),
  );
}
