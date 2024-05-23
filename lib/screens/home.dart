import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:therapy/bargraph/bar_graph.dart';
import 'package:therapy/themes/const_style.dart';
import '../bargraph/pie_chart.dart';
import '../providers.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat('EEEE, d MMMM').format(DateTime.now());
    final activePrograms = ref.watch(activeProgramsProvider);
    final weeklySummary = ref.watch(weeklySummaryProvider);

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
                  itemCount: activePrograms.length,
                  itemBuilder: (BuildContext context, int index) {
                    final program = activePrograms[index];
                    return Container(
                      height: 143,
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            program['title']!,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            program['duration']!,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
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
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                            child: MyBarGraph(weeklySummary: weeklySummary),
                          ),
                        ],
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
