import 'package:flutter/material.dart';
import 'package:pomodoro/timerservice.dart';
import 'package:pomodoro/utils.dart';
import 'package:pomodoro/widgets/progresswidget.dart';
import 'package:pomodoro/widgets/timecontroller.dart';
import 'package:pomodoro/widgets/timercard.dart';
import 'package:pomodoro/widgets/timeroptions.dart';
import 'package:provider/provider.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Scaffold(
      backgroundColor: renderColor(provider.currentState),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: renderColor(provider.currentState),
        title: Text("POMOPOMO", style: textStyle(25, Colors.white, FontWeight.w700),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white, 
              ),
              iconSize: 40,
              onPressed: () => Provider.of<TimerService>(context, listen: false).reset(),
              )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 15),
              TimerCard(),
              SizedBox(height: 45,),
              TimerOptions(),
              SizedBox(height: 45,),
              TimeController(),
              SizedBox(height: 45,),
              ProgressWidget()
            ],
          ),
          )
      ),
    );
  }
}