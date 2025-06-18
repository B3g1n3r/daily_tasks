// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';


class Database {
  int a = Random().nextInt(100);
  final CollectionReference sample =
      FirebaseFirestore.instance.collection('Sample');
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('Allnotes');

  Future<void> setText(String text) async {
    await sample
        .doc('number_one')
        .collection('new_sample')
        .add({'Description': '$text $a'});
  }

  Stream<List<QueryDocumentSnapshot>> getText() {
    return sample
        .doc('number_one')
        .collection('new_sample')
        .orderBy('Description')
        .snapshots()
        .map((snap) {
      return snap.docs;
    });
  }

  void deleteText(String id) async {
    await sample.doc('number_one').collection('new_sample').doc(id).delete();
    
  }

  // notes app
  Future<void> addNotes(String id, String content) async {
    await notes.doc(id).collection('notes').add({'content': content});
    print('notes added');
  }

  Stream<List<QueryDocumentSnapshot>> getNotes(String id) {
    return notes.doc(id).collection('notes').snapshots().map((snap) {
      return snap.docs;
    });
  }
  Future<void> deleteNotes(String uid, String notesId) async{
   await notes.doc(uid).collection('notes').doc(notesId).delete();
 
  }
  void updateNotes(String uid, String notesId, String note) async{
    await notes.doc(uid).collection('notes').doc(notesId).set({
      'content':note
    });
  }

  List<Map<String, dynamic>> snapData = [];

Future<void> fetchNotes() async {
  final snapshot = await FirebaseFirestore.instance.collection('notes').get();
  snapData = snapshot.docs.map((doc) => {
    'id': doc.id,
    'content': doc['content'],
  }).toList();
}
}
