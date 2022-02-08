import 'package:flutter/material.dart';
import '../widgets/listcard_previous.dart';

class PrevoiusScreen extends StatelessWidget {
  const PrevoiusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListcardPrevious(),
        ListcardPrevious(),
        ListcardPrevious(),
        ListcardPrevious(),
        ListcardPrevious(),
        ListcardPrevious(),
        ListcardPrevious(),
      ],
    );
  }
}
