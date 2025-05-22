import 'package:daily_tasks/day_1/provider.dart';
import 'package:daily_tasks/day_4/pages/homepage.dart';
import 'package:daily_tasks/day_4/pages/wrapper.dart';
import 'package:daily_tasks/day_4/service/service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'day_3/expandable_list.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(create: (_)=> Service(), 
    child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Wrapper(),
    );
  }
}