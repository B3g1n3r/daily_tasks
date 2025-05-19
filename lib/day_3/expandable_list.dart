import 'package:flutter/material.dart';

class ExpandableList extends StatefulWidget {
  const ExpandableList({super.key});

  @override
  State<ExpandableList> createState() => _ExpandableListState();
}

class _ExpandableListState extends State<ExpandableList> {
  List<bool> list = [false,false,false];
  Color color = Colors.amber;
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: const Text('Expansion'),),
      body: Column(
        children: [
          AnimatedContainer(
           duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            width: isExpanded ? 200 : 100,
            height: isExpanded ? 200 : 100,
            color: isExpanded ? Colors.blue : Colors.red,
            alignment: Alignment.center,
            child: const Text("Tap Me", style: TextStyle(color: Colors.white)), ),
          ExpansionPanelList(
            expansionCallback: (index, isExpand){
              setState(() {
                list[index] = !list[index];
              });
            },
            children: List.generate(list.length, (index){
              return ExpansionPanel(
                isExpanded: list[index],
                headerBuilder: (context, isexpand){
                  return ListTile(title: Text('${index +1}'),);
              }, body: const Text('expansion content'));
            })
          ),
        ],
      ),
    );
  }
}