// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:llc/Screen/login_screen.dart';
import '../models/user_model.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  // User? _user = FirebaseAuth.instance.currentUser;

  // UserModel? _userModel;

  // @override
  // void initState() {
  //   super.initState();

  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(_user?.uid)
  //       .get()
  //       .then((value) {
  //     this._userModel = UserModel.fromJson(value.data());
  //     setState(() {
  //       this._userModel = this._userModel;
  //       // });
  //     });
  // setState() {
  // _userModel = value.data() as UserModel;
  // });
  // });

  // _userModel. = UserModel.fromJson(_user?.providerData.first.displayName);
  // _userModel = UserModel.fromJson(_user?.providerData.first?.toJson());
  // FirebaseFirestore.instance
  //     .collection('users')
  //     .doc(_user!.uid)
  //     .get()
  //     .then((value) {
  //   this._userModel = UserModel.fromJson(value.);

  //   setState(() {
  //     _userModel = UserModel.fromJson(value.data());
  //   });
  // });
  // }

  Future<void> _signOut(BuildContext context) async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        print(currentUser.uid);
      }
      await FirebaseAuth.instance
          .signOut()
          .then((value) => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              ));
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Error: $e',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Stack(children: [
              const CircleAvatar(
                radius: 93,
                backgroundImage: AssetImage('./assets/pp.jpg'),
              ),
              Positioned(
                left: 146,
                bottom: 40,
                child: CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.perm_identity_outlined),
                  ),
                ),
              ),
            ]),
          ),
        ),
        const Text(
          // '${UserModel.name}',
          // _userModel?.name,
          // _userModel?.name ??
          "Andrew Dalton",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const Text(
          "Member since 20 aug 2021",
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey),
        ),
        const SizedBox(
          height: 25,
        ),
        Column(
          children: [
            const Divider(thickness: 2.0, endIndent: 30.0, indent: 12.0),
            Card(
              child: ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: IconButton(
                          onPressed: () {},
                          icon:
                              const Icon(Icons.settings, color: Colors.white))),
                  title: const Text("User Setting",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600))),
            ),
            Card(
              child: ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.credit_card,
                              color: Colors.white))),
                  title: const Text("Payment Setting",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600))),
            ),
            Card(
              child: ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.translate,
                              color: Colors.white))),
                  title: const Text("Change language",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600))),
            ),
            Card(
              child: ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 22,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.rule_sharp,
                              color: Colors.white))),
                  title: const Text("Terms and Condition",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600))),
            ),
            Card(
              child: ListTile(
                  onTap: () => _signOut(context),
                  leading: const CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(Icons.logout, color: Colors.white)),
                  title: const Text("Log Out",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600))),
            ),
          ],
        )
      ],
    );
  }
}
