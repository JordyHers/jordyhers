import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<bool> saveEmail(String email) async {
    bool result = false;
    try {
      users
          .add({'email': email})
          .then((value) => print("User Added"))
          .whenComplete(() => result = true);
    } catch (e) {
      print("Failed to add user: $e");
      result = false;
    }
    return result;
  }
}
