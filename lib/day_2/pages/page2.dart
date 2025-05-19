import 'package:daily_tasks/day_2/pages/page1.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('page2'),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, second) => Page1(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      // Use push for fade in, pop for scale out
                      if (animation.status == AnimationStatus.forward) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      } else {
                        return ScaleTransition(
                          scale: animation,
                          child: child,
                        );
                      }
                    },
                  ));
                },
                child: const Text('Page1'))
          ],
        ),
      ),
    );
  }
}
