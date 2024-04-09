import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyPieChart extends StatelessWidget {
  const MyPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularPercentIndicator(
              radius: 30.0,
              lineWidth: 4.0,
              percent: 0.0,
              header: new Text("Program"),
              center: Text("0%"),
              progressColor: Colors.red,
            ),
            SizedBox(width: 30.0), 
            CircularPercentIndicator(
              radius: 30.0,
              lineWidth: 4.0,
              percent: 0.50,
              header: new Text("Pain Level"),
              center: Text("50%"),
              progressColor: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
