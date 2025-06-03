import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/timezone.dart' as tz;

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

 Future<void> sheduleNotification(BuildContext context) async{
  final time =  await showTimePicker(context: context, initialTime: TimeOfDay.now());
  final now = DateTime.now();
  
    var sheduleDate = tz.TZDateTime(
      tz.local,
    now.year,
    now.month,
    now.day,
    time!.hour,
    time.minute
  );

  if (sheduleDate.isBefore(now)) {
    sheduleDate = sheduleDate.add(const Duration(days: 1));
  }

  AndroidNotificationDetails androidNotificationDetails = const 
        AndroidNotificationDetails('0', 'shedule', priority: Priority.high, importance: Importance.high);
  NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails
  );
  
  await notificationsPlugin.zonedSchedule(1, 'schedule', "schedule check",
   sheduleDate, notificationDetails,
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,);
 }

 
}
