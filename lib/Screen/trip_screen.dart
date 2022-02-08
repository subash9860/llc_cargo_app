import 'package:flutter/material.dart';
import '../Screen/ongoing_screen.dart';
import '../Screen/previous_screen.dart';

class TripScreen extends StatelessWidget {
  const TripScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      width: double.infinity,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: TabBar(
             // solve tab controller error
             padding: const EdgeInsets.all(5),
            labelPadding: const EdgeInsets.only(top: 8),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: const EdgeInsets.only(top: 5),
            unselectedLabelColor: Colors.black,
            indicator: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            tabs: const [
              Tab(text: "Ongoing"),
              Tab(text: "Previous"),
            ],
          ),
          body: const TabBarView(
            children: [
              OngoingScreen(),
              PrevoiusScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
