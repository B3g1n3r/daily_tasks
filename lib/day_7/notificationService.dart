import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:android_intent_plus/android_intent.dart';

class Notificationservice {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final TimeOfDay currentTime = TimeOfDay.now();

  Future<void> initialize() async {
    const AndroidInitializationSettings android =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings =
        InitializationSettings(android: android);

    await notificationsPlugin.initialize(settings);
    print('initialize');
  }

  Future<void> showNotification(String data) async {
    const AndroidNotificationDetails android = AndroidNotificationDetails(
        'notification_1', 'notify',
        importance: Importance.high, priority: Priority.high);
    const NotificationDetails notification =
        NotificationDetails(android: android);

    await notificationsPlugin.show(0, 'testing', data, notification);
    print(' show notification');
  }

  Future<void> requestNotificationPermission() async {
    print('request');
    var status = await Permission.notification.status;
    if (!status.isGranted) {
      await Permission.notification.request();
    } else {}
  }

 Future<void> sheduleNotification(BuildContext context) async {
  final time = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (time == null) return;

  final now = DateTime.now();

  // Schedule using the picked time
  var scheduledDate = tz.TZDateTime(
    tz.local,
    now.year,
    now.month,
    now.day,
    time.hour,
    time.minute,
  );

  if (scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(const Duration(days: 1));
  }

  const androidDetails = AndroidNotificationDetails(
    '0',
    'schedule',
    importance: Importance.high,
    priority: Priority.high,
  );

  const notificationDetails = NotificationDetails(android: androidDetails);

  print('📅 Scheduling for: $scheduledDate');

  await notificationsPlugin.zonedSchedule(
    1,
    'Scheduled Notification',
    'This is your scheduled reminder!',
    scheduledDate,
    notificationDetails,
    androidScheduleMode: AndroidScheduleMode.inexact,
  );
}


 Future<void> openExactAlarm() async{
  if (Platform.isAndroid) {
    const intent = AndroidIntent(
      action: 'android.settings.REQUEST_SCHEDULE_EXACT_ALARM',
    );

    try {
      await intent.launch();
    } catch (e) {
      print('error occurec $e');
    }
  }
 }

 
}
