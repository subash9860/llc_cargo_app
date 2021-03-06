import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:llc/provider/form_data.dart';
import 'package:provider/provider.dart';

import '../Screen/book_trip_screen.dart';
import './user_profile.dart';
import './home_screen.dart';
import './inbox_screen.dart';
import './trip_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Widget>> _page = [];

  @override
  initState() {
    FirebaseMessaging.instance.getInitialMessage().then((value) {
      if (value != null) {
        final routeFrontMessage = value.data['route'];
        print('routeFrontMessage: $routeFrontMessage');
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const InboxScreen();
        }));
      }
    });

    // forgroud notification
    FirebaseMessaging.onMessage.listen((data) {
      if (data.notification != null) {
        print(data.notification!.body);
        print(data.notification!.title);
      }
    });

    // when the app is in the background but oepnd and user taps
    // on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((data) {
      final routeFrontMessage = data.data['route'];
      print('routeFrontMessage: $routeFrontMessage');
      // if (data.notification != null) {
      // print(data.notification!.body);
      // print(data.notification!.title);
      // }
    });

    Provider.of<FormDataModel>(context, listen: false).getFromFirebase();
    Provider.of<LocationModelData>(context, listen: false)
        .getLocationFirebase();
    Provider.of<BookedDateTimeModel>(context, listen: false)
        .getDateTimeFirebase();
    Provider.of<ReceiverInfoModel>(context, listen: false)
        .getReceiverInfoFirebase();
    _page = [
      {
        'page': const HomeScreen(),
        'title': const Text(
          'Home',
          style: TextStyle(
              color: Color(0xFFE17C1E),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        )
      },
      {
        'page': const TripScreen(),
        'title': const Text(
          'Trip',
          style: TextStyle(
              color: Color(0xFFE17C1E),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        )
      },
      {
        'page': const InboxScreen(),
        'title': const Text(
          'Notifications',
          style: TextStyle(
              color: Color(0xFFE17C1E),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        )
      },
      {
        'page': const UserProfile(),
        'title': const Text(
          'Profile',
          style: TextStyle(
              color: Color(0xFFE17C1E),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        )
      },
    ];
    super.initState();
  }

  int _pageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90,
        title: _page[_pageIndex]['title'],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/appbar1.png'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          // Booking new trip screen
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const BookTripScreen()));
        },
        child: const Icon(Icons.local_shipping_outlined),
      ),
      body: _page[_pageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        currentIndex: _pageIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping_rounded),
            label: "Trip",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
