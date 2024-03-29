# POMOPOMO 

<p align="center">
  <img src="https://github.com/Jaermis/POMOPOMO/assets/138207746/e6842a3e-0eb3-4329-9720-f85bc1882414" alt="pomopomo" width="300">
</p>

## Overview
POMOPOMO is a Pomodoro Android app built using Flutter. It helps users manage their time effectively by following the Pomodoro technique, a time management method that uses a timer to break down work into intervals, traditionally 25 minutes in length, separated by short breaks.

## Development
The app was developed based on a YouTube tutorial for the UI and general code logic. Modifications were made to correct some inaccuracies found in the tutorial. You can find the tutorial [here](https://www.youtube.com/watch?v=eJfzHB0kPbM&t=4552s). Additionally, independent learning was undertaken to implement features such as changing the app icon and utilizing notifications effectively. For notification implementation, the app utilizes [awesome_notifications](https://pub.dev/packages/awesome_notifications#%EF%B8%8F-notification-importance). The app icon is managed using [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons).

## Features
- **Time Range:** The app offers time intervals ranging from 5 minutes to 55 minutes, following a 5:1 focus-to-break ratio.
- **Rounds:** The app operates in cycles of 4 rounds. The first 3 rounds maintain the 5:1 ratio, while the 4th round uses the same time as the focus period for the long break.
- **Goal Tracking:** The timer automatically stops when the user's goal of completing 12 rounds is achieved.

## Notifications
Notifications are used to alert users of status changes, such as transitioning from focus to break and vice versa. This ensures that users stay informed and can manage their time effectively. However, I need assistance in implementing a feature where the app opens when the notification is pressed.

## Permissions
The app requires permission to show notifications in order to provide timely alerts to users.

Feel free to contribute or provide feedback to improve the app!
