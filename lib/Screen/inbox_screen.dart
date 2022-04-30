import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
           Card(
            child: ListTile(
              visualDensity: VisualDensity.standard,
              leading: CircleAvatar(
                backgroundColor: Colors.black,
                child:
                    Icon(Icons.person_rounded, color: Colors.white, size: 40),
              ),
              title: Text("Profile complete"),
              // subtitle: Text("2 days ago"),
            ),
          ),

          // Container(
          //     margin: const EdgeInsets.fromLTRB(10, 25, 0, 0),
          //     child: const Text("Recent",
          //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23))),
          // const Card(
          //   child: ListTile(
          //     visualDensity: VisualDensity.standard,
          //     leading: CircleAvatar(
          //       backgroundColor: Colors.deepOrange,
          //       child:
          //           Icon(Icons.task_alt_outlined, color: Colors.white, size: 40),
          //     ),
          //     title: Text("Your good has been picked up."),
          //     subtitle: Text("2 mimutes ago"),
          //   ),
          // ),
          // const Card(
          //   child: ListTile(
          //     visualDensity: VisualDensity.standard,
          //     leading: CircleAvatar(
          //       backgroundColor: Colors.black,
          //       child: Icon(Icons.update, color: Colors.white, size: 40),
          //     ),
          //     title: Text("Your parcel will deliver at 2 pm today."),
          //     subtitle: Text("2 hour ago"),
          //   ),
          // ),
          // const Card(
          //   child: ListTile(
          //     visualDensity: VisualDensity.standard,
          //     leading: CircleAvatar(
          //       backgroundColor: Colors.black,
          //       child: Icon(Icons.calendar_today_outlined,
          //           color: Colors.white, size: 25),
          //     ),
          //     title: Text("You have booked a trip for 4th feb 2022 at 10 am."),
          //     subtitle: Text("2 mimutes ago"),
          //   ),
          // ),
          // Container(
          //     margin: const EdgeInsets.fromLTRB(10, 25, 0, 0),
          //     child: const Text("Earlier",
          //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23))),
          // const Divider(thickness: 3.0, endIndent: 30.0, indent: 12.0),
          // const Card(
          //   child: ListTile(
          //     visualDensity: VisualDensity.standard,
          //     leading: CircleAvatar(
          //       backgroundColor: Colors.deepOrange,
          //       child:
          //           Icon(Icons.task_alt_outlined, color: Colors.white, size: 40),
          //     ),
          //     title: Text("Your good has been picked up."),
          //     subtitle: Text("1 day ago"),
          //   ),
          // ),
          // const Card(
          //   child: ListTile(
          //     visualDensity: VisualDensity.standard,
          //     leading: CircleAvatar(
          //       backgroundColor: Colors.black,
          //       child: Icon(Icons.person_rounded, color: Colors.white, size: 40),
          //     ),
          //     title: Text("Profile complete"),
          //     subtitle: Text("2 days ago"),
          //   ),
          // ),
          // const Card(
          //   child: ListTile(
          //     visualDensity: VisualDensity.standard,
          //     leading: CircleAvatar(
          //       backgroundColor: Colors.deepOrange,
          //       child: Icon(Icons.credit_card, color: Colors.white, size: 25),
          //     ),
          //     title: Text("New payment method has been added"),
          //     subtitle: Text("1 week ago"),
          //   ),
          // ),
        ],
      ),
    );
  }
}
