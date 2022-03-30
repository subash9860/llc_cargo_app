import 'package:flutter/foundation.dart';

class Receive with ChangeNotifier {
  final String uid;
  final String email;
  final String displayName;
  final int phoneNumber;
  final String password;

  Receive(
      {required this.uid,
      required this.email,
      required this.displayName,
      required this.password,
      required this.phoneNumber});

  //receive data from server
  factory Receive.fromJson(Map<String, dynamic> json) {
    return Receive(
      uid: json['uid'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String,
      password: json['password'] as String,
      phoneNumber: json['phoneNumber'] as int,
    );
  }

// send data to server
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'password': password,
      'phoneNumber': phoneNumber,
    };
  }
}
