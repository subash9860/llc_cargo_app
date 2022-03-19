import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../models/user_data.dart';
import '../Screen/book_trip_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<UserData>(context, listen: false).getUserData();
    List<OfferCard> offercard = const [
      OfferCard(
          imageUrl:
              'https://image.shutterstock.com/image-vector/parcel-delivery-concept-fast-service-600w-1708711729.jpg'),
      OfferCard(
          imageUrl:
              'https://image.shutterstock.com/image-vector/online-delivery-service-concept-perfect-600w-1730034202.jpg'),
      OfferCard(
          imageUrl:
              'https://image.shutterstock.com/image-vector/online-delivery-service-on-mobile-600w-1887652123.jpg'),
      OfferCard(
          imageUrl:
              'https://image.shutterstock.com/image-vector/delivery-courier-man-medical-protective-600w-1685566219.jpg'),
      OfferCard(
          imageUrl:
              'https://image.shutterstock.com/image-vector/delivery-car-box-fly-out-600w-1970870492.jpg'),
      OfferCard(
          imageUrl:
              'https://image.shutterstock.com/z/stock-vector-a-delivery-motorcycle-or-scooter-is-parked-in-front-of-a-smartphone-shop-an-order-confirmation-1923631682.jpg'),
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Consumer<UserData>(
                builder: (context, value, child) => Text(
                  "Hi, ${value.items?.displayName.toUpperCase() ?? ''}",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(height: 10, thickness: 2),
              const Text(
                "Book a trip",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                      height: MediaQuery.of(context).size.height * 0.285,
                      width: MediaQuery.of(context).size.width * 0.99,
                    ),
                    Positioned(
                      top: 28,
                      left: 20,
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width * 0.47,
                      child: RichText(
                        text: const TextSpan(
                          text: "Send your cargo \n",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: "anywhere \n",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: "around the world \n",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: "with LLC \n",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 2,
                      bottom: 15,
                      left: MediaQuery.of(context).size.width * 0.40,
                      child: const Image(
                          fit: BoxFit.scaleDown,
                          image:
                              AssetImage('assets/onboarding/onboarding0.png')),
                    ),
                    Positioned(
                        bottom: 12,
                        left: 20,
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: ElevatedButton(
                          child: const Text("Get Started"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const BookTripScreen()));
                          },
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(8),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide.none,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Text(
                "Offers",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
          child: CarouselSlider(
              items: offercard,
              options: CarouselOptions(
                height: 400,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              )),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
      ],
    );
  }
}

class OfferCard extends StatelessWidget {
  const OfferCard({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF171719),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(18),
          top: Radius.circular(18),
        ),
      ),
      child: SizedBox(
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(18),
            top: Radius.circular(18),
          ),
          child: Image(
            fit: BoxFit.cover,
            image: NetworkImage(imageUrl),
          ),
        ),
      ),
    );
  }
}
