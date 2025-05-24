import 'package:daily_tasks/day_4/service/service.dart';
import 'package:flutter/material.dart';

import '../../day_5/database.dart';

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
          ElevatedButton(onPressed: logout, child: const Text('logout')),
          ElevatedButton(onPressed: (){
              Database().setText('Count');
            }, child: const Text('Add text')),
            Expanded(child: StreamBuilder(stream: Database().getText(), 
            builder: (context, snapshot){
              final data = snapshot.data;
              if (!snapshot.hasData || data == null || data.isEmpty) {
                return const Center(
                  child: Text('No data'),
                );
              }else{
                return  ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index){
                  return ListTile(title: Text(data[index]),);
                });
              }
            }))
        ],
      ),
    );
  }
}