
import 'package:shop_box/models/sellableItem_model.dart';
import 'package:flutter/material.dart';
class CartItem {
  final String id;
  final String name;
  int quantity;
  final String price;
  final String image;
  final String tax;
  List <SellableItem> menuGroup;
  CartItem({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.quantity,
    @required this.price,
    @required this.tax,
    this.menuGroup
  });
}