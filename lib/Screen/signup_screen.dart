import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:llc/Screen/tabs_screen.dart';
import 'package:llc/models/user.dart';

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

  void signupFunc(BuildContext context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const LoginPage(),
        ));
  }

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
                        _nameController.clear();
                        _emailController.clear();
                        _phoneNumberController.clear();
                        _passwordController.clear();
                        _passwordConfirmController.clear();
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

  void signup(String email, String password) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) {
      postDetailsToFirestore();
      print("signed up");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const TabScreen()));
    }).catchError((e) {
      print(e);
    });
  }

  postDetailsToFirestore() async {
    // call the function to get the user details
    FirebaseFirestore firebaseFirestore= FirebaseFirestore.instance;

    // UserData? user = _auth.currentUser;

    // User userdmodel = User(uid: uid, email: email, name: name)

    
  }
}
