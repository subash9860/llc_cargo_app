import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../models/form_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FormDataModel with ChangeNotifier {
  FormModel? _items;
  FormModel? get items => _items;

  void setItems(FormModel? itemsData) {
    _items = itemsData;
    notifyListeners();
  }
}

class LocationModelData with ChangeNotifier {
  LocationModel? _items;
  LocationModel? get items => _items;

  void setItems(LocationModel? itemsData) {
    _items = itemsData;
    notifyListeners();
  }
}

class BookedDateTimeModel with ChangeNotifier {
  BookedDateTime? _items;
  BookedDateTime? get items => _items;

  void setItems(BookedDateTime? itemsData) {
    _items = itemsData;
    notifyListeners();
  }
}

class ReceiverInfoModel with ChangeNotifier {
  ReceiverInfo? _items;
  ReceiverInfo? get items => _items;

  void setItems(ReceiverInfo? itemsData) {
    _items = itemsData;
    notifyListeners();
  }
}

class StoreInFirebaseModel {
  final auth = FirebaseAuth.instance;
  Future<void> storeInFirebase() async {
    FirebaseFirestore.instance
        .collection('booked')
        .doc('${auth.currentUser?.uid}')
        .collection('booking details')
        .add({
      'booked': true,
      'bookingId': '${auth.currentUser?.uid}',
      'date': '${DateTime.now()}',
      'time': '${DateTime.now()}',
    });
  }
}
