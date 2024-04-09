import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:therapy/themes/const_style.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat('EEEE, d MMMM').format(DateTime.now());

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: GoogleFonts.leagueSpartan(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 36,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Today is $currentDate',
                style: const TextStyle(
                  fontFamily: 'Gellix',
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 35),
              Text(
                'Active Programs',
                style: GoogleFonts.leagueSpartan(
                  fontWeight: FontWeight.w400,
                  color: aRed,
                  fontSize: 24,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 1, // Set your item count here
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 143,
                      width: double.infinity,
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'No active program',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  },
                ),
              ),
              Text(
                'Progress Report',
                style: GoogleFonts.leagueSpartan(
                  fontWeight: FontWeight.w400,
                  color: aRed,
                  fontSize: 24,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 380,
                      width: double.infinity,
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'No active program',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
