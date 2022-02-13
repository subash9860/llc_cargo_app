// import 'dart:html';

import 'package:flutter/material.dart';
import '../widgets/dimension.dart';
// import 'package:luxras_light_cargo/widgets/login_textfield.dart';

class BookTripScreen extends StatefulWidget {
  const BookTripScreen({Key? key}) : super(key: key);

  @override
  State<BookTripScreen> createState() => _BookTripScreenState();
}

class _BookTripScreenState extends State<BookTripScreen> {
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
                  Stack(
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
                          child: Image.asset("./assets/parcel.png"),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Card(
                          color:const Color.fromARGB(255, 219, 214, 214),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(50),
                              top: Radius.circular(50),
                            ),
                          ),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.045,
                            width: MediaQuery.of(context).size.width * 0.080,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 3,
                        right: 3,
                        child: Card(
                          color:const Color.fromARGB(255, 245, 242, 242),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(50),
                              top: Radius.circular(50),
                            ),
                          ),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.035,
                            width: MediaQuery.of(context).size.width * 0.065,
                          ),
                        ),
                      )
                    ],
                  ),
                  // section one
                  Stack(
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
                          child: Image.asset("./assets/parcel.png"),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Card(
                          color: Colors.white70,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(50),
                              top: Radius.circular(50),
                            ),
                          ),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.045,
                            width: MediaQuery.of(context).size.width * 0.080,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 3,
                        right: 3,
                        child: Card(
                          color: Colors.deepOrange,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(50),
                              top: Radius.circular(50),
                            ),
                          ),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.035,
                            width: MediaQuery.of(context).size.width * 0.065,
                          ),
                        ),
                      )
                    ],
                  )
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
