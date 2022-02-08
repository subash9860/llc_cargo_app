import 'package:flutter/material.dart';

import '../widgets/button_customized.dart';
import '../widgets/login_textfield.dart';
import './tabs_screen.dart';
import './signup_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  void loginFunc(BuildContext context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const TabScreen(),
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
          margin: const EdgeInsets.only(top: 5),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                 Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary
                  ),
                  
                ),
               const Text("Login to continue"),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Image.asset('assets/loginScreenImage.png'),
                const LginTextField(
                  textName: "Email",
                  iconName: Icon(
                    Icons.email_outlined,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                const LginTextField(
                  textName: "Password",
                  iconName: Icon(
                    Icons.lock_outline,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 25, 5),
                    child: TextButton(
                      onPressed: () {
                        //  forget password
                      },
                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                ButtonCustomized(
                  height: MediaQuery.of(context).size.height * 0.080,
                  width: MediaQuery.of(context).size.width * 0.8,
                  butttonText: "Login",
                  buttonColor: Theme.of(context).colorScheme.primary,
                  buttonpress: () => loginFunc(context),
                  textColor: Colors.white,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *0.06,
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => const SignupPage()));
                    },
                    child: const Text(
                      "Don't have an account? Create One",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
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
