import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import './receiver_info_page.dart';
import '../models/form_model.dart';
import '../provider/form_data.dart';

class LocationScreen extends StatefulWidget {
  final FormModel frmmodel;
  const LocationScreen({Key? key, required this.frmmodel}) : super(key: key);

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

  _getCurrentLocation() {
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
          },
        );
      });
    }).catchError((e) {
      print(e);
    });
  }

  // find lat long from address
  _findLatLongFromAddress(String loc, String address) {
    // getting the address
    locationFromAddress(address).then(
      (value) {
        if (value.isEmpty) {
          print("No results found");
        } else {
          print(value[0].toString());
        }
        // setting the destination point
        setState(() {
          if (loc == "starting") {
            startingPoint = LatLng(value[0].latitude, value[0].longitude);
          } else {
            destinationPoint = LatLng(value[0].latitude, value[0].longitude);
          }
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    Provider.of<FormDataModel>(context, listen: false)
        .setItems(widget.frmmodel);
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
                  child: TextFormField(
                    onEditingComplete: () {
                      setState(() {
                        _findLatLongFromAddress(
                            "starting", _destinationTextController.text);
                      });
                    },
                    onTap: () {
                      setState(() {
                        keyboarTyping = true;
                      });
                    },
                    keyboardType: TextInputType.streetAddress,
                    controller: _satrtingTextController,
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
                      hintText: "Starting address", //hint,
                      hintStyle: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
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
                  ),
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
                  child: TextFormField(
                    onEditingComplete: () {
                      setState(() {
                        _findLatLongFromAddress(
                            "destination", _destinationTextController.text);
                        keyboarTyping = false;
                      });
                    },
                    onTap: () {
                      setState(() {
                        keyboarTyping = true;
                      });
                    },
                    keyboardType: TextInputType.streetAddress,
                    controller: _destinationTextController,
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
                      hintText: 'Where to drop off?', //'hint',
                      hintStyle: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
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
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            (keyboarTyping)
                ? SizedBox(
                    child: Column(
                      children: [
                        ListTile(
                          leading: const CircleAvatar(
                              child: Icon(Icons.location_on)),
                          title: const Text("Set location on map"),
                          onTap: () {
                            setState(() {
                              keyboarTyping = false;
                            });
                          },
                        ),
                      ],
                    ),
                  )
                : Expanded(
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
                              print(_satrtingTextController.text);
                              print(_destinationTextController.text);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ReceiverInfoScreen(),
                                ),
                              );
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
                  ),
          ],
        ),
      ),
    );
  }
}
