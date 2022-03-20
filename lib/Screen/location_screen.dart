import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  bool starting = true;
  LatLng startingPoint = LatLng(27.6710, 85.4298);
  LatLng destinationPoint = LatLng(27.667246, 85.436371);

  final _formKey = GlobalKey<FormState>();
  final _satrtingTextController = TextEditingController();
  final _destinationTextController = TextEditingController();

  // late List<Location> locations;
  // late List<Placemark> placemarks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                center: startingPoint,
                zoom: 15,
                // change postion of marker point where we tap on map
                onTap: (tapPosition, pointT) {
                  // change lat long to place name

                  locationFromAddress("bhaktapur multiple campus")
                      .then((value) {
                    if (value.isEmpty) {
                      print("no palce found");
                    } else {
                      print(value[0].toString());
                    }
                  });

                  // placemarkFromCoordinates(27.6710, 85.4298).then(
                  //   (value) {
                  //     if (value.isEmpty) {
                  //       print("No results found");
                  //     } else {
                  //       print(value[0].toString());
                  //     }
                  //     setState(() {
                  //       (starting)
                  //           ? startingPoint = pointT
                  //           : destinationPoint = pointT;
                  //       print(starting);
                  //       print(tapPosition.relative?.distance);
                  //       print(pointT);
                  //     });
                  //   },
                  // );
                },
              ), // set the map's center
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ), // add a tile layer
                MarkerLayerOptions(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: startingPoint,
                      builder: (ctx) => IconButton(
                        icon: const Icon(Icons.location_on),
                        color: Colors.deepOrange,
                        iconSize: 45.0,
                        onPressed: () {
                          setState(() {
                            starting = !starting;
                          });
                        },
                        tooltip: "Starting Point",
                      ),
                    ),
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: destinationPoint,
                      builder: (ctx) => IconButton(
                        icon: const Icon(Icons.location_on),
                        color: Colors.greenAccent[400],
                        iconSize: 45.0,
                        onPressed: () {
                          setState(() {
                            starting = !starting;
                          });
                        },
                        tooltip: "Destination",
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              icon: const CircleAvatar(
                backgroundColor: Colors.deepOrange,
                child: Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Positioned(
              left: 45,
              top: 5,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    locationInput(context, _satrtingTextController, 'Starting',
                        'Enter location of sheeping'),
                    const SizedBox(height: 15),
                    locationInput(context, _destinationTextController,
                        'Destination', 'Enter location of destination'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container locationInput(
    BuildContext context,
    TextEditingController textController,
    String labelText,
    String hintText,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.88,
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
        color: const Color(0xFF171719),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ListTile(
          minLeadingWidth: 0,
          leading: (labelText == "Starting")
              ? const Icon(
                  Icons.location_on,
                  color: Colors.deepOrange,
                  size: 30,
                )
              : const Icon(
                  Icons.location_on,
                  color: Colors.greenAccent,
                  size: 30,
                ),
          trailing: IconButton(
            onPressed: () {
              setState(() {
                (labelText == "Starting") ? starting = true : starting = false;
              });
              print("My location");
            },
            icon: (labelText == "Starting")
                ? const Icon(
                    Icons.my_location,
                    color: Colors.deepOrange,
                    size: 30,
                  )
                : const Icon(
                    Icons.map,
                    color: Colors.greenAccent,
                    size: 30,
                  ),
          ),
          title: TextFormField(
            // onFieldSubmitted: (value) {
            //   print(value);
            // },
            // onTap: () {
            //   setState(() {
            //     (labelText == "Starting") ? starting = true : starting = false;
            //   });
            // },
            keyboardType: TextInputType.streetAddress,
            controller: textController,
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              labelStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              hintStyle: const TextStyle(
                color: Colors.white,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            textInputAction: TextInputAction.next,
            cursorColor: Colors.white,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
