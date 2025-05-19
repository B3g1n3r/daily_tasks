import 'package:daily_tasks/day_2/pages/page2.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Page 1'),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context, animation, second)=> Page2(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(1, 0);
                const end = Offset.zero;
                final tween = Tween(begin: begin, end: end);
                final curve = CurvedAnimation(parent: animation, curve: Curves.easeInOut);

                return SlideTransition(position: tween.animate(curve),
                child: child,);
              },));
            }, child: const Text('page2'))
          ],
        ),
      ),
    );
  }
}