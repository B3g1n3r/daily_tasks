import 'package:daily_tasks/day_4/pages/wrapper.dart';
import 'package:daily_tasks/day_4/service/service.dart';
import 'package:daily_tasks/day_7/notificationService.dart';
import 'package:daily_tasks/day_9/cloud_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Kolkata'));
  await Firebase.initializeApp();
  final notificationService = Notificationservice();
  await notificationService.requestNotificationPermission();
  // await notificationService.openExactAlarm();
  await notificationService.initialize();
  // TimeZone.UTC.
  runApp(
    ChangeNotifierProvider(create: (_)=> Service(), 
    child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      title: 'Flutter Demo',
      home: CloudStorage(),
    );
  }
}