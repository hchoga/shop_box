import 'package:flutter/material.dart';
import 'package:shop_box/models/menu_group_model.dart';



class Menu {
  final String name,image,price,tax,percentage;
   final List <MenuGroup> menuGroupList;
   Menu({this.image,this.name,this.price,this.tax,this.menuGroupList,this.percentage});
}


