import 'package:daily_tasks/day_1/provider.dart';
import 'package:daily_tasks/day_4/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'day_3/expandable_list.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(create: (_)=> ThemeProvider(), 
    child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.themeMode,
      home: Homepage(),
    );
  }
}