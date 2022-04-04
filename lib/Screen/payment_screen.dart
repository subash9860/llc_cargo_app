import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../Screen/confirmation_screen.dart';
import '../models/form_model.dart';
import '../provider/form_data.dart';

class PaymentScreen extends StatefulWidget {
  final BookedDateTime btime;
  final ReceiverInfo rinfo;
  const PaymentScreen({
    Key? key,
    required this.btime,
    required this.rinfo,
  }) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<BookedDateTimeModel>(context, listen: false)
        .setItems(widget.btime);
    Provider.of<ReceiverInfoModel>(context, listen: false)
        .setItems(widget.rinfo);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Payment'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            InkWell(
              onTap: () {},
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: const [
                      Icon(Icons.credit_card),
                      SizedBox(width: 16),
                      Text('Credit Card'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // add payment method
            InkWell(
              onTap: () {},
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: const [
                      Icon(Icons.paypal),
                      SizedBox(width: 16),
                      Text('Paypal'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // add visa
            InkWell(
              onTap: () {},
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: const [
                      Icon(Icons.payment),
                      SizedBox(width: 16),
                      Text('Visa/Mastercard'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // add cash
            InkWell(
              onTap: () {},
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: const [
                      Icon(Icons.monetization_on),
                      SizedBox(width: 16),
                      Text('Cash on Delivery'),
                    ],
                  ),
                ),
              ),
            ),
            // continue button
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ConfirmationScreen()));
              },
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: const Center(child: Text('Submit'))),
            ),
          ],
        ),
      ),
    );
  }
}
