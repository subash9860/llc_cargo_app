import 'package:flutter/material.dart';

class ReceiverInfoScreen extends StatelessWidget {
  const ReceiverInfoScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Receiver Info'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            

          const  Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}