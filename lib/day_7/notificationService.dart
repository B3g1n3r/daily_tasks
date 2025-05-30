import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class Notificationservice {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {

    requestNotificationPermission();
    const AndroidInitializationSettings android =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings =
        InitializationSettings(android: android);

    await notificationsPlugin.initialize(settings);
    print('initialize');
  }

  Future<void> showNotification() async {
    const AndroidNotificationDetails android = AndroidNotificationDetails('notification_1', 'notify',
        importance: Importance.high, priority: Priority.high);
    const NotificationDetails notification = NotificationDetails(android: android);

    await notificationsPlugin.show(0, 'testing', 'Deleted', notification);    
    print(' show notification');
  }

 Future<void> requestNotificationPermission() async {
  print('request');
  var status = await Permission.notification.status;
  if (!status.isGranted) {
    await Permission.notification.request();
  }
}
}
