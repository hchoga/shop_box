
import 'package:flutter/material.dart';
import 'package:shop_box/models/cart_item.dart';
import 'package:shop_box/models/sellableItem_model.dart';



class CartProviderViewModel extends ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      if (cartItem.price!=null) {
        total += double.parse(cartItem.price) * cartItem.quantity;
      }
      else  cartItem.menuGroup.forEach((element) {
        total+=double.parse(element.price) *cartItem.quantity ;
      });
    });
    return total;
  }

  double get totalAmountWithTax {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      if (cartItem.name!=null) {
        total += (double.parse(cartItem.price) * cartItem.quantity) +
            ((double.parse(cartItem.price) * cartItem.quantity) *
                double.parse(cartItem.tax) /
                100);
      }
    else   cartItem.menuGroup.forEach((element) {
        total += (double.parse(element.price) * cartItem.quantity) +
            ((double.parse(element.price) * cartItem.quantity) *
                double.parse(element.tax) /
                100);
      });
    });

    return total;
  }

  decreaseQuantity ({String productId}){
    if (_items[productId].quantity!=1) {
      _items[productId].quantity--;
      print(_items[productId].quantity);
    }
    else _items.remove(productId);
  }
  void addItem(
      {String productId, String price, String name, String image, String tax,List <SellableItem> menuGroup}) {
    if (_items.containsKey(productId)) {
      // change quantity...
      _items.update(
        productId,
            (existingCartItem) => CartItem(
            id: existingCartItem.id,
            name: existingCartItem.name,
            image: existingCartItem.image,
            price: existingCartItem.price,
            tax: existingCartItem.tax,
            quantity: existingCartItem.quantity + 1,
            menuGroup: existingCartItem.menuGroup
        ),
      );

    } else {
      _items.putIfAbsent(
        productId,
            () => CartItem(
            id: productId,
            name: name,
            price: price,
            image: image,
            tax: tax,
            quantity: 1,
            menuGroup: menuGroup
        ),
      );
    }


    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}

void menuCheckFunction ({userDataProvider}){
  if (userDataProvider.items.keys
      .toList()
      .contains("2") &&
      userDataProvider.items.keys
          .toList()
          .contains("1")&& userDataProvider.items.keys
      .toList()
      .contains("3")) {

    userDataProvider
        .addItem(
        productId: "99",
        menuGroup: [
          SellableItem(
              menuName: "menu1",
              name:  userDataProvider
                  .items["2"].name,
              price: userDataProvider
                  .items["2"].price,
              id: userDataProvider
                  .items["2"].id,
              image: userDataProvider
                  .items["2"].image,
              tax: userDataProvider
                  .items["2"].tax),
          SellableItem(
              name:userDataProvider
                  .items["1"].name,
              price: userDataProvider
                  .items["1"].price,
              id: userDataProvider
                  .items["1"].id,
              image: userDataProvider
                  .items["1"].image,
              tax: userDataProvider
                  .items["1"].tax),
          SellableItem(
              name: userDataProvider
                  .items["3"].name,
              price: userDataProvider
                  .items["3"].price,
              id: userDataProvider
                  .items["3"].id,
              image: userDataProvider
                  .items["3"].image,
              tax: userDataProvider
                  .items["3"].tax),
        ]);
    userDataProvider
        .decreaseQuantity(
        productId: "2");
    userDataProvider
        .decreaseQuantity(
        productId: "1");
    userDataProvider
        .decreaseQuantity(
        productId: "3");
  }

  else if (userDataProvider.items.keys
      .toList()
      .contains("4") &&
      userDataProvider.items.keys
          .toList()
          .contains("7")&& userDataProvider.items.keys
      .toList()
      .contains("3")) {

    userDataProvider
        .addItem(
        productId: "100",
        menuGroup: [
          SellableItem(
              menuName: "menu2",
              name: userDataProvider
                  .items["4"].name,
              price: userDataProvider
                  .items["4"].price,
              id: userDataProvider
                  .items["4"].id,
              image: userDataProvider
                  .items["4"].image,
              tax: userDataProvider
                  .items["4"].tax),
          SellableItem(
              name:userDataProvider
                  .items["7"].name,
              price: userDataProvider
                  .items["7"].price,
              id: userDataProvider
                  .items["7"].id,
              image: userDataProvider
                  .items["7"].image,
              tax: userDataProvider
                  .items["7"].tax),
          SellableItem(
              name: userDataProvider
                  .items["3"].name,
              price: userDataProvider
                  .items["3"].price,
              id: userDataProvider
                  .items["3"].id,
              image: userDataProvider
                  .items["3"].image,
              tax: userDataProvider
                  .items["3"].tax),
        ]);
    userDataProvider
        .decreaseQuantity(
        productId: "4");
    userDataProvider
        .decreaseQuantity(
        productId: "7");
    userDataProvider
        .decreaseQuantity(
        productId: "3");
  }
  if (userDataProvider.items.keys
      .toList()
      .contains("5") &&
      userDataProvider.items.keys
          .toList()
          .contains("6")) {

    userDataProvider
        .addItem(
        productId: "98",
        menuGroup: [
          SellableItem(
              menuName: "menu3",
              name: userDataProvider
                  .items["5"].name,
              price: userDataProvider
                  .items["5"].price,
              id: userDataProvider
                  .items["5"].id,
              image: userDataProvider
                  .items["5"].image,
              tax: userDataProvider
                  .items["5"].tax),
          SellableItem(
              name:userDataProvider
                  .items["6"].name,
              price: userDataProvider
                  .items["6"].price,
              id: userDataProvider
                  .items["6"].id,
              image: userDataProvider
                  .items["6"].image,
              tax: userDataProvider
                  .items["6"].tax),
        ]);
    userDataProvider
        .decreaseQuantity(
        productId: "5");
    userDataProvider
        .decreaseQuantity(
        productId: "6");

  }
}
