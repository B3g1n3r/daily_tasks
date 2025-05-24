import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  int a = 0;
  final CollectionReference sample =
      FirebaseFirestore.instance.collection('Sample');

  Future<void> setText(String text) async {
    await sample
        .doc('number_one')
        .collection('new_sample')
        .add({'Description': '$text ${a++}'});
    print('added succesfully');
  }

  Stream<List<String>> getText() {
    return sample
        .doc('number_one')
        .collection('new_sample')
        .snapshots()
        .map((snap) {
      return snap.docs.map((doc) {
        final data = doc.data();
        return data['Description'] as String;
      }).toList();
    });
  }
  
}
