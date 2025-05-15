
import 'package:daily_tasks/day_1/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeTestPage extends StatefulWidget {
   ThemeTestPage({super.key});

  @override
  State<ThemeTestPage> createState() => _ThemeTestPageState();
}

class _ThemeTestPageState extends State<ThemeTestPage> {

  bool isDarkTheme = false;

  void putTheme(bool isDark) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('theme', isDark);
    pref.setString('type', '');
    print('settedd $isDarkTheme');
  }
@override
void initState() {
  super.initState();
  getTheme(); // async call
}

void getTheme() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool savedTheme = pref.getBool('theme') ?? false;

  setState(() {
    isDarkTheme = savedTheme;
  });

  print('Theme loaded: $isDarkTheme');
}

  @override
  Widget build(BuildContext context) {
      final theme = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Test"),
        actions: [
          IconButton(onPressed: (){
         
           setState(() {
             isDarkTheme = !isDarkTheme;
             print('object $isDarkTheme');
             putTheme(isDarkTheme);
           });
          theme.toggle(isDarkTheme);
          }, icon: isDarkTheme ? const Icon(Icons.visibility_outlined) : const Icon(Icons.visibility_off_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "This is bodyLarge text",
              style: TextStyle(fontSize: 16), // Uses textTheme.bodyLarge
            ),
            const SizedBox(height: 16),
            const Text(
              "This is bodyMedium text",
              style: TextStyle(fontSize: 14), // Uses textTheme.bodyMedium
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Sample Button"),
            ),
            const SizedBox(height: 16),
           
          ],
        ),
      ),
    );
  }
}
