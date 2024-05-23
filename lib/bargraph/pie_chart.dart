import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../providers.dart';
import '../themes/const_style.dart'; 

class MyPieChart extends ConsumerWidget {
  const MyPieChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final painLevel = ref.watch(painLevelProvider);
    final exerciseProgress = ref.watch(exerciseProgressProvider);
    
    double painPercentage = painLevel / 10;
    Color painColor;

    if (painPercentage <= 0.2) {
      painColor = Colors.green;
    } else if (painPercentage <= 0.4) {
      painColor = Colors.yellow;
    } else if (painPercentage <= 0.6) {
      painColor = Colors.orange;
    } else {
      painColor = Colors.red;
    }

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularPercentIndicator(
            radius: 30.0,
            lineWidth: 4.0,
            percent: exerciseProgress,
            header: const Text("Program"),
            center: Text("${(exerciseProgress * 100).toInt()}%"),
            progressColor: aRed,
          ),
          const SizedBox(width: 30.0),
          CircularPercentIndicator(
            radius: 30.0,
            lineWidth: 4.0,
            percent: painPercentage,
            header: const Text("Pain Level"),
            center: Text("${(painPercentage * 100).toInt()}%"),
            progressColor: painColor,
          ),
        ],
      ),
    );
  }
}
