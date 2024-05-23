import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:therapy/bargraph/bar_graph.dart';
import 'package:therapy/bargraph/pie_chart.dart';
import 'package:therapy/themes/const_style.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<double> weeklySummary = [1.0, 0.0, 2.0, 0.0, 1.0, 0.0, 1.0];
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
                'Welcome, Seru',
                style: GoogleFonts.leagueSpartan(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 36,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Today is $currentDate',
                style: const TextStyle(
                  fontFamily: 'Gellix',
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 35),
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
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 143,
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
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
              const SizedBox(
                height: 100,
                child: MyPieChart(),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 130,
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: MyBarGraph(weeklySummary: weeklySummary),
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
