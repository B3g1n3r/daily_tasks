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

    Stream<List<QueryDocumentSnapshot>> getText() {
      return sample
          .doc('number_one')
          .collection('new_sample')
          .snapshots()
          .map((snap) {
        return snap.docs;
      });
    }
  

  void deleteText(String id) async {
    await sample.doc('number_one').collection('new_sample').doc(id).delete();
  }
}
