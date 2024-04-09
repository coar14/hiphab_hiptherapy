import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy/themes/const_style.dart';

class Learns extends StatelessWidget {
  const Learns({Key? key});

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
                  height: 190,
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
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'It is recommended you dedicate 30-60 minutes each day for exercises. You can break up your exercise routine and do some exercises in the morning and others in the afternoon or perform different groups of exercises on different days.',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 35),
                Container(
                  height: 200,
                  width: 500,
                  color: Colors.grey.shade400,
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    children: [
                      Text(
                        'CATEGORIES',
                        style: GoogleFonts.leagueSpartan(fontSize: 28),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      ListCategories(),
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
}

class ListCategories extends StatelessWidget {
  const ListCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Container(
              width: 50,
              height: 50,
              color: aRed,
              child: Icon(Icons.category,
                  color: Colors.white), // replace with your desired icon
            ),
            const SizedBox(height: 5),
            Text(
              'Stretches',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              width: 50,
              height: 50,
              color: aRed,
              child: Icon(Icons.category,
                  color: Colors.white), // replace with your desired icon
            ),
            const SizedBox(height: 5),
            Text(
              'Strengthening',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              width: 50,
              height: 50,
              color: aRed,
              child: Icon(Icons.category,
                  color: Colors.white), // replace with your desired icon
            ),
            const SizedBox(height: 5),
            Text(
              'Endurance',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              width: 50,
              height: 50,
              color: aRed,
              child: Icon(Icons.category,
                  color: Colors.white), // replace with your desired icon
            ),
            const SizedBox(height: 5),
            Text(
              'Balance',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
