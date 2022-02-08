import 'package:flutter/material.dart';

import '../widgets/button_customized.dart';
import '../widgets/login_textfield.dart';
import './login_screen.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);
  void signupFunc(BuildContext context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const LoginPage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // title: Image.asset('assets/appbar1.png'),
      // ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 18),
          height: MediaQuery.of(context).size.height * 0.99,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.157,
                  width: MediaQuery.of(context).size.width * 0.87,
                  child: Column(
                    children: [
                      Text(
                        "Create Account",
                        softWrap: true,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Fill in the details to create an account and start sending your cargo!',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const LginTextField(
                  textName: "First Name",
                  iconName: Icon(
                    Icons.face_outlined,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.032,
                ),
                const LginTextField(
                  textName: "Email",
                  iconName: Icon(
                    Icons.email_outlined,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.032,
                ),
                const LginTextField(
                  textName: "Phone number",
                  iconName: Icon(
                    Icons.phone_outlined,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.032,
                ),
                const LginTextField(
                  textName: "Password",
                  iconName: Icon(
                    Icons.lock_outline,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.032,
                ),
                const LginTextField(
                  textName: "Confirm password",
                  iconName: Icon(
                    Icons.lock_outline,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.062,
                ),
                ButtonCustomized(
                  height: MediaQuery.of(context).size.height * 0.080,
                  width: MediaQuery.of(context).size.width * 0.8,
                  butttonText: "Sign up",
                  buttonColor: Theme.of(context).colorScheme.primary,
                  buttonpress: () => signupFunc(context),
                  textColor: Colors.white,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *0.06,
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoginPage(),
                          ));
                    },
                    child: const Text(
                      "Already have an account? "
                      "login",
                      softWrap: true,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
