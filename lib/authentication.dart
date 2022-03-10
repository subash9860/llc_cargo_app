import 'package:flutter/material.dart';

enum ApplicationState {
  loggedOut,
  emailAddress,
  register,
  password,
  loggedIn,
}

class Authentication extends StatelessWidget {
  const Authentication({
    Key? key,
    required this.loginState,
    required this.email,
    required this.startLoginFlow,
    required this.verifyEmail,
    required this.signInWithEmailAndPassword,
    required this.cancelRegistration,
    required this.registerWithEmailAndPassword,
    required this.signOut,
  }) : super(key: key);

  final ApplicationState loginState;
  final String? email;
  final void Function() startLoginFlow;
  final void Function(String email, void Function(Exception e) error)
      verifyEmail;
  final void Function(
          String email, String password, void Function(Exception e) error)
      signInWithEmailAndPassword;
  final void Function() cancelRegistration;
  final void Function(String email, String displayName, String password,
      void Function(Exception e) error) registerWithEmailAndPassword;
  final void Function() signOut;

  @override
  Widget build(BuildContext context) {
    switch (loginState) {
      case ApplicationState.loggedOut:
        // return _buildLoggedOut(context);
        // case ApplicationState.emailAddress:
        //   return _buildEmailAddress(context);
        // case ApplicationState.register:
        //   return _buildRegister(context);
        // case ApplicationState.password:
        //   return _buildPassword(context);
        // case ApplicationState.loggedIn:
        //   return _buildLoggedIn(context);
        // }

        return Container();
    }
  }
}
