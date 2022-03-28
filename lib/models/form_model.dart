import 'package:flutter/foundation.dart';

import '../Screen/book_trip_screen.dart';

class FormModel with ChangeNotifier {
  final String uid;
  final DeliveryType deliveyType;
  final double length;
  final double width;
  final double height;
  final double quantity;
  final double weight;
  final TransportationMode transportationMode;

  FormModel({
    required this.uid,
    required this.deliveyType,
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
      deliveyType: json['deliveyType'] as DeliveryType,
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
      'deliveyType': deliveyType,
      'length': length,
      'width': width,
      'height': height,
      'quantity': quantity,
      'weight': weight,
      'transportationMode': transportationMode,
    };
  }
}
