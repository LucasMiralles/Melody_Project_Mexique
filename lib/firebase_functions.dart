import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  static saveUser(email, uid) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({'email': email});
  }
}