import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy/themes/const_style.dart';

class Learns extends StatefulWidget {
  const Learns({Key? key});

  @override
  State<Learns> createState() => _LearnsState();
}

class _LearnsState extends State<Learns> {
  bool isPanelExpanded = false;
  bool isPanelExpanded2 = false;

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
                Text(
                  'LEARN',
                  style: GoogleFonts.leagueSpartan(
                    fontSize: 32,
                    color: aGray,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: 316,
                  decoration: BoxDecoration(
                    color: aRed,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'THERAPY FOR HIP RELATED ISSUES',
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: ExpansionPanelList(
                    
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        if (index == 0) {
                          isPanelExpanded = !isPanelExpanded;
                        } else if (index == 1) {
                          isPanelExpanded2 = !isPanelExpanded2;
                        }
                      });
                    },
                    children: [
                      ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Text('BASICS',
                                style: GoogleFonts.leagueSpartan(
                                    color: aRed,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)),
                          );
                        },
                        body: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: abox,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'It is recommended you dedicate 30-60 minutes each day for exercises. You can break up your exercise routine and do some exercises in the morning and others in the afternoon or perform different groups of exercises on different days.'),
                              SizedBox(height: 5),
                              Text(
                                  'Always stretch or warm up for 5-10 minutes before performing other exercises. Likewise, do a cooldown stretch for 5-10 minutes after exercising. Perform the exercises within a tolerable discomfort. Know your limits.'),
                            ],
                          ),
                        ),
                        isExpanded: isPanelExpanded,
                      ),
                      ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Text('THERAPY GUIDE',
                                style: GoogleFonts.leagueSpartan(
                                    color: aRed,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)),
                          );
                        },
                        body: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: abox,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Therapy is essential in order to improve your quality of life. HIPHAB contains exercises that will help reduce swelling and increase hip strength. The programs are tailored to fit your needs and you can also create your own programs as well.'),
                            ],
                          ),
                        ),
                        isExpanded: isPanelExpanded2,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 200,
                  width: 500,
                  color: Colors.grey.shade400,
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    children: [
                      Text(
                        'CATEGORIES',
                        style: GoogleFonts.leagueSpartan(fontSize: 28),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      const ListCategories(),
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
              child: const Icon(Icons.category,
                  color: Colors.white), // replace with your desired icon
            ),
            const SizedBox(height: 5),
            const Text(
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
              child: const Icon(Icons.category,
                  color: Colors.white), // replace with your desired icon
            ),
            const SizedBox(height: 5),
            const Text(
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
              child: const Icon(Icons.category,
                  color: Colors.white), // replace with your desired icon
            ),
            const SizedBox(height: 5),
            const Text(
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
              child: const Icon(Icons.category,
                  color: Colors.white), // replace with your desired icon
            ),
            const SizedBox(height: 5),
            const Text(
              'Balance',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
