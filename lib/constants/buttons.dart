import 'package:flutter/material.dart';


Widget discountButton (){
  return Row(
    children: [
      Text(
        "Discount",
        style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w600,
            fontSize: 16),
      ),
      SizedBox(width: 8),
      Icon(
        Icons.money_off_outlined,
        color: Colors.red,
        size: 20,
      ),
    ],
  );
}