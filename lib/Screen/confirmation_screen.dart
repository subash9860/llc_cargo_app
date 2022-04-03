import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Screen/home_screen.dart';
import '../Screen/tabs_screen.dart';
import '../provider/form_data.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
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

            child: Column(
              children: [
                Consumer<FormDataModel>(
                  builder: (context, value, child) => Column(
                    children: [
                      Text(
                        "${value.items?.deliveryType.name.split('.').first}",
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
                Consumer<LocationModelData>(
                  builder: (context, value, child) => Column(
                    children: [
                      Text(
                        "From: ${value.items!.startingPoint}",
                        style: const TextStyle(color: Colors.white70),
                      ),
                      Text("To: ${value.items!.destination}",
                          style: const TextStyle(color: Colors.white70)),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Consumer<BookedDateTimeModel>(
                  builder: (context, value, child) => Column(
                    children: [
                      Text(
                        "Booked Date: ${value.items!.date.day}/${value.items!.date.month}/${value.items!.date.year}",
                        style: const TextStyle(color: Colors.white70),
                      ),
                      Text(
                        "Booked Time: ${value.items!.time.format(context)}",
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                const Text(
                  "Receiver info",
                  style: TextStyle(color: Colors.white),
                ),
                Consumer<ReceiverInfoModel>(
                  builder: (context, value, child) => Column(
                    children: [
                      Text(
                        "name: ${value.items!.fullName}",
                        style: const TextStyle(color: Colors.white70),
                      ),
                      Text(
                        "email: ${value.items!.email}",
                        style: const TextStyle(color: Colors.white70),
                      ),
                      Text(
                        "Phone Number: ${value.items!.phoneNumber}",
                        style: const TextStyle(color: Colors.white70),
                      ),
                      Text(
                        "Address: ${value.items!.address}",
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Billing",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          // Consumer<LocationModelData>(
          //   builder: ((context, value, child) => Column(
          //         children: [
          //           Text(value.items!.startingPoint),
          //           Text(value.items!.destination),
          //         ],
          //       )),
          // ),
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
                            onPressed: () =>
                                Navigator.of(context).pop(MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                              // Todo : add data to server and show success message
                            )),
                            child: const Text('No'),
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => const TabScreen(),
                            )),
                            child: const Text('OK'),
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
