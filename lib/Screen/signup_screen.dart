import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../models/user_model.dart';

import './tabs_screen.dart';
// import '../models/user.dart';

import '../widgets/button_customized.dart';
// import '../widgets/login_textfield.dart';
import './login_screen.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
// form key
  final _formKey = GlobalKey<FormState>();

  // text field state
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void signupFunc(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _auth
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then(
            (user) => firestore
                .collection('users')
                .doc(user.user!.uid)
                .set(
                  {
                    'uid': user.user!.uid,
                    'email': _emailController.text,
                    'name': _nameController.text,
                    'phoneNumber': _phoneNumberController.text,
                    'password': _passwordController.text,
                  },
                  
                  //   uid: user.user!.uid,
                  //   email: _emailController.text,
                  //   name: _nameController.text,
                  //   password: _passwordController.text,
                  //   phoneNumber: int.parse(_phoneNumberController.text),
                  // ).toJson(),
                )
                .then(
                  (value) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TabScreen(),
                    ),
                  ),
                )
                .catchError(
                  (error) => Fluttertoast.showToast(
                      msg: error.toString(),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0),
                ),
          );
      // );

      // .then((user) => firestore.collection('users').document(user.uid).setData({
      //   'name': _nameController.text,
      //   'email': _emailController.text,
      //   'phoneNumber': _phoneNumberController.text,
      //   'password': _passwordController.text,
      //   'uid': user.uid,
      // })).then((value) => Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (_) => const TabsScreen(),
      //     )));
    }
  }

  //         .then((user) {
  //       Firestore.instance.collection('users').document(user.user!.uid).setData({
  //         'name': _nameController.text,
  //         'email': _emailController.text,
  //         'phoneNumber': _phoneNumberController.text,
  //         'password': _passwordController.text,
  //         'uid': user.user.uid,
  //       });
  //       Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => TabsScreen()));
  //     }).catchError((error) {
  //       print(error);
  //     });
  //   }

  //   Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (_) => const LoginPage(),
  //       ));
  // }

  @override
  Widget build(BuildContext context) {
// name text field
    final nameField = TextFormField(
      controller: _nameController,
      decoration: InputDecoration(
        labelText: 'Name',
        hintText: 'Enter your Full Name',
        prefixIcon: const Icon(Icons.face_outlined),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            style: BorderStyle.none,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter an full name.';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      // onSaved: (value) {
      //   // do something with value

      // },
    );

    // email text field
    final emailField = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: _emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        prefixIcon: const Icon(Icons.mail),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            style: BorderStyle.none,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter an email address';
        }
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      // onSaved: (value) {
      //   // do something with value

      // },
    );
    // password text field
    final phoneNumberField = TextFormField(
      keyboardType: TextInputType.phone,
      controller: _phoneNumberController,
      // obscureText: true,
      decoration: InputDecoration(
        labelText: 'Phone Number',
        hintText: 'Enter your phone number',
        prefixIcon: const Icon(Icons.call),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            style: BorderStyle.none,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a phone number';
        }
        if (value.length != 10) {
          return 'phone number should be of 10 digits';
        }
        // if (value.startsWith(98)) {
        //   return 'Enter phone number of Nepal';
        // }
        return null;
      },
      textInputAction: TextInputAction.done,
      // onSaved: (value) {
      //   // do something with value

      // },
    );

    // password text field
    final passwordField = TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        prefixIcon: const Icon(Icons.lock),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            style: BorderStyle.none,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a password';
        }
        if (!RegExp(
                r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
            .hasMatch(value)) {
          return 'Please enter a valid password';
        }
        if (value.length < 8) {
          return 'Password must be at least 8 characters';
        }
        if (value.length > 20) {
          return 'Password must be less than 20 characters';
        }
        if (!RegExp(
                r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
            .hasMatch(value)) {
          return 'Password must contain at least one lowercase letter, one uppercase letter, one number, and one special character';
        }
        return null;
      },
      textInputAction: TextInputAction.done,
      // onSaved: (value) {
      //   // do something with value

      // },
    );

    // email text field
    final passwordConfirmField = TextFormField(
      controller: _passwordConfirmController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'confirm password',
        hintText: 'Enter your password again',
        prefixIcon: const Icon(Icons.lock),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            style: BorderStyle.none,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter an password again';
        }
        if (value != _passwordController.text) {
          return 'Password does not match';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      // onSaved: (value) {
      //   // do something with value

      // },
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Create Account",
                    softWrap: true,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  const Text(
                    'Fill in the details to create an account and start sending your cargo!',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  nameField,
                  SizedBox(height: MediaQuery.of(context).size.height * 0.032),
                  emailField,
                  SizedBox(height: MediaQuery.of(context).size.height * 0.032),
                  phoneNumberField,
                  SizedBox(height: MediaQuery.of(context).size.height * 0.032),
                  passwordField,
                  SizedBox(height: MediaQuery.of(context).size.height * 0.032),
                  passwordConfirmField,
                  SizedBox(height: MediaQuery.of(context).size.height * 0.032),
                  ButtonCustomized(
                    height: MediaQuery.of(context).size.height * 0.065,
                    width: MediaQuery.of(context).size.width * 0.8,
                    butttonText: "Sign up",
                    buttonColor: Theme.of(context).colorScheme.primary,
                    buttonpress:
                        //  () => signupFunc(context),
                        () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        print(_nameController.text);
                        print(_emailController.text);
                        print(_phoneNumberController.text);
                        print(_passwordController.text);
                        print(_passwordConfirmController.text);
                        // _nameController.clear();
                        // _emailController.clear();
                        // _phoneNumberController.clear();
                        // _passwordController.clear();
                        // _passwordConfirmController.clear();
                        signupFunc(context);
                      }
                    },
                    textColor: Colors.white,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.80,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginPage(),
                            ));
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 18,
                              ),
                            ),
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void signup(String email, String password) {
  //   FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(email: email, password: password)
  //       .then((user) {
  //     postDetailsToFirestore();
  //     print("signed up");
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (_) => const TabScreen()));
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }

  // postDetailsToFirestore() async {
  // call the function to get the user details
  // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // UserData? user = _auth.currentUser;

  // User userdmodel = User(uid: uid, email: email, name: name)
  // }
}
