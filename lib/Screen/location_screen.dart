import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  bool keyboarTyping = false;

  bool starting = true;
  LatLng startingPoint = LatLng(27.6710, 85.4298);
  LatLng destinationPoint = LatLng(27.667246, 85.436371);

  final _formKey = GlobalKey<FormState>();
  final _satrtingTextController = TextEditingController();
  final _destinationTextController = TextEditingController();

  _getCurrentLocation() async {
    // requesting user to user their location
    Geolocator.requestPermission();
    // getting the user location
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((position) {
      print(position);
      setState(() {
        startingPoint = LatLng(position.latitude, position.longitude);

        // converting the user location to address
        placemarkFromCoordinates(position.latitude, position.longitude).then(
          (value) {
            if (value.isEmpty) {
              print("No results found");
            } else {
              print(value[0].toString());
            }

            _satrtingTextController.text = value[0].toString();

            // setState(() {
            // (starting) ? startingPoint = pointT : destinationPoint = pointT;
            // print(starting);
            // print(tapPosition.relative?.distance);
            // print(pointT);
            // });
          },
        );
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Location",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 5),
                const Icon(
                  Icons.location_on,
                  color: Colors.deepOrange,
                  size: 40,
                ),
                Expanded(
                  child: textField(
                      context: context,
                      controller: _satrtingTextController,
                      hint: 'Enter a pick up adress'),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 5),
                const Icon(
                  Icons.location_on,
                  color: Color(0xFF00E676),
                  size: 40,
                ),
                Expanded(
                  child: textField(
                      context: context,
                      controller: _destinationTextController,
                      hint: 'Where to drop off?'),
                ),
                const SizedBox(width: 10),
              ],
            ),
            // AnimatedSwitcher(
              // duration: const Duration(milliseconds: 500),
              // transitionBuilder: (Widget child, Animation<double> animation) {
                // return ScaleTransition(child: child, scale: animation);
              // },
              // child:
                  // starting
                  // ? const Text("Tap on the map to select your location")
                  // : const Text("Tap on the map to select your destination"),
                  // ),
                  // },
                  // child: starting ? _map() : _map2()),

                  (keyboarTyping)
                      ? const SizedBox(
                          height: 10,
                          child: Text("keybord typing is on"),
                        )
                      :
                       Expanded(
                          child: 
                          Stack(
                            children: [
                              FlutterMap(
                                options: MapOptions(
                                  center: startingPoint,
                                  zoom: 15,
                                  // change postion of marker point where we tap on map
                                  onTap: (tapPosition, pointT) {
                                    // change lat long to place name

                                    locationFromAddress(
                                            "bhaktapur multiple campus")
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
                                          color: const Color(0xFF00E676),
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
                              Positioned(
                                right: 20,
                                bottom: 80,
                                child: FloatingActionButton(
                                  onPressed: _getCurrentLocation,
                                  child: const Icon(Icons.my_location),
                                ),
                              ),
                              Positioned(
                                bottom: 15,
                                left: 30,
                                child: TextButton(
                                  onPressed: () {
                                    // submiting the data to the server
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black,
                                    ),
                                    child: const Text(
                                      "Done",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        // ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField textField({
    required BuildContext context,
    required String hint,
    controller,
  }) {
    return TextFormField(
      onTap: () {
        setState(() {
          keyboarTyping = true;
        });
      },
      keyboardType: TextInputType.streetAddress,
      controller: controller,
      textInputAction: TextInputAction.next,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        // icon: const Icon(Icons.location_on, size: 40),
        filled: true,
        fillColor: const Color(0xFF171719),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            style: BorderStyle.none,
          ),
        ),
        hintText: hint,
        hintStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            style: BorderStyle.none,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a address';
        }
        return null;
      },
    );
  }
}
