import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final String name;
  final String from;
  final String to;
  final DateTime date;
  final TimeOfDay time;
  const ListCard({
    Key? key,
    required this.name,
    required this.from,
    required this.to,
    required this.date,
    required this.time,
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
            Container(
              margin: const EdgeInsets.only(left: 15),
              height: MediaQuery.of(context).size.height * 0.28,
              width: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0,top: 10,bottom: 10),
                    child: 
                    Text(
                      name.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "From:      " + from,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "To:           " + to,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const Text(
                    "Status     Confirmed",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Date:        " +
                        date.year.toString() +
                        " - " +
                        date.month.toString() +
                        " - " +
                        date.day.toString() +
                        '\n' +
                        'Time:       ' +
                        time.hour.toString() +
                        ":" +
                        time.minute.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const Divider(
                    endIndent: 60,
                    color: Colors.white,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("See more"),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  )
                ],
              ),
            ),
            const Image(
                height: 150,
                fit: BoxFit.contain,
                image: AssetImage('assets/van.png')),
          ],
        ),
      ),
    );
  }
}
