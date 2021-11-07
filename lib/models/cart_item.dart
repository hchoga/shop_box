import 'package:flutter/material.dart';
class CartItem {
  final String id;
  final String name;
  int quantity;
  final String price;
  final String image,type;
  final String tax;
  var menuGroup;
  CartItem({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.quantity,
    @required this.price,
    @required this.tax,this.type,
    this.menuGroup
  });
}