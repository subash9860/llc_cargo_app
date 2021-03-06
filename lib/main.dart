import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import './provider/user_auth.dart';
import './provider/user_data.dart';
import './Screen/splash_screen.dart';
import './provider/form_data.dart';

// Reciecve message when app is in the background
Future<void> backgroundHandler(RemoteMessage message) async {
  print('backgroundHandler');
  print(message.data);
  print(message.notification!.title);
  print(message.toString());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
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
        ChangeNotifierProvider<FormDataModel>(
            lazy: false, create: (_) => FormDataModel()),
        ChangeNotifierProvider<LocationModelData>(
            lazy: false, create: (_) => LocationModelData()),
        ChangeNotifierProvider<BookedDateTimeModel>(
            lazy: false, create: (_) => BookedDateTimeModel()),
        ChangeNotifierProvider<ReceiverInfoModel>(
            lazy: false, create: (_) => ReceiverInfoModel())
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
