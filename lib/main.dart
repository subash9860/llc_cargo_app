import 'package:flutter/material.dart';

import './Screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange)
            .copyWith(secondary: Colors.black),
        primaryColor: Colors.deepOrange,
        // accentColor : Colors.white,
        appBarTheme: const AppBarTheme(
          elevation: 2,
          // toolbarHeight: 70,
          centerTitle: true,
          // color: Colors.black,
          //  textTheme: Colors.black,

          backgroundColor: Colors.white,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.vertical(
          //       bottom: Radius.circular(18),
          //     ),
          //   ),
        ),
        //colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      ),
      title: 'Luxras Light Cargo',
      home: const SplashScreen(),
    );
  }
}
