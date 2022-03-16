import 'package:flutter/foundation.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './user_model.dart';

class UserData with ChangeNotifier {
  UserModel? _items;
  UserModel? get items => _items;

  Future<void> getUserData() async {
    final auth = FirebaseAuth.instance;

    CollectionReference users1 = FirebaseFirestore.instance.collection('users');

    DocumentSnapshot snapshot =
        await users1.doc('${auth.currentUser?.uid}').get();
    var data = snapshot.data() as Map;
    _items = UserModel(
      uid: data["uid"],
      email: data["email"],
      displayName: data["name"],
      password: data["password"],
      phoneNumber: int.parse(
        data["phoneNumber"],
      ),
    );
    notifyListeners();
  }
}
