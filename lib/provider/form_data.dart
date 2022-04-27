import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../models/form_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance;

class FormDataModel with ChangeNotifier {
  FormModel? _items;
  FormModel? get items => _items;

  void setItems(FormModel? itemsData) {
    _items = itemsData;
    notifyListeners();
  }

  Future<void> storeInFirebase() async {
    await FirebaseFirestore.instance
        .collection('booking')
        .doc('${auth.currentUser?.uid}')
        .collection('formData')
        .add({
      'uid': auth.currentUser?.uid,
      'deliveryType': _items?.deliveryType.name,
      'length': _items?.length,
      'width': _items?.width,
      'height': _items?.height,
      'quantity': _items?.quantity,
      'weight': _items?.weight,
      'transportationMode': _items?.transportationMode.name,
    });
  }
}

class LocationModelData with ChangeNotifier {
  LocationModel? _items;
  LocationModel? get items => _items;

  void setItems(LocationModel? itemsData) {
    _items = itemsData;
    notifyListeners();
  }

  Future<void> storeInFirebase() async {
    await FirebaseFirestore.instance
        .collection('booking')
        .doc('${auth.currentUser?.uid}')
        .collection('locationData')
        .add({
      'uid': auth.currentUser?.uid,
      'startingPoint': _items?.startingPoint,
      'destination': _items?.destination,
    });
  }
}

class BookedDateTimeModel with ChangeNotifier {
  BookedDateTime? _items;
  BookedDateTime? get items => _items;

  void setItems(BookedDateTime? itemsData) {
    _items = itemsData;
    notifyListeners();
  }

  Future<void> storeInFirebase() async {
    await FirebaseFirestore.instance
        .collection('booking')
        .doc('${auth.currentUser?.uid}')
        .collection('bookedDateTime')
        .add({
      'uid': auth.currentUser?.uid,
      'time':
          '${_items?.time.hour.toString()}:${_items?.time.minute.toString()}',
      'date':
          '${_items?.date.year.toString()}-${_items?.date.month.toString()}-${_items?.date.day.toString()}',
    });
  }
}

class ReceiverInfoModel with ChangeNotifier {
  ReceiverInfo? _items;
  ReceiverInfo? get items => _items;

  void setItems(ReceiverInfo? itemsData) {
    _items = itemsData;
    notifyListeners();
  }

  Future<void> storeInFirebase() async {
    await FirebaseFirestore.instance
        .collection('booking')
        .doc('${auth.currentUser?.uid}')
        .collection('ReciverInfo')
        .add({
      'uid': auth.currentUser?.uid,
      'fullName': _items?.fullName,
      'email': _items?.email,
      'phoneNumber': _items?.phoneNumber,
      'address': _items?.address,
    });
  }
}
