import 'package:flutter/material.dart';

class ListcardPrevious extends StatelessWidget {
  final String name;
  final String from;
  final String to;
  final DateTime date;
  final TimeOfDay time;
  final String receiveby;
  const ListcardPrevious({
    Key? key,
    required this.name,
    required this.from,
    required this.to,
    required this.date,
    required this.time,
    required this.receiveby,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Card(
        color: const Color(0xFF171719),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(18),
            top: Radius.circular(18),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 30),
              child: Image(
                  height: 70,
                  fit: BoxFit.contain,
                  image: AssetImage('assets/parcel.png')),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.012,
                  ),
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "From:            " + from,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "To:                " + to,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Recived By:  " + receiveby,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Date:            " +
                        date.toString().substring(0, 10) +
                        "\nTime:           " +
                        time.format(context),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
