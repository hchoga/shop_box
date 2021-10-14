import 'package:flutter/material.dart';
import 'package:shop_box/models/sellableItem_model.dart';
// menuGroup Rules
// must contains at least 5 items 3 different items
// menuGroup must be at least 30% percentage
class MenuGroup {
  final String menuPercentage;
  final int quantity;
  final String id;
  final List<SellableItem> sellableItemList;

  MenuGroup({this.menuPercentage, this.quantity,this.id ,this.sellableItemList});
}

