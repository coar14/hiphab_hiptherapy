import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy/screens/program_care.dart';
import 'package:therapy/themes/app_image.dart';
import 'package:therapy/themes/const_style.dart';
import '../providers.dart';
import 'exercise_summary.dart';

final List<String> exerciseTitles = [
  'Icing',
  'Ankle Pumping',
  'Sitting Dangle',
  'Sitting Leg Raises',
  'Alternating March',
  'Mini Squats'
];

final Map<int, List<Map<String, String>>> exercises = {
  1: [
    {
      'title': 'Icing',
      'image': AppImages.icing,
      'duration': '4 hours, rest in between',
      'description': 'An ice pack is wrapped in a thin towel and placed gently above the hip. This is to reduce pain and inflammation in the area. '
    },
    {
      'title': 'Ankle Pumping',
      'image': AppImages.ankle,
      'duration': '3 sec hold, 10-15 times',
      'description': 'Lie on your back with your legs straight, move your ankles up and hold for 3 seconds, move them down and hold for 3 seconds. Repeat until 10-15 times.'
    },
  ],
  2: [
    {
      'title': 'Sitting Dangle',
      'image': AppImages.dangle,
      'duration': '10 reps, 2x daily',
      'description': 'Sit on a chair, extend your leg straight out in front of you, hold for 2-3 seconds, then lower it back down. Repeat 10 times per leg, twice daily.'
    },
    {
      'title': 'Sitting Leg Raises',
      'image': AppImages.leg,
      'duration': '10 reps, 2x daily',
      'description': 'Sit on a chair, lift one leg straight towards the ceiling without bending your knee, hold for 2-3 seconds, then lower it. Repeat 10 times per leg, twice daily.'
    },
  ],
  3: [
    {
      'title': 'Alternating March',
      'image': AppImages.march,
      'duration': '10 reps, 2x daily',
      'description': 'Stand and lift one knee towards your chest, hold for 2-3 seconds, then switch legs in a smooth motion. Perform 10 repetitions per leg, twice daily.'
    },
    {
      'title': 'Mini Squats',
      'image': AppImages.squats,
      'duration': '10 reps, 2x daily',
      'description': 'Stand with feet shoulder-width apart, bend your knees and lower your hips as if sitting on a chair, hold for 2-3 seconds, then rise back up. Repeat 10 times, twice daily.'
    },
  ],
};

final currentDayProvider = StateProvider<int>((ref) => 1);
final currentExerciseIndexProvider = StateProvider<int>((ref) => 0);

class ProgramStart extends StatelessWidget {
  final int currentDay;
  final int currentExerciseIndex;

  const ProgramStart(
      {super.key, required this.currentDay, required this.currentExerciseIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ExerciseScreen(
            currentDay: currentDay, currentExerciseIndex: currentExerciseIndex),
      ),
    );
  }
}

class ExerciseScreen extends ConsumerStatefulWidget {
  final int currentDay;
  final int currentExerciseIndex;

  const ExerciseScreen(
      {super.key,
      required this.currentDay,
      required this.currentExerciseIndex});

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends ConsumerState<ExerciseScreen> {
  late int _currentExerciseIndex;
  late int _currentDay;

  @override
  void initState() {
    super.initState();
    _currentExerciseIndex = widget.currentExerciseIndex;
    _currentDay = widget.currentDay;
    _updateProgress();
  }

  @override
  Widget build(BuildContext context) {
    final dayExercises = exercises[_currentDay] ?? [];

    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProgramCare(),
                        ),
                      );
                    },
                    child: const Image(
                      image: AssetImage(AppImages.backarrow),
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    'Postoperative Care',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.leagueSpartan(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: aGray,
                    ),
                  ),
                  const SizedBox(width: 55),
                ],
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                _currentDay == 2
                    ? 'Day 2-5: ${dayExercises[_currentExerciseIndex]['title']}'
                    : _currentDay == 3
                        ? 'Day 6+: ${dayExercises[_currentExerciseIndex]['title']}'
                        : 'Day $_currentDay: ${dayExercises[_currentExerciseIndex]['title']}',
                style: GoogleFonts.lato(
                  fontSize: 20,
                  color: aRed,
                  fontWeight: FontWeight.bold,
                ),
              ),const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < dayExercises.length; i++)
                    Indicator(
                      isActive: i == _currentExerciseIndex,
                      isCompleted: _currentExerciseIndex > i,
                    ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 1000,
                width: 428,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Color(0xFFE8E8E8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          dayExercises[_currentExerciseIndex]['image']!,
                          width: 367,
                          height: 326,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Text(
                          'Duration: ${dayExercises[_currentExerciseIndex]['duration']}',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: aRed,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        dayExercises[_currentExerciseIndex]['description']!,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 50),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: goToNextExercise,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFBE1E2D),
                            minimumSize: const Size(158, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            _currentExerciseIndex < dayExercises.length - 1
                                ? 'Next'
                                : 'Finish',
                            style: GoogleFonts.leagueSpartan(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void goToNextExercise() {
  setState(() {
    final dayExercises = exercises[_currentDay] ?? [];
    if (_currentExerciseIndex < dayExercises.length - 1) {
      _currentExerciseIndex++;
      ref.read(currentExerciseIndexProvider.state).state = _currentExerciseIndex;
    } else {
      if (_currentDay < exercises.keys.length) {
        _currentDay++;
        _currentExerciseIndex = 0;
        ref.read(currentDayProvider.state).state = _currentDay;
        ref.read(currentExerciseIndexProvider.state).state = _currentExerciseIndex;
      } else {
        ref.read(exerciseProgressProvider.state).state = 1.0;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ExerciseSummary(),
          ),
        );
      }
    }
    final dayOfWeek = (_currentDay - 1) % 7;
    ref.read(weeklySummaryProvider.notifier).updateExercise(dayOfWeek, 1.0);
    _updateProgress();
  });
}


  void _updateProgress() {
  final totalExercises = exercises.values.expand((e) => e).length;
  final completedExercisesCount = exercises.entries
      .takeWhile((entry) => entry.key < _currentDay)
      .expand((entry) => entry.value)
      .length + _currentExerciseIndex + 1;
  double progress = completedExercisesCount / totalExercises;
  Future.microtask(() {
    ref.read(exerciseProgressProvider.state).state = progress;
  });
 }
}

class Indicator extends StatelessWidget {
  final bool isActive;
  final bool isCompleted;

  const Indicator({super.key, required this.isActive, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:
            isCompleted ? Colors.green : (isActive ? Colors.red : Colors.grey),
      ),
    );
  }
}