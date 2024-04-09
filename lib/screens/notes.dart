import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy/themes/const_style.dart';

class Notes extends StatelessWidget {
  const Notes({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 20),
          scrollDirection: Axis.vertical,
          children: [
            Column(
              children: [
                Container(
                  height: 170,
                  width: 316,
                  color: aRed,
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'THE HIP \nREPLACEMENT \nPOST-SURGERY \nTHERAPY',
                    style: GoogleFonts.leagueSpartan(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'It is recommended you dedicate 30-60 minutes each \nday for exercises. You can break up your exercise \nroutine and do some exercises in the morning and \nothers in the afternoon or perform different groups of \nexercises on different days.',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 35),
                Container(
                  height: 500,
                  width: 500,
                  color: Colors.grey,
                  child: Text(
                    'CATEGORIES',
                    style: GoogleFonts.leagueSpartan(fontSize: 28),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
