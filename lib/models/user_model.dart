// import 'package:flutter/foundation.dart';

class UserModel {
  final String uid;
  final String email;
  final String name;
  final int phoneNumber;
  final String password;

  UserModel(
      {required this.uid,
      required this.email,
      required this.name,
      required this.password,
      required this.phoneNumber});

  //recive data from server

  factory UserModel.fromJson(Map<String, dynamic>? json) {
    return UserModel(
      uid: json!['uid'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      password: json['password'] as String,
      phoneNumber: json['phoneNumber'] as int,
    );
  }


// send data to server
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'name': name,
      'password': password,
      'phoneNumber': phoneNumber,
    };
  }
}
