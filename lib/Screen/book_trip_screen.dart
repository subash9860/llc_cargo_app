// import 'dart:html';

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:luxras_light_cargo/widgets/button_customized.dart';
import '../widgets/dimension.dart';
// import 'package:luxras_light_cargo/widgets/login_textfield.dart';

enum DeliveryType { luggage, parcel }
enum TransportationMode { roadway, railway, airway, waterway }

class BookTripScreen extends StatefulWidget {
  const BookTripScreen({Key? key}) : super(key: key);

  @override
  State<BookTripScreen> createState() => _BookTripScreenState();
}

class _BookTripScreenState extends State<BookTripScreen> {
  DeliveryType? _type = DeliveryType.luggage;

  TransportationMode? _mode = TransportationMode.airway;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: const Text(
            "New Trip",
            style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 28,
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
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: const Text("Delivrery Type",
                    style:
                        TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
              ),

              // ui for delivery type selection : Recommanded to use Radio button

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // for Delivery type
                  CardsForTrips(context, "./assets/luggage.png", "Luggage",
                      DeliveryType.luggage, "delivery"),
                  CardsForTrips(context, "./assets/parcel.png", "Parcel",
                      DeliveryType.parcel, "delivery"),
                ],
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                child: const Text("Dimension",
                    style:
                        TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
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
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  DimensionForGoods(hints: 5, topName: "Quantity", width: 175),
                  DimensionForGoods(
                      hints: 40.00, topName: "Weight (kg)", width: 175),
                ],
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                child: const Text("Transportation modes",
                    style:
                        TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CardsForTrips(context, "./assets/transport/road.png", "Truck",
                      TransportationMode.roadway, "transport"),
                  CardsForTrips(context, "./assets/transport/air.png",
                      "Airways", TransportationMode.airway, "transport"),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CardsForTrips(context, "./assets/transport/rail.png",
                      "railways", TransportationMode.railway, "transport"),
                  CardsForTrips(context, "./assets/transport/water.png",
                      "waterway", TransportationMode.waterway, "transport"),
                ],
              ),
              ButtonCustomized(butttonText: "continuous", buttonpress: (){

                // navigate to map screen
                
              }, buttonColor: Colors.deepOrange, textColor: Colors.white,
              
              height: MediaQuery.of(context).size.height * 0.08,
            width: double.infinity,
              
              )
            ],
          ),
        ),
      ),
    );
  }

  CardsForTrips(BuildContext context, String imageName, String cardName,
      dynamic val, String t) {
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
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.40,
          ),
        ),
        Positioned(
          top: 15,
          child: Image.asset(
            imageName,
            // "./assets/luggage.png",
            fit: BoxFit.contain,
            height: MediaQuery.of(context).size.height * 0.10,
            width: MediaQuery.of(context).size.width * 0.40,
          ),
        ),
        Positioned(
            bottom: 15,
            left: 32,
            child: Text(
              cardName,
              // "Luggage",
              style: const TextStyle(
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

        if (t == "delivery")
          Positioned(
            bottom: -3,
            right: -3,
            child: Transform.scale(
              scale: 2,
              child: Radio<DeliveryType>(
                value: val,
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
          )
        else
          Positioned(
            bottom: -3,
            right: -3,
            child: Transform.scale(
              scale: 1.9,
              child: Radio<TransportationMode>(
                value: val,
                groupValue: _mode,
                onChanged: (TransportationMode? val) {
                  setState(() {
                    _mode = val;
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
