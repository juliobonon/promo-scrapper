import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference promoCollection =
      FirebaseFirestore.instance.collection('promos');

  Future updateUserData(String name, String description) async {
    return await promoCollection.doc(uid).set({
      'name': name,
      'description': description,
    });
  }

  Stream<QuerySnapshot> get promos {
    return promoCollection.snapshots();
  }
}
