import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Screen/home_screen.dart';
import '../Screen/tabs_screen.dart';
import '../provider/form_data.dart';

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
            // child: Container(
            // padding: const EdgeInsets.all(8.0),
            // alignment: Alignment.topCenter,

            child: Consumer<FormDataModel>(
              builder: (context, value, child) => Column(
                children: [
                  Text(
                    "${value.items?.deliveyType.name.split('.').first}",
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Dimension: ${value.items?.length}cm x ${value.items?.width}cm x ${value.items?.height}cm",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Weight: ${value.items?.weight}kg",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Quantity: ${value.items?.quantity}",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Via: ${value.items?.transportationMode.name.split('.').first}",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70),
                  ),
                ],
              ),
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
                              builder: (context) => const TabScreen(),
                            )),
                            child: const Text('OK'),
                          ),
                          ElevatedButton(
                            onPressed: () =>
                                Navigator.of(context).pop(MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
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
