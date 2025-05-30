import 'package:daily_tasks/day_4/pages/authenticate.dart';
import 'package:daily_tasks/day_4/service/service.dart';
import 'package:daily_tasks/day_6/notespage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});
  
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Service>(context);
    return StreamBuilder(stream: Stream.value(user.getUser),
     builder:(context, snap){
      if(snap.connectionState == ConnectionState.waiting){
        return const Center(child: CircularProgressIndicator(),);
      }else if(snap.hasData){
        return const Notespage();
      }else{
        return const Authenticate();
      }
     });
  }
}