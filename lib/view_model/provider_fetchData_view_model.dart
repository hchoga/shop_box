import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shop_box/models/menu_group_model.dart';
import 'package:shop_box/models/sellableItem_model.dart';
import 'package:shop_box/constants/data.dart' as data ;
class ProviderFetchDataViewModel extends ChangeNotifier {
  List<SellableItem> _sellableList = [];

  List<MenuGroup> get menuList =>[...data.menuList];
  List<SellableItem> get sellableList => [..._sellableList];

  setSellableList(List<SellableItem> sellableList) {
    _sellableList = sellableList;
    notifyListeners();
  }
}
