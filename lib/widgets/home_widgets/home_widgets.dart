import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_box/constants/buttons.dart';
import 'package:shop_box/constants/data.dart';
import 'package:shop_box/models/sellableItem_model.dart';
import 'package:shop_box/view_model/provider_cart_view_model.dart';

Widget addCustomerWidget({Function onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              Icon(
                Icons.person_add_alt,
                size: 28,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "Add Customer",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget driversMenu() {
  return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Icon(
            Icons.cloud_download_outlined,
            size: 28,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Icon(
              Icons.add_box_outlined,
              size: 28,
            ),
          ),
          Icon(
            Icons.qr_code_scanner_sharp,
            size: 28,
          ),
          Spacer(
            flex: 1,
          ),
          Icon(
            Icons.more_vert,
            size: 28,
          )
        ],
      ));
}

Widget sellableItemWidget(
    {String image,
    String itemName,
    String price,
    int count,
    bool countOrPrice = false,
    List<SellableItem> sellableList,
    Function onTap}) {
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


Widget sellableItemMenu ({
  List<SellableItem> sellableList,
  Function onTap,int quantity,String productId}){
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

Widget customerCartMenu({context,Widget widget}) {
  var cartProvider = Provider.of<CartProviderViewModel>(context, listen: false);
  return Container(
    child: Column(
      children: [
        Flexible(flex: 1, child: addCustomerWidget()),
        SizedBox(
          height: 15,
        ),
        Flexible(
          flex: 8,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
              child: Column(
                children: [
                  driversMenu(),
                  Divider(
                    color: Colors.grey[300],
                    indent: 15,
                    endIndent: 15,
                  ),
                 widget,
                  Spacer(
                    flex: 1,
                  ),
                  Row(
                    children: [
                      Text(
                        "Subtotal",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Text(
                        "${cartProvider.totalAmount.toStringAsFixed(2)} Kr ",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.grey[300],
                    indent: 15,
                    endIndent: 15,
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Total after Tax",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Text(
                        "${cartProvider.totalAmountWithTax.toStringAsFixed(2)} Kr ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}

