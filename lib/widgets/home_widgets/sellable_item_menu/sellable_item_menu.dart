import 'package:flutter/material.dart';
import 'package:shop_box/constants/data.dart';
import 'package:shop_box/models/sellableItem_model.dart';


class SellableItemMenu extends StatelessWidget {
  final List <SellableItem> sellableList;
  final Function onTap;
  final int quantity;
  final  String productId;
  SellableItemMenu({this.onTap,this.sellableList,this.quantity,this.productId});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Flexible(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(productId=="99"?testImageList[0]:productId=="98"?testImageList[1]:testImageList[2]),
                    ),
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(6)),
              )),
          SizedBox(
            height: 8,
          ),
          Flexible(
              flex: 1,
              child: Text(
                sellableList[0].menuName,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 5,
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "$quantity",
              ))
        ],
      ),
    );
  }
}

