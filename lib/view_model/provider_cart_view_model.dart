import 'package:flutter/material.dart';
import 'package:shop_box/constants/data.dart';
import 'package:shop_box/models/cart_item.dart';
import 'package:shop_box/models/sellableItem_model.dart';
import 'package:provider/provider.dart';
import 'package:shop_box/view_model/provider_fetchData_view_model.dart';

class CartProviderViewModel extends ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  Map<String, CartItem> get items1 {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      if (cartItem.price != null) {
        total += double.parse(cartItem.price) * cartItem.quantity;
      } else
        cartItem.menuGroup.forEach((element) {
          total += double.parse(element.price) * cartItem.quantity;
        });
    });
    return total;
  }

  double get totalAmountWithTax {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      if (cartItem.name != null) {
        total += (double.parse(cartItem.price) * cartItem.quantity) +
            ((double.parse(cartItem.price) * cartItem.quantity) *
                double.parse(cartItem.tax) /
                100);
      } else
        cartItem.menuGroup.forEach((element) {
          total += (double.parse(element.price) * cartItem.quantity) +
              ((double.parse(element.price) * cartItem.quantity) *
                  double.parse(element.tax) /
                  100);
        });
    });

    return total;
  }

  decreaseQuantity({String productId}) {
    if (_items[productId].quantity != 1) {
      _items[productId].quantity--;
      print(_items[productId].quantity);
    } else
      _items.remove(productId);
  }

  void addItem(
      {String productId,
      String price,
      String name,
      String image,
      String tax,
      menuGroup}) {
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
            menuGroup: menuGroup ),
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
            menuGroup: menuGroup),
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

