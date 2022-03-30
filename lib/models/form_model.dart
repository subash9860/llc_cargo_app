import 'package:flutter/foundation.dart';

import '../Screen/book_trip_screen.dart';

class FormModel with ChangeNotifier {
  final String uid;
  final DeliveryType deliveryType;
  final double length;
  final double width;
  final double height;
  final double quantity;
  final double weight;
  final TransportationMode transportationMode;

  FormModel({
    required this.uid,
    required this.deliveryType,
    required this.length,
    required this.width,
    required this.height,
    required this.quantity,
    required this.weight,
    required this.transportationMode,
  });

  factory FormModel.fromJson(Map<String, dynamic> json) {
    return FormModel(
      uid: json['uid'] as String,
      deliveryType: json['deliveryType'] as DeliveryType,
      length: json['length'] as double,
      width: json['width'] as double,
      height: json['height'] as double,
      quantity: json['quantity'] as double,
      weight: json['weight'] as double,
      transportationMode: json['transportationMode'] as TransportationMode,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'deliveryType': deliveryType,
      'length': length,
      'width': width,
      'height': height,
      'quantity': quantity,
      'weight': weight,
      'transportationMode': transportationMode,
    };
  }
}


class LocationModel with ChangeNotifier{
  final String startingPoint;
  final String destination;

  LocationModel({
    required this.startingPoint,
    required this.destination,
  });

}