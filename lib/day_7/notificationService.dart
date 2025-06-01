import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

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

  Future<void> timeNotification(BuildContext context) async {

    final TimeOfDay? time = await showTimePicker(context: context, initialTime: currentTime);
    print("time is $time");
    const AndroidNotificationDetails andorid = AndroidNotificationDetails(
        'testing', 'testnot',
        priority: Priority.high);
    const NotificationDetails notification = NotificationDetails(android: andorid);
  //  if (time != null && time == TimeOfDay.now()) {
     
 notificationsPlugin.show(1, 'Timer notification', 'Hello', notification);
      
  //  }
   }
}
