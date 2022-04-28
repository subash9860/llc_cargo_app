import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    // int docCount = 0;

    // collection -> document -> collection -> count documents
    // booking    -> uid      -> formdata   -> docCount

    // await FirebaseFirestore.instance
    //     .collection('booking')
    //     .doc(auth.currentUser?.uid)
    //     .collection('formdata')
    //     .get()
    //     .then((value) {
    //   docCount = value.docs.length;
    //   print(docCount);
    //   docCount++;
    // });

    // collection -> document -> collection -> document  -> field
    // booking    -> uid      -> formdata   -> doc Index -> data

    await FirebaseFirestore.instance
        .collection('booking')
        .doc('${auth.currentUser?.uid}')
        .collection('formdata')
        .doc(uuid.toString())
        .set(_items?.toJson() ?? {});
  }

  Future<void> getFormData() async {
    CollectionReference formData =
        FirebaseFirestore.instance.collection('booking');

    DocumentSnapshot snapshot = await formData
        .doc('${auth.currentUser?.uid}')
        .collection('formdata')
        .snapshots()
        .forEach((element) {
      element.docs.forEach((element) {
        print(element.data());
      });
      // FormModel.fromJson(json.decode(element));
      // _items = FormModel.fromJson(json.decode(element));
    });
    // .first.then((value) {
    // var data = value.docs.map((e) => FormModel.fromJson(e.data()));
    // .doc().get();
    // var data = snapshot.data() as Map;

    // _items =

    // Receive(
    //   uid: data["uid"],
    //   email: data["email"],
    //   displayName: data["name"],
    //   password: data["password"],
    //   phoneNumber: int.parse(
    //     data["phoneNumber"],
    //   ),
    // );
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

  Future<void> storeInFirebase(int id) async {
    // int docCount = 0;
    // await FirebaseFirestore.instance
    //     .collection('booking')
    //     .doc(auth.currentUser?.uid)
    //     .collection('locationdata')
    //     .get()
    //     .then((value) {
    //   docCount = value.docs.length;
    //   print(docCount);
    //   docCount++;
    // });
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
}

class BookedDateTimeModel with ChangeNotifier {
  BookedDateTime? _items;
  BookedDateTime? get items => _items;

  void setItems(BookedDateTime? itemsData) {
    _items = itemsData;
    notifyListeners();
  }

  Future<void> storeInFirebase(int id) async {
    // int docCount = 0;
    // await FirebaseFirestore.instance
    //     .collection('booking')
    //     .doc(auth.currentUser?.uid)
    //     .collection('bookedDateTime')
    //     .get()
    //     .then((value) {
    //   docCount = value.docs.length;
    //   print(docCount);
    //   docCount++;
    // });
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
}

class ReceiverInfoModel with ChangeNotifier {
  ReceiverInfo? _items;
  ReceiverInfo? get items => _items;

  void setItems(ReceiverInfo? itemsData) {
    _items = itemsData;
    notifyListeners();
  }

  Future<void> storeInFirebase(int id) async {
    // int docCount = 0;
    // await FirebaseFirestore.instance
    //     .collection('booking')
    //     .doc(auth.currentUser?.uid)
    //     .collection('receiverInfo')
    //     .get()
    //     .then((value) {
    //   docCount = value.docs.length;
    //   print(docCount);
    //   docCount++;
    // });
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
}
