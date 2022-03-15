class User {
  final String uid;
  final String email;
  final String name;

  User({required this.uid, required this.email, required this.name});

  //recive data from server

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
    );
  }

// send data to server
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'name': name,
    };
  }

}
