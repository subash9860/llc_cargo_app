import 'package:flutter/material.dart';

import '../Screen/book_trip_screen.dart';

class FormModel with ChangeNotifier {
  final int uid;
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
      uid: json['uid'] as int,
      deliveryType: (json['deliveryType'] == 'luggage')
          ? DeliveryType.luggage
          : DeliveryType.parcel,
      length: json['length'] as double,
      width: json['width'] as double,
      height: json['height'] as double,
      quantity: json['quantity'] as double,
      weight: json['weight'] as double,
      transportationMode: (json['transportationMode'] == 'airway')
          ? TransportationMode.airway
          : ((json['transportationMode'] == 'railway')
              ? TransportationMode.railway
              : ((json['transportationMode'] == 'waterway')
                  ? TransportationMode.waterway
                  : TransportationMode.roadway)),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'deliveryType': deliveryType.name,
      'length': length,
      'width': width,
      'height': height,
      'quantity': quantity,
      'weight': weight,
      'transportationMode': transportationMode.name,
    };
  }
}

class LocationModel with ChangeNotifier {
  final int uid;
  final String startingPoint;
  final String destination;

  LocationModel({
    required this.uid,
    required this.startingPoint,
    required this.destination,
  });
}

class BookedDateTime with ChangeNotifier {
  final int uid;
  final DateTime date;
  final TimeOfDay time;

  BookedDateTime({
    required this.uid,
    required this.time,
    required this.date,
  });
}

class ReceiverInfo with ChangeNotifier {
  final int uid;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String address;

  ReceiverInfo({
    required this.uid,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.address,
  });
}
