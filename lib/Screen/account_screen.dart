import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Stack(children: [
              const CircleAvatar(
                radius: 93,
                backgroundImage: AssetImage('./assets/pp.jpg'),
              ),
              Positioned(
                left: 146,
                bottom: 40,
                child: CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.perm_identity_outlined),
                  ),
                ),
              ),
            ]),
          ),
        ),
        const Text(
          "Andrew Dalton",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const Text(
          "Member since 20 aug 2021",
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey),
        ),
        const SizedBox(
          height: 25,
        ),
        Column(
          children: [
            const Divider(thickness: 2.0, endIndent: 30.0, indent: 12.0),
            Card(
              child: ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.settings, color: Colors.white))),
                  title: const Text("User Setting",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
            ),
            Card(
              child: ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.credit_card, color: Colors.white))),
                  title: const Text("Payment Setting",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
            ),
            Card(
              child: ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.translate, color: Colors.white))),
                  title: const Text("Change language",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
            ),
            Card(
              child: ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 22,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.rule_sharp, color: Colors.white))),
                  title: const Text("Terms and Condition",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
            ),
            Card(
              child: ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.logout, color: Colors.white))),
                  title: const Text("Log Out",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
            ),
          ],
        )
      ],
    );
  }
}
