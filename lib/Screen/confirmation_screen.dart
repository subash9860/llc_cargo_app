import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Screen/tabs_screen.dart';
import '../provider/form_data.dart';
import '../Screen/book_trip_screen.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      Row(
                        children: [
                          (value.items?.deliveryType.name.toString() ==
                                  DeliveryType.parcel.name)
                              ? SizedBox(
                                  width: 100,
                                  child: Center(
                                      child: Image.asset('assets/parcel.png')))
                              : Image.asset('assets/luggage.png'),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Dimension: ${value.items?.length} x ${value.items?.width} x ${value.items?.height}cm",
                                style: const TextStyle(
                                    // fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70),
                              ),
                              // const SizedBox(height: 10),
                              Text(
                                "Weight:\t\t\t\t\t\t ${value.items?.weight}kg",
                                style: const TextStyle(
                                    // fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70),
                              ),
                              // const SizedBox(height: 10),
                              Text(
                                "Quantity:\t\t\t\t ${value.items?.quantity}",
                                style: const TextStyle(
                                    // fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70),
                              ),
                              // const SizedBox(height: 10),
                              Text(
                                "Vai : \t\t\t\t\t\t\t\t\t\t\t ${value.items?.transportationMode.name.split('.').first}",
                                style: const TextStyle(
                                    // fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70),
                              ),

                              Consumer<LocationModelData>(
                                builder: (context, value, child) => Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "From: \t\t\t\t\t\t\t\t ${value.items!.startingPoint}",
                                      style: const TextStyle(
                                          color: Colors.white70),
                                    ),
                                    Text(
                                        "To: \t\t\t\t\t\t\t\t\t\t\t\t ${value.items!.destination}",
                                        style: const TextStyle(
                                            color: Colors.white70)),
                                  ],
                                ),
                              ),

                              Consumer<BookedDateTimeModel>(
                                builder: (context, value, child) => Text(
                                  "Date: \t\t\t\t\t\t\t\t ${value.items!.date.day}/${value.items!.date.month}/${value.items!.date.year}, ${value.items!.time.format(context)}",
                                  style: const TextStyle(color: Colors.white70),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Receiver info",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(height: 10),
                Consumer<ReceiverInfoModel>(
                  builder: (context, value, child) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name: \t\t\t\t\t ${value.items!.fullName}",
                        style: const TextStyle(color: Colors.white70),
                      ),
                      Text(
                        "Email:  \t\t\t\t\t ${value.items!.email}",
                        style: const TextStyle(color: Colors.white70),
                      ),
                      Text(
                        "Phone No:\t${value.items!.phoneNumber}",
                        style: const TextStyle(color: Colors.white70),
                      ),
                      Text(
                        "Address:\t\t\t ${value.items!.address}",
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Billing",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(height: 10),
                const Text(
                  "transportation charge: \t\t Rs 1000",
                  style: TextStyle(color: Colors.white70),
                ),
                const Text(
                  "Emergency charge: \t\t\t\t\t\t\t Rs 100",
                  style: TextStyle(color: Colors.white70),
                ),
                const Text(
                  "Service charge: \t\t\t\t\t\t\t\t\t\t\t\t\t\t Rs 10",
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 10),
                const Divider(
                  height: 5,
                  color: Color(0xFFFFFFFF),
                  endIndent: 100,
                ),
                const Text(
                  "Total: \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Rs 1110",
                  style: TextStyle(fontSize: 20, color: Colors.white70),
                ),
                const Text(
                  "Payment Vai: \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Cash on delivery",
                  style: TextStyle(color: Colors.white70),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.07,
              child: const Center(
                child: Text(
                  "Confirm",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Confirmation'),
                  content: const Text('Your Cargo has been booked.'),
                  actions: [
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('No'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // store data on firebase if booked is comfirmed
                        StoreInFirebaseModel().storeInFirebase();

                        // FirebaseFirestore.instance.collection('booked').doc(
                        //   '${auth.currentUser?.uid}'
                        // ).set({

                        //   'booked': true,
                        //   'bookingId': '${auth.currentUser?.uid}',
                        //   'bookingDate': DateTime.now(),
                        //   'bookingTime': DateTime.now(),
                        //   'bookingStatus': 'comfirmed',
                        //   'bookingType':    '${value.items!.transportationMode.name.split('.').first}',
                        //   'bookingFrom': '${value.items!.startingPoint}',
                        //   'bookingTo': '${value.items!.destination}',
                        //   'bookingDateTime': '${value.items!.date.day}/${value.items!.date.month}/${value.items!.date.year}, ${value.items!.time.format(context)}',
                        //   'bookingReceiverName': '${value.items!.fullName}',
                        //   'bookingReceiverEmail': '${value.items!.email}',
                        //   'bookingReceiverPhone': '${value.items!.phoneNumber}',
                        //   'bookingReceiverAddress': '${value.items!.address}',
                        //   'bookingTransportationCharge': 1000,
                        //   'bookingEmergencyCharge': 100,
                        //   'bookingServiceCharge': 10,
                        //   'bookingTotal': 1110,
                        //   'bookingPayment': 'Cash on delivery',
                        // });

                        // 'cargoId': value.items!.id,
                        // 'cargoName': value.items!.name,
                        // 'cargoWeight': value.items!.weight,
                        // 'cargoQuantity': value.items!.quantity,
                        // 'cargoTransportationMode': value.items!.transportationMode.name.split('.').first,
                        // 'cargoStartingPoint': value.items!.startingPoint,
                        // 'cargoDestination': value.items!.destination,
                        // 'cargoDate': value.items!.date.toString(),
                        // 'cargoTime': value.items!.time.toString(),
                        // 'cargoReceiverName': value.items!.fullName,
                        // 'cargoReceiverEmail': value.items!.email,
                        // 'cargoReceiverPhoneNumber': value.items!.phoneNumber,
                        // 'cargoReceiverAddress': value.items!.address,
                        // 'cargoTotal': value.items!.total,
                        // 'cargoPaymentMode': value.items!.paymentMode.name.split('.').first,
                        // });

                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const TabScreen(),
                          ),
                        );
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
