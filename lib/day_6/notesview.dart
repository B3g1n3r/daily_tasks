import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Notesview extends StatefulWidget {
  final String notes;
   Notesview({super.key, required this.notes} );

  @override
  State<Notesview> createState() => _NotesviewState();
}

class _NotesviewState extends State<Notesview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),),),
      body: Center(
        child: Text(widget.notes, style: const TextStyle(
          fontSize: 20,
          
        ),),
      ),
    );
  }
}