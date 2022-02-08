import 'package:flutter/material.dart';
import '../widgets/listcard_ongoing.dart';

class OngoingScreen extends StatelessWidget {
  const OngoingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListCard(),
        ListCard(),
        ListCard(),
        ListCard(),
        ListCard(),
        ListCard(),
        ListCard(),
        ListCard(),
      ],
    );
  }
}
