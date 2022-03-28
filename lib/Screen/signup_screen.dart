import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/user_auth.dart';
import '../widgets/button_customized.dart';
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

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userAuth = Provider.of<UserAuth>(context, listen: false);

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
        return null;
      },
      textInputAction: TextInputAction.done,
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
                    buttonpress: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        userAuth.signUp(
                            context,
                            _emailController.text,
                            _passwordController.text,
                            _nameController.text,
                            _phoneNumberController.text);
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
}
