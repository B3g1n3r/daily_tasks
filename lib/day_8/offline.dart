import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

class Offline {
  final user = FirebaseAuth.instance.currentUser!.uid;

  Future<void> setNotes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> notes = [];
    final snapshot = await FirebaseFirestore.instance
        .collection('Allnotes')
        .doc(user)
        .collection('notes').get();
    for (var doc in snapshot.docs) {
      notes.add(doc['content']);
    }

    await prefs.setStringList('notesList', notes); // consistent key
  }

  Future<List<String>?> getNotes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('notesList'); // same key
  }

  Future<void> deleteLocalNotes(int index, List<String> notes) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    notes.removeAt(index);
    prefs.setStringList('notesList', notes);
  }
}
