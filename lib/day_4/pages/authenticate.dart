import 'package:daily_tasks/day_4/service/service.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  void login() async{
    await Service().login('email@emai.com', 'password');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Authenticate', style: TextStyle(fontSize: 30),),),
          ElevatedButton(onPressed: login, child: Text('login'))
        ],
      ),
    );
  }
}