import 'package:flutter/material.dart';
import 'package:shop_box/models/menu_group_model.dart';
import 'package:shop_box/models/sellableItem_model.dart';

class Menu {
  String name, image, price, id, tax, percentage;
  List menuGroupList;

  Menu(
      {this.image,
      this.name,
      this.price,
      this.tax,
      this.menuGroupList,
      this.percentage,
      this.id});

  Menu.fromMap(Map<String, dynamic> data) {
    price = data["price"].toString();
    name = data['name'];
    id = data['uid'].toString();
    menuGroupList = data['menu_groups']
        .map((menuGroupElement) => MenuGroup(
              quantity: menuGroupElement['quantity'],
              menuPercentage: menuGroupElement['percentage'].toString(),
              sellableItemList: menuGroupElement['sellable_list']
                  .map((sellableItem) => SellableItem(
                        id: sellableItem['uid'].toString(),
                        name: sellableItem['name'],
                        price: sellableItem['selling_price'].toString(),
                        tax: sellableItem['tax'].toString(),
                      ))
                  .toList(),
            ))
        .toList();


  }


}
