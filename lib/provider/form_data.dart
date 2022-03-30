import 'package:flutter/foundation.dart';

import '../models/form_model.dart';

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