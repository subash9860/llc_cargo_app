import 'package:flutter/material.dart';
import 'package:llc/Screen/home_screen.dart';
import 'package:llc/Screen/ongoing_screen.dart';
import 'package:llc/Screen/tabs_screen.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Confirmation'),
      ),
      body: Column(
        children: [
          Container(
            height: 450,
            width: double.infinity,
            margin: const EdgeInsets.all(22),
            // padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
            decoration: BoxDecoration(
              color: const Color(0xFF171719),
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 10),
                    blurRadius: 10)
              ],
            ),
            child: const Text(
              'Confirmation',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text('Confirmation'),
                        content: const Text('Your Cargo has been booked'),
                        actions: [
                          ElevatedButton(
                            onPressed: () => Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => TabScreen(),
                            )),
                            child: const Text('OK'),
                          ),
                          ElevatedButton(
                            onPressed: () =>
                                Navigator.of(context).pop(MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            )),
                            child: const Text('No'),
                          ),
                        ],
                      ));
            },
            child: const Text("Confirm"),
          ),
        ],
      ),
    );
  }
}
