import 'package:flutter/material.dart';

import '../widgets/button_customized.dart';
// import '../widgets/dimension.dart';

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

    final weightFeild = textField(
        context: context,
        controller: _weightController,
        hint: "Weight",
        label: "weight of the parcel",
        icon: Icons.balance,
        keyboardType: TextInputType.number);

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text(
          "Book a new Trip",
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
                  cardWidegt(
                    imageUrl: "./assets/luggage.png",
                    title: 'Luggae',
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
                  cardWidegt(
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
                        Expanded(child: weightFeild),
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
                  cardWidegt(
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
                  cardWidegt(
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
                  cardWidegt(
                    imageUrl: "./assets/transport/road.png",
                    title: 'RoadWays',
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
                  cardWidegt(
                    imageUrl: "./assets/transport/water.png",
                    title: 'WaterWays',
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
                butttonText: "continuous",
                buttonpress: () {
                  if (_formKey.currentState!.validate() &&
                      _type != null &&
                      _mode != null) {
                    _formKey.currentState!.save();
                    print(_lengthController.text);
                    print(_widthController.text);
                    print(_weightController.text);
                    print(_heightController.text);
                    print(_type.toString());
                    print(_mode.toString());
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

  cardWidegt({
    required String imageUrl,
    required Widget child,
    required String title,
  }) {
    return Container(
      width: 160,
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black54,
      ),
      child: Stack(
        children: [
          Positioned(
            left: 35,
            child: Image.asset(
              // "./assets/luggage.png",
              imageUrl,
              fit: BoxFit.scaleDown,
              width: 90,
            ),
          ),
          Positioned(
            bottom: -3,
            right: -3,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Transform.scale(
                scale: 2,
                child: child,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 5,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
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
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
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
