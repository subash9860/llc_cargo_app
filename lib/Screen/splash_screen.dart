import 'dart:async';

import 'package:flutter/material.dart';

import './onbording_screen.dart';
import '../utils/splash_helpher.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // ignore: unused_field
  Timer? _timer;

  @override
  void initState() {
    _timer = Timer(const Duration(seconds: 3), () {
      // navigate to the next screen
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const OnboardingScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        heightFactor: MediaQuery.of(context).size.height,
        widthFactor: MediaQuery.of(context).size.width,
        child: FractionallySizedBox(
          heightFactor: 0.5,
          widthFactor: 0.5,
          child: Image.asset(
            Helper.getAssetName("splashImage", "splash.png"),
            alignment: Alignment.center,
          ),
        ),
      ),
      // )
    );
  }
}
