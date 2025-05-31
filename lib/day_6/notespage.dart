import 'package:daily_tasks/day_5/database.dart';
import 'package:daily_tasks/day_6/notesview.dart';
import 'package:daily_tasks/day_7/notificationService.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Notespage extends StatefulWidget {
  const Notespage({super.key});

  @override
  State<Notespage> createState() => _NotespageState();
}

class _NotespageState extends State<Notespage> {
  final user = FirebaseAuth.instance.currentUser!.uid;
  final notes = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Notificationservice().initialize();
  }
  @override
  Widget build(BuildContext context) {
    print('user $user');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
                stream: Database().getNotes(user),
                builder: (context, snap) {
                  final snapData = snap.data;
                  if (!snap.hasData || snapData == null || snapData.isEmpty) {
                    return const Center(
                      child: Text('Add your notes'),
                    );
                  } else {
                    return GridView.builder(
                      itemCount: snapData.length,
                      itemBuilder: (context, index) {
                        final doc = snapData[index];
                        final String content = doc['content'] ?? 'no notes';
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    transitionDuration:
                                        const Duration(seconds: 2),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      const begin = Offset(1, 0);
                                      const end = Offset.zero;
                                      final curve = CurvedAnimation(
                                          parent: animation,
                                          curve: Curves.easeInCubic);
                                      final tween =
                                          Tween(begin: begin, end: end);
                                      // return FadeTransition(opacity: animation, child: child,);
                                      return SlideTransition(
                                        position: tween.animate(curve),
                                        child: child,
                                      );
                                    },
                                    pageBuilder: (context, ani1, ani2) =>
                                        Notesview(
                                            uid: user,
                                            notesId: snapData[index].id,
                                            notes: content)));
                          },
                          child: GestureDetector(
                            onLongPress: () {
                              Database().deleteNotes(user, snapData[index].id);
                              Notificationservice().showNotification(doc['content'] ??'no data');
                            },
                            child: Card(
                                color: Colors.greenAccent,
                                child: Center(
                                    child: Text(
                                  content,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ))),
                          ),
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 3 / 2,
                        crossAxisCount: 2,
                      ),
                    );
                  }
                }),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: notes,
                decoration: InputDecoration(
                  hintText: 'Notes',
                  suffix: GestureDetector(
                    onTap: () {
                      Database().addNotes(user, notes.text);
                      notes.clear();
                    },
                    child: const Icon(Icons.send_rounded),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
