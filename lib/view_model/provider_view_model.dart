import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shop_box/models/sellableItem_model.dart';
import 'package:shop_box/services/apis_endpoints.dart';
import 'package:http/http.dart' as http;

class CartItem {
  final String id;
  final String name;
  final int quantity;
  final String price;
  final String image;
  final String tax;

  CartItem({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.quantity,
    @required this.price,
    @required this.tax,
  });
}

class ProviderViewModel extends ChangeNotifier {
  List<SellableItem> _sellableList = [];

  List<SellableItem> get sellableList => [..._sellableList];

  Future fetchSellableItem(token) async {
    final String url = '${API.sellableItems}';
    List<SellableItem> loadedData = [];

    try {
      final response = await http.get(url,
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
      final extractedData = jsonDecode(response.body);
      print(extractedData);
      final dataList = extractedData["data"];
      dataList.forEach((element) {
        loadedData.add(SellableItem(
            id: element['id'],
            name: element["name"],
            price: element['price'],
            image: element['image'],
            tax: element['tax'],
            percentage: element['percentage']));
      });

      _sellableList = loadedData;

      notifyListeners();
      return _sellableList;
    } catch (exception) {
      print('error');
      print(exception);
    }
  }

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
      total += double.parse(cartItem.price) * cartItem.quantity;
    });
    return total;
  }

  double get totalAmountWithTax {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += (double.parse(cartItem.price) * cartItem.quantity) +
          ((double.parse(cartItem.price) * cartItem.quantity) *
              double.parse(cartItem.tax) /
              100);
    });
    return total;
  }

  void addItem(
      String productId, String price, String name, String image, String tax) {
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
