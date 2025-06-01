import 'package:daily_tasks/day_5/database.dart';
import 'package:daily_tasks/day_7/notificationService.dart';
import 'package:flutter/material.dart';

class Notesview extends StatefulWidget {
  final String notes;
   final String uid;
    final String notesId;
   Notesview({super.key, required this.notes, required this.uid, required this.notesId} );

  @override
  State<Notesview> createState() => _NotesviewState();
}

class _NotesviewState extends State<Notesview> {

  final text = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    text.text = widget.notes;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note'),
        leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: TextFormField(
                controller: text,
                minLines: 5,
                maxLines: 20,
                decoration: const InputDecoration(
                  border: OutlineInputBorder()
                ),
              ),
            ),
            const SizedBox(height: 30,),
            OutlinedButton(onPressed: (){
              Database().updateNotes(widget.uid, widget.notesId, text.text);
            }, child:const Text('Update')),
            OutlinedButton(onPressed: (){
              Notificationservice().timeNotification(context);
            }, child:const Text('time'))
          ],
        ),
      ),
    );
  }
}