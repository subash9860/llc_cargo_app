// import 'dart:html';

import 'package:flutter/material.dart';
import '../widgets/dimension.dart';
// import 'package:luxras_light_cargo/widgets/login_textfield.dart';

enum DeliveryType { luggage, parcel }

class BookTripScreen extends StatefulWidget {
  const BookTripScreen({Key? key}) : super(key: key);

  @override
  State<BookTripScreen> createState() => _BookTripScreenState();
}

class _BookTripScreenState extends State<BookTripScreen> {
  DeliveryType? _type = DeliveryType.luggage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: const Text(
            "New Trip",
            style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 32,
                fontWeight: FontWeight.bold),
          )),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                child: const Text("Delivrery Type",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),

              // ui for delivery type selection : Recommanded to use Radio button

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // for Delivery type/luggage
                  CardsForTrips(context, "./assets/luggage.png", "Luggage"),

                  CardsForTrips(context, "./assets/parcel.png", "Parcel"),


                  // for delivery type / parcel

                  // Stack(
                  //   children: [
                  //     Card(
                  //       color: const Color(0xFF171719),
                  //       shape: const RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.vertical(
                  //           bottom: Radius.circular(20),
                  //           top: Radius.circular(20),
                  //         ),
                  //       ),
                  //       child: SizedBox(
                  //         height: MediaQuery.of(context).size.height * 0.20,
                  //         width: MediaQuery.of(context).size.width * 0.40,
                  //       ),
                  //     ),
                  //     Positioned(
                  //       top: 20,
                  //       child: Image.asset(
                  //         "./assets/parcel.png",
                  //         fit: BoxFit.contain,
                  //         height: MediaQuery.of(context).size.height * 0.12,
                  //         width: MediaQuery.of(context).size.width * 0.40,
                  //       ),
                  //     ),
                  //     const Positioned(
                  //         bottom: 15,
                  //         left: 42,
                  //         child: Text(
                  //           "Parcel",
                  //           style: TextStyle(
                  //               color: Colors.white70,
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 24),
                  //         )),
                  //     Positioned(
                  //       bottom: 3,
                  //       right: 3,
                  //       child: Card(
                  //         color: const Color.fromARGB(255, 245, 242, 242),
                  //         shape: const RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.vertical(
                  //             bottom: Radius.circular(50),
                  //             top: Radius.circular(50),
                  //           ),
                  //         ),
                  //         child: SizedBox(
                  //           height: MediaQuery.of(context).size.height * 0.040,
                  //           width: MediaQuery.of(context).size.width * 0.075,
                  //         ),
                  //       ),
                  //     ),
                  //     // adding Radio button
                  //     Positioned(
                  //       bottom: -3,
                  //       right: -3,
                  //       child: Transform.scale(
                  //         scale: 2,
                  //         child: Radio(
                  //           value: DeliveryType.parcel,
                  //           groupValue: _type,
                  //           onChanged: (DeliveryType? val) {
                  //             setState(() {
                  //               _type = val;
                  //             });
                  //           },
                  //           fillColor: MaterialStateColor.resolveWith(
                  //               (states) => Colors.deepOrange),
                  //           toggleable: true,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(15, 15, 0, 5),
                child: const Text("Dimension",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  DimensionForGoods(
                      hints: 40.00, topName: "Length (cm)", width: 115),
                  DimensionForGoods(
                      hints: 40.00, topName: "width (cm)", width: 115),
                  DimensionForGoods(
                      hints: 40.00, topName: "height (cm)", width: 115),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  DimensionForGoods(hints: 5, topName: "Quantity", width: 165),
                  DimensionForGoods(
                      hints: 40.00, topName: "Weight (kg)", width: 165),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stack CardsForTrips(BuildContext context, String imageName, String cardName ) {
    return Stack(
                  children: [
                    Card(
                      color: const Color(0xFF171719),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(20),
                          top: Radius.circular(20),
                        ),
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.20,
                        width: MediaQuery.of(context).size.width * 0.40,
                      ),
                    ),
                    Positioned(
                      top: 15,
                      child: Image.asset(
                        imageName,
                        // "./assets/luggage.png",
                        fit: BoxFit.contain,
                        height: MediaQuery.of(context).size.height * 0.13,
                        width: MediaQuery.of(context).size.width * 0.40,
                      ),
                    ),
                     Positioned(
                        bottom: 15,
                        left: 25,
                        child: Text(
                          cardName,
                          // "Luggage",
                          style:const TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        )),
                    Positioned(
                      bottom: 3,
                      right: 3,
                      child: Card(
                        color: const Color.fromARGB(255, 245, 242, 242),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(50),
                            top: Radius.circular(50),
                          ),
                        ),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.040,
                          width: MediaQuery.of(context).size.width * 0.075,
                        ),
                      ),
                    ),
                    // adding Radio button
                    Positioned(
                      bottom: -3,
                      right: -3,
                      child: Transform.scale(
                        scale: 2,
                        child: Radio(
                          value: DeliveryType.luggage,
                          groupValue: _type,
                          onChanged: (DeliveryType? val) {
                            setState(() {
                              _type = val;
                            });
                          },
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.deepOrange),
                          toggleable: true,
                        ),
                      ),
                    ),
                  ],
                );
  }
}
