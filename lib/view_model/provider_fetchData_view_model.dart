import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shop_box/models/sellableItem_model.dart';


class ProviderFetchDataViewModel extends ChangeNotifier {
  List<SellableItem> _sellableList = [];

  List<SellableItem> get sellableList => [..._sellableList];
  setSellableList(List<SellableItem> sellableList) {
    _sellableList = sellableList;
    notifyListeners();
  }



}
