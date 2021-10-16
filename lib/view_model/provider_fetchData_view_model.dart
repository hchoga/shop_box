import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shop_box/models/cart_item.dart';
import 'package:shop_box/models/sellableItem_model.dart';
import 'package:shop_box/services/apis_endpoints.dart';
import 'package:http/http.dart' as http;


class ProviderFetchDataViewModel extends ChangeNotifier {
  List<SellableItem> _sellableList = [];

  List<SellableItem> get sellableList => [..._sellableList];

  Future fetchSellableItem(token) async {
    final String url = '${API.sellableItems}';
    List<SellableItem> loadedData = [];

    try {
      final response = await http.get(url,
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
      final extractedData = jsonDecode(response.body);
      // print(extractedData);
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


}
