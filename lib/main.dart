import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import '../models/user_auth.dart';
import '../models/user_data.dart';
import './Screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserAuth>(
            lazy: false, create: (_) => UserAuth()),
        ChangeNotifierProvider<UserData>(
            lazy: false, create: (_) => UserData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange)
              .copyWith(secondary: Colors.black),
          primaryColor: Colors.deepOrange,
          appBarTheme: const AppBarTheme(
            elevation: 1,
            centerTitle: true,
            color: Colors.white,
            foregroundColor: Colors.deepOrange,
          ),
        ),
        title: 'Luxras Light Cargo',
        home: const SplashScreen(),
      ),
    );
  }
}
