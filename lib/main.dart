import 'package:daily_tasks/day_1/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'day_3/expandable_list.dart';

void main() {
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
      home: ExpandableList(),
    );
  }
}