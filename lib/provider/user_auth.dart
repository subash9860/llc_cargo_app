import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Screen/login_screen.dart';
import '../Screen/tabs_screen.dart';

class UserAuth extends ChangeNotifier {
  final auth = FirebaseAuth.instance;

  bool isLoggedIn() {
    return auth.currentUser != null;
  }

  void signUp(BuildContext context, String email, String password,
      String displayName, String phoneNumber) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) => FirebaseFirestore.instance
                  .collection('users')
                  .doc(user.user!.uid)
                  .set(
                {
                  'uid': user.user!.uid,
                  'email': email,
                  'name': displayName,
                  'phoneNumber': phoneNumber,
                  'password': password
                },
              ));
      Fluttertoast.showToast(
          msg: "Sign Up Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      notifyListeners();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const TabScreen()));
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.code.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      Exception(e);
    }
  }

  void login(BuildContext context, String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Fluttertoast.showToast(
          msg: "Login Successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      notifyListeners();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const TabScreen()));
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.code.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      Exception(e);
    }
  }

  void logout(BuildContext context) async {
    await auth.signOut();
    notifyListeners();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
