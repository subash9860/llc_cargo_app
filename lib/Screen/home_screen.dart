import 'package:flutter/material.dart';

// import '../widgets/button_customized.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      width: MediaQuery.of(context).size.width * 0.99,
      height: double.infinity,
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Hi Andrew",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          const Text(
            "Book a trip",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Card(
            color: const Color(0xFF171719),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(18),
                top: Radius.circular(18),
              ),
            ),
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.99,
                ),
                Positioned(
                  top: 15,
                  left: 5,
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * 0.47,
                  child: const Text(
                    "Send your cargo anywhere around the world with LLc",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.40,
                  height: MediaQuery.of(context).size.width * 0.48,
                  child: const Image(
                      fit: BoxFit.scaleDown,
                      image: AssetImage('assets/onboarding/onboarding0.png')),
                ),
                Positioned(
                  bottom: 13,
                  height: 35,
                  left: 20,
                  child:
                  ElevatedButton(child:const Text("Book Cargo"),onPressed: (){},)
                  //  ButtonCustomized(
                  //     butttonText: "Book Cargo",
                  //     buttonpress: () {
                  //       // Booking new trip screen
                  //     },
                  //     buttonColor: Theme.of(context).colorScheme.primary,
                  //     textColor: Colors.white,
                  //     height: 30,
                  //     width: MediaQuery.of(context).size.width * 0.405),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          const Text(
            "Offers",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Card(
                color: const Color(0xFF171719),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(18),
                    top: Radius.circular(18),
                  ),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.28,
                  width: MediaQuery.of(context).size.width * 0.60,
                  child: const Text(
                    "Offers Bannaers",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Card(
                color: const Color(0xFF171719),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(18),
                    top: Radius.circular(18),
                  ),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.28,
                  width: MediaQuery.of(context).size.width * 0.25,
                ),
              )
              // BoxShadow()
            ],
          )
        ],
      ),
    );
  }
}
