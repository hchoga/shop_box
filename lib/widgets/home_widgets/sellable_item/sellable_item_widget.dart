import 'package:flutter/material.dart';
import 'package:shop_box/models/sellableItem_model.dart';



class  SellableItemWidget extends StatelessWidget {
  final String image,itemName,price;
  final int count;
  final Function onTap;
  final bool countOrPrice;
  final List <SellableItem> sellableList;
  SellableItemWidget({this.price,this.image,this.sellableList,this.count,this.countOrPrice=false,this.itemName,this.onTap});
  @override
  Widget build(BuildContext context) {
    var lastLitter = itemName.indexOf(' ') + 1;
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              flex: 5,
              child: image == null||image.isEmpty
                  ? Container(
                child: Center(
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.green[800],
                    child: Text(
                      itemName[0] + itemName[lastLitter],
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(6)),
              )
                  : Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(image),
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
                itemName,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 5,
          ),
          countOrPrice
              ? Align(
              alignment: Alignment.bottomRight,
              child: Text(
                count.toString(),
              ))
              : Align(
              alignment: Alignment.bottomRight,
              child: Text(
                price == null ? "?" : "${price.toString()} Kr",
              ))
        ],
      ),
    );
  }
}


