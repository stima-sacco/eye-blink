import 'dart:isolate';

import 'package:eye_blink_reminder/src/widgets/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'src/app.dart';

const String tag = "BackGround_Work";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await AndroidAlarmManager.initialize();
  await NotificationService().init();
  runApp(const App());
  // const int helloAlarmID = 0;
  // final DateTime now = DateTime.now().add(const Duration(minutes: 2));
  // await AndroidAlarmManager.periodic(
  //     const Duration(minutes: 1), helloAlarmID, printHello,
  //     startAt: now);
}

void printHello() {
  final DateTime now = DateTime.now();
  final int isolateId = Isolate.current.hashCode;
  // ignore: avoid_print
  print("[$now] Hello, world! isolate=$isolateId function='$printHello'");
}

Future<void> init() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');

  // final IOSInitializationSettings initializationSettingsIOS =
  //     const IOSInitializationSettings(
  //   requestSoundPermission: false,
  //   requestBadgePermission: false,
  //   requestAlertPermission: false,
  //   onDidReceiveLocalNotification: onDidReceiveLocalNotification,
  // );

  // ignore: unused_local_variable
  const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: null, macOS: null);

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: selectNotification);
}

Future selectNotification(String? payload) async {
  //Handle notification tapped logic here
}
