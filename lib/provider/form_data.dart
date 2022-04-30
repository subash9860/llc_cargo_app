import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/form_model.dart';

final auth = FirebaseAuth.instance;

class FormDataModel with ChangeNotifier {
  FormModel? _items;
  FormModel? get items => _items;

  late int uuid;

  void setItems(FormModel? itemsData) {
    _items = itemsData;
    notifyListeners();
  }

  int getUuid() {
    uuid = DateTime.now().millisecondsSinceEpoch;
    notifyListeners();
    return uuid;
  }

  Future<void> storeInFirebase() async {
    // collection -> document -> collection -> document  -> field
    // booking    -> uid      -> formdata   -> doc Index -> data

    await FirebaseFirestore.instance
        .collection('booking')
        .doc('${auth.currentUser?.uid}')
        .collection('formdata')
        .doc(uuid.toString())
        .set(_items?.toJson() ?? {});
  }

  // list of all the documents in the formdata collection
  // set the list of documents in the formdata collection

  final List<FormModel> formDataList = [];

  Future<void> getFromFirebase() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('booking')
        .doc('${auth.currentUser?.uid}')
        .collection('formdata')
        .get();

    for (final doc in querySnapshot.docs) {
      final formData = FormModel.fromJson(doc.data());

      if (formDataList.every((element) => element.uid != formData.uid)) {
        formDataList.add(formData);
      } else {
        print('already exists');
      }
      notifyListeners();
    }
  }
}

class LocationModelData with ChangeNotifier {
  LocationModel? _items;
  LocationModel? get items => _items;

  void setItems(LocationModel? itemsData) {
    _items = itemsData;
    notifyListeners();
  }

  Future<void> storeInFirebase(int id) async {
    await FirebaseFirestore.instance
        .collection('booking')
        .doc('${auth.currentUser?.uid}')
        .collection('locationdata')
        .doc(id.toString())
        .set({
      'uid': id,
      'startingPoint': _items?.startingPoint,
      'destination': _items?.destination,
    });
  }

  // set the list of documents in the locationdata collection
  final List<LocationModel> locationDataList = [];

  Future<void> getLocationFirebase() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('booking')
        .doc('${auth.currentUser?.uid}')
        .collection('locationdata')
        .get();

    for (final doc in querySnapshot.docs) {
      final locationData = LocationModel(
          uid: doc.data()['uid'],
          startingPoint: doc.data()['startingPoint'],
          destination: doc.data()['destination']);

      if (locationDataList
          .every((element) => element.uid != locationData.uid)) {
        locationDataList.add(locationData);
      } else {
        print('already exists');
      }
      notifyListeners();
    }
  }
}

class BookedDateTimeModel with ChangeNotifier {
  BookedDateTime? _items;
  BookedDateTime? get items => _items;

  void setItems(BookedDateTime? itemsData) {
    _items = itemsData;
    notifyListeners();
  }

  Future<void> storeInFirebase(int id) async {
    await FirebaseFirestore.instance
        .collection('booking')
        .doc('${auth.currentUser?.uid}')
        .collection('bookedDateTime')
        .doc(id.toString())
        .set({
      'uid': id,
      'time':
          '${_items?.time.hour.toString()}:${_items?.time.minute.toString()}',
      'date':
          '${_items?.date.year.toString()}-${_items?.date.month.toString()}-${_items?.date.day.toString()}',
    });
  }

  // set the list of documents in the bookedDateTime collection
  final List<BookedDateTime> bookedDateTimeList = [];

  Future<void> getDateTimeFirebase() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('booking')
        .doc('${auth.currentUser?.uid}')
        .collection('bookedDateTime')
        .get();

    for (final doc in querySnapshot.docs) {
      final bookedDateTime = BookedDateTime(
          uid: doc.data()['uid'],
          time: TimeOfDay(
              hour: int.parse(doc.data()['time'].split(':')[0]),
              minute: int.parse(doc.data()['time'].split(':')[1])),
          date: DateTime(
              int.parse(doc.data()['date'].split('-')[0]),
              int.parse(doc.data()['date'].split('-')[1]),
              int.parse(doc.data()['date'].split('-')[2])));

      if (bookedDateTimeList
          .every((element) => element.uid != bookedDateTime.uid)) {
        bookedDateTimeList.add(bookedDateTime);
      } else {
        print('already exists');
      }
      notifyListeners();
    }
  }
}

class ReceiverInfoModel with ChangeNotifier {
  ReceiverInfo? _items;
  ReceiverInfo? get items => _items;

  void setItems(ReceiverInfo? itemsData) {
    _items = itemsData;
    notifyListeners();
  }

  Future<void> storeInFirebase(int id) async {
    await FirebaseFirestore.instance
        .collection('booking')
        .doc('${auth.currentUser?.uid}')
        .collection('receiverInfo')
        .doc(id.toString())
        .set({
      'uid': id,
      'fullName': _items?.fullName,
      'email': _items?.email,
      'phoneNumber': _items?.phoneNumber,
      'address': _items?.address,
    });
  }

  // set the list of documents in the receiverInfo collection
  final List<ReceiverInfo> receiverInfoList = [];

  Future<void> getReceiverInfoFirebase() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('booking')
        .doc('${auth.currentUser?.uid}')
        .collection('receiverInfo')
        .get();

    for (final doc in querySnapshot.docs) {
      final receiverInfo = ReceiverInfo(
          uid: doc.data()['uid'],
          fullName: doc.data()['fullName'],
          email: doc.data()['email'],
          phoneNumber: doc.data()['phoneNumber'],
          address: doc.data()['address']);
      if (receiverInfoList
          .every((element) => element.uid != receiverInfo.uid)) {
        receiverInfoList.add(receiverInfo);
      } else {
        print('already exists');
      }
      notifyListeners();
    }
  }
}
