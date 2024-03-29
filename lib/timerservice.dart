import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class TimerService extends ChangeNotifier{
  late Timer timer;
  double currentDuration = 1500;
  double selectedTime = 1500;
  bool timerPlaying = false;
  int rounds = 0;
  int goal = 0;
  String currentState = "FOCUS";

  void start() {
    timerPlaying = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(currentDuration == 0){
        handleNextRound();
      }
      else{
        currentDuration--;
        notifyListeners();
      }
     });
  }

  void pause() {
    timer.cancel();
    timerPlaying = false;
    notifyListeners();
  }

  void selecTime(double seconds){
    selectedTime = seconds;
    currentDuration = seconds;
    notifyListeners();
  }

  void reset() {
    timer.cancel();
    currentState = "FOCUS";
    currentDuration = selectedTime = 1500;
    rounds = goal = 0;
    timerPlaying = false;
    notifyListeners();
  }

  void onBreakNotif() {
    AwesomeNotifications().createNotification(content: NotificationContent(
          id: 1,
          channelKey: "basic_channel",
          title: "POMOPOMO is on BREAK",
          body: "Have a good break!",
          actionType: ActionType.KeepOnTop,
          category: NotificationCategory.Status,
          ),
          
    );
  }
  void onFocusNotif() {
    AwesomeNotifications().createNotification(content: NotificationContent(
          id: 1,
          channelKey: "basic_channel",
          title: "POMOPOMO is on FOCUS",
          body: "Good luck on studying!",
          actionType: ActionType.KeepOnTop,
          category: NotificationCategory.Status,
          ));
  }
  void onLongBreakNotif() {
    AwesomeNotifications().createNotification(content: NotificationContent(
          id: 1,
          channelKey: "basic_channel",
          title: "POMOPOMO is on LONG BREAK",
          body: "Have a good long break!",
          actionType: ActionType.KeepOnTop,
          category: NotificationCategory.Status
          ));
  }
  void goalFinishedNotif() {
    AwesomeNotifications().createNotification(content: NotificationContent(
          id: 1,
          channelKey: "basic_channel",
          title: "POMOPOMO GOAL COMPLETED",
          body: "Congratulations on finishing your POMOPOMO session!",
          actionType: ActionType.KeepOnTop,
          category: NotificationCategory.Status
          ));
  }

  void handleNextRound() {
    if(currentState == "FOCUS"){
      if(rounds !=3){
        onBreakNotif();
        currentState = "BREAK";
        currentDuration = selectedTime/5;
      }
      else if(rounds == 3){
        onLongBreakNotif();
        currentState = "LONG BREAK";
        currentDuration = selectedTime;
      }
      rounds++;
      goal++;
    }
    else if(currentState == "BREAK"){
      onFocusNotif();
      currentState = "FOCUS";
      currentDuration = selectedTime;
    }
    else if(currentState == "LONG BREAK"){
      if(goal != 12){
        onFocusNotif();
        currentState = "FOCUS";
        currentDuration = selectedTime;
        rounds = 0;
      }
      else if(goal == 12){
        goalFinishedNotif();
        reset();
      }
    }
    notifyListeners();
  }
}