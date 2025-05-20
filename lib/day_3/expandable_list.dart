import 'package:flutter/material.dart';

class ExpandableList extends StatefulWidget {
  const ExpandableList({super.key});

  @override
  State<ExpandableList> createState() => _ExpandableListState();
}

class _ExpandableListState extends State<ExpandableList> {
  List<bool> list = [false, false, false];
  Color color = Colors.amber;
  bool isExpanded = false;
  bool animate = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expansion'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                animate = !animate;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              width: animate ? 200 : 100,
              height: animate ? 200 : 100,
              color: animate ? Colors.blue : Colors.red,
              alignment: Alignment.center,
              child:
                  const Text("Tap Me", style: TextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded =!isExpanded;
              });
            },
            child:  AnimatedCrossFade(
                firstChild: const ColoredBox(color: Colors.black, child: SizedBox(height: 100,width: 100,),),
                secondChild: const ColoredBox(color: Colors.red ,child: SizedBox(height: 200,width: 200,),),
                crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: const Duration(seconds: 2), 
                firstCurve: Curves.easeIn,
                secondCurve: Curves.bounceOut,
                reverseDuration: Duration(seconds: 2),
                sizeCurve: Curves.bounceIn,
                excludeBottomFocus: false,),
          ),
          ExpansionPanelList(
              expansionCallback: (index, isExpand) {
                setState(() {
                  list[index] = !list[index];
                });
              },
              children: List.generate(list.length, (index) {
                return ExpansionPanel(
                    isExpanded: list[index],
                    headerBuilder: (context, isexpand) {
                      return ListTile(
                        title: Text('${index + 1}'),
                      );
                    },
                    body: const Text('expansion content'));
              })),
        ],
      ),
    );
  }
}
