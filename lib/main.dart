import 'package:daily_tasks/day_4/pages/wrapper.dart';
import 'package:daily_tasks/day_4/service/service.dart';
import 'package:daily_tasks/day_6/notespage.dart';
import 'package:daily_tasks/day_7/notificationService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final notificationService = Notificationservice();
  await notificationService.requestNotificationPermission();
  await notificationService.initialize();
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
      home: Wrapper(),
    );
  }
}