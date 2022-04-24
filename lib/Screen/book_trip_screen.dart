import 'package:flutter/material.dart';
import 'package:llc/provider/form_data.dart';
import 'package:provider/provider.dart';

import '../Screen/location_screen.dart';
import '../models/form_model.dart';
import '../widgets/button_customized.dart';

enum DeliveryType { luggage, parcel }
enum TransportationMode { roadway, railway, airway, waterway }

class BookTripScreen extends StatefulWidget {
  const BookTripScreen({Key? key}) : super(key: key);

  @override
  State<BookTripScreen> createState() => _BookTripScreenState();
}

class _BookTripScreenState extends State<BookTripScreen> {
  DeliveryType? _type;
  TransportationMode? _mode;

  final _formKey = GlobalKey<FormState>();

  final _lengthController = TextEditingController();
  final _widthController = TextEditingController();
  final _heightController = TextEditingController();
  final _quantityController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() {
    _lengthController.dispose();
    _widthController.dispose();
    _heightController.dispose();
    _quantityController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lengthField = textField(
        context: context,
        controller: _lengthController,
        label: 'Length',
        hint: 'Enter the length of the package',
        icon: Icons.straighten,
        keyboardType: TextInputType.number);

    final widthField = textField(
        context: context,
        controller: _widthController,
        label: 'Width',
        hint: 'Enter the width of the package',
        icon: Icons.straighten,
        keyboardType: TextInputType.number);

    final heightField = textField(
        context: context,
        controller: _heightController,
        label: 'Height',
        hint: 'Enter the height of the package',
        icon: Icons.straighten,
        keyboardType: TextInputType.number);

    final qualityField = textField(
        context: context,
        controller: _quantityController,
        label: 'Quality',
        hint: 'Enter the Quality of the package',
        icon: Icons.straighten,
        keyboardType: TextInputType.number);

    final weightField = textField(
        context: context,
        controller: _weightController,
        label: "weight",
        hint: "Weight of the parcel",
        icon: Icons.balance,
        keyboardType: TextInputType.number);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "New Trip",
          style: TextStyle(
              color: Colors.deepOrange,
              fontSize: 28,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text("Deliver type",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange)),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  cardWidget(
                    imageUrl: "./assets/luggage.png",
                    title: 'Luggage',
                    child: Radio<DeliveryType>(
                      value: DeliveryType.luggage,
                      groupValue: _type,
                      onChanged: (DeliveryType? val) {
                        setState(() {
                          _type = val;
                        });
                      },
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.deepOrange),
                      toggleable: true,
                    ),
                  ),
                  cardWidget(
                    imageUrl: "./assets/parcel.png",
                    title: 'Parcel',
                    child: Radio<DeliveryType>(
                      value: DeliveryType.parcel,
                      groupValue: _type,
                      onChanged: (DeliveryType? val) {
                        setState(() {
                          _type = val;
                        });
                      },
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.deepOrange),
                      toggleable: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text("Dimension in Feet and kg",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange)),
              const SizedBox(height: 10),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: lengthField),
                        const SizedBox(width: 10),
                        Expanded(child: widthField),
                        const SizedBox(width: 10),
                        Expanded(child: heightField),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(child: qualityField),
                        const SizedBox(width: 10),
                        Expanded(child: weightField),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text("Ways of delivery",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange)),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  cardWidget(
                    imageUrl: "./assets/transport/air.png",
                    title: 'Airways',
                    child: Radio<TransportationMode>(
                      value: TransportationMode.airway,
                      groupValue: _mode,
                      onChanged: (TransportationMode? val) {
                        setState(() {
                          _mode = val;
                        });
                      },
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.deepOrange),
                      toggleable: true,
                    ),
                  ),
                  cardWidget(
                    imageUrl: "./assets/transport/rail.png",
                    title: 'Railways',
                    child: Radio<TransportationMode>(
                      value: TransportationMode.railway,
                      groupValue: _mode,
                      onChanged: (TransportationMode? val) {
                        setState(() {
                          _mode = val;
                        });
                      },
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.deepOrange),
                      toggleable: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  cardWidget(
                    imageUrl: "./assets/transport/road.png",
                    title: 'Roadways',
                    child: Radio<TransportationMode>(
                      value: TransportationMode.roadway,
                      groupValue: _mode,
                      onChanged: (TransportationMode? val) {
                        setState(() {
                          _mode = val;
                        });
                      },
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.deepOrange),
                      toggleable: true,
                    ),
                  ),
                  cardWidget(
                    imageUrl: "./assets/transport/water.png",
                    title: 'Waterways',
                    child: Radio<TransportationMode>(
                      value: TransportationMode.waterway,
                      groupValue: _mode,
                      onChanged: (TransportationMode? val) {
                        setState(() {
                          _mode = val;
                        });
                      },
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.deepOrange),
                      toggleable: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ButtonCustomized(
                butttonText: "Continue",
                buttonpress: () {
                  if (_formKey.currentState!.validate() &&
                      _type != null &&
                      _mode != null) {
                    _formKey.currentState!.save();
                    print("Delivery Type: " + _type.toString());
                    print("length: " + _lengthController.text);
                    print("width: " + _widthController.text);
                    print("height: " + _heightController.text);
                    print("Quantity: " + _quantityController.text);
                    print("weight: " + _weightController.text);
                    print("Transport mode: " + _mode.toString());

                    Provider.of<FormDataModel>(context, listen: false).setItems(
                      FormModel(
                        uid: '3455',
                        deliveryType: _type!,
                        length: double.parse(_lengthController.text),
                        width: double.parse(_widthController.text),
                        height: double.parse(_heightController.text),
                        quantity: double.parse(_quantityController.text),
                        weight: double.parse(_weightController.text),
                        transportationMode: _mode!,
                      ),
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LocationScreen(),
                      ),
                    );
                  }
                },
                buttonColor: Colors.deepOrange,
                textColor: Colors.white,
                height: MediaQuery.of(context).size.height * 0.08,
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }

  cardWidget({
    required String imageUrl,
    required Widget child,
    required String title,
  }) {
    return Container(
      width: 160,
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF171719),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -3,
            right: -3,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 18,
              child: Transform.scale(
                scale: 2,
                child: child,
              ),
            ),
          ),
          if (title != 'Parcel')
            Positioned(
              bottom: 0,
              left: 30,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          if (title == 'Parcel')
            Positioned(
              bottom: 0,
              left: 45,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          if (title == 'Luggage')
            Positioned(
              top: -20,
              left: 35,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.scaleDown,
                width: 90,
              ),
            ),
          if (title == 'Parcel')
            Positioned(
              top: 10,
              left: 35,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.scaleDown,
                width: 90,
              ),
            ),
          if (title.contains("ways"))
            Positioned(
              top: 10,
              left: 35,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.scaleDown,
                width: 90,
              ),
            ),
        ],
      ),
    );
  }

  TextFormField textField(
      {required BuildContext context,
      required String hint,
      required String label,
      required IconData icon,
      controller,
      keyboardKey,
      TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
          return 'Please enter a length';
        }
        if (double.tryParse(value) == null) {
          return 'Please enter a valid length';
        }
        return null;
      },
    );
  }
}
