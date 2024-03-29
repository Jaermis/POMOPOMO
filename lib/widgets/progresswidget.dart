import 'package:flutter/material.dart';
import 'package:pomodoro/timerservice.dart';
import 'package:pomodoro/utils.dart';
import 'package:provider/provider.dart';

class ProgressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("${provider.rounds}/4",style: textStyle(30,Colors.grey[350],FontWeight.bold),),
            Text("  ${provider.goal}/12",style: textStyle(30,Colors.grey[350],FontWeight.bold),),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("ROUND",style: textStyle(25,Colors.white,FontWeight.bold),),
            Text("GOAL",style: textStyle(25,Colors.white,FontWeight.bold),),
          ],
        )
      ],
    );
  }
}