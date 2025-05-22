import 'package:daily_tasks/day_4/service/service.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  void logout() async{
    await Service().logout();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('homepage'),
          ),
          ElevatedButton(onPressed: logout, child: const Text('logout'))
        ],
      ),
    );
  }
}