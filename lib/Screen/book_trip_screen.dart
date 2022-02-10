import 'package:flutter/material.dart';

class BookTripScreen extends StatelessWidget {
  const BookTripScreen({Key? key}) : super(key: key);

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
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
              child: const Text("Delivrery Type",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
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
                    // Positioned(
                    //     bottom: 0,
                    //     right: 0,
                    //     child: 
                        // Radio(
                          // value: "Parsal", fillColor: MaterialStateProperty<Color> Color(value) fromARGB(255, 136, 125, 91),
                          // activeColor: Colors.deepOrange,
                          // groupValue: "",
                          // onChanged: (_) {
                            // print("object");
                          // },
                          //  groupValue: groupValue, onChanged: onChanged)
                        // )
                        // CircleAvatar(
                        //   radius: 20,
                        //   child: Card(
                        //     shadowColor: Colors.deepOrange,
                        //     color: Colors.black,
                        //   ),
                        // ),
                        // )
                  ],
                ),
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
                        child: CircleAvatar(
                          radius: 20,
                          child: Container(color: Colors.deepOrange),
                        ))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
