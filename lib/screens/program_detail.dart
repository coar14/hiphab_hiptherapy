import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy/screens/program_care.dart';
import 'package:therapy/screens/program_exer.dart';
import 'package:therapy/themes/app_image.dart';
import 'package:therapy/themes/const_style.dart';
import 'package:therapy/widget/bottom_navbar.dart';
import '../providers.dart';

class ProgramDetail extends ConsumerWidget {
  const ProgramDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
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
                            text: 'PROGRAMS',
                            style: const TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '\nChoose programs that fit your needs',
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
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      final newProgram = {
                        'title': 'Postoperative Care',
                        'duration': 'Duration: 6 weeks',
                      };
                      ref.read(activeProgramsProvider.notifier).addProgram(newProgram);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProgramCare(),
                        ),
                      );
                    },
                    child: const ProgramCard(
                      title: 'Postoperative Care',
                      duration: 'Duration: 6 weeks',
                      image: AppImages.postop,
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      final newProgram = {
                        'title': 'Outpatients Exercise Program',
                        'duration': 'Duration: 2-3x a week',
                      };
                      ref.read(activeProgramsProvider.notifier).addProgram(newProgram);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProgramExer(),
                        ),
                      );
                    },
                    child: const ProgramCard(
                      title: 'Outpatients Exercise Program',
                      duration: 'Duration: 2-3x a week',
                      image: AppImages.homeremedy,
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      final newProgram = {
                        'title': 'Athlete Training Recovery',
                        'duration': 'Duration: 5x a week',
                      };
                      ref.read(activeProgramsProvider.notifier).addProgram(newProgram);
                    },
                    child: const ProgramCard(
                      title: 'Athlete Training Recovery',
                      duration: 'Duration: 5x a week',
                      image: AppImages.athlete,
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      final newProgram = {
                        'title': 'Senior Care',
                        'duration': 'Duration: 2-3x a week',
                      };
                      ref.read(activeProgramsProvider.notifier).addProgram(newProgram);
                    },
                    child: const ProgramCard(
                      title: 'Senior Care',
                      duration: 'Duration: 2-3x a week',
                      image: AppImages.senior,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgramCard extends StatelessWidget {
  final String title;
  final String duration;
  final String image;

  const ProgramCard({
    super.key,
    required this.title,
    required this.duration,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 199,
      width: 393,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(40),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 130, left: 12),
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: title,
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '\n              $duration',
                    style: GoogleFonts.lato(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 130, right: 15),
            child: Image(
              color: Colors.white,
              image: AssetImage(AppImages.add),
            ),
          ),
        ],
      ),
    );
  }
}
