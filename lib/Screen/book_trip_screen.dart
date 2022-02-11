import 'package:flutter/material.dart';

class BookTripScreen extends StatefulWidget {
  const BookTripScreen({Key? key}) : super(key: key);

  @override
  State<BookTripScreen> createState() => _BookTripScreenState();
}

class _BookTripScreenState extends State<BookTripScreen> {
  @override
  Widget build(BuildContext context) {
    var val;
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
            Radio(
              value: 1,
              groupValue: val,
              onChanged: (value) {
                setState(() {
                  val = value;
                });
              },
              toggleable: true, 
              activeColor: Color.fromARGB(255, 219, 67, 21),
              autofocus: true,
              hoverColor: Colors.red,
              mouseCursor: MouseCursor.uncontrolled,
              // overlayColor: Color.fromARGB(255, 146, 131, 130),
            ),
          ],
        ),
      ),
    );
  }
}
