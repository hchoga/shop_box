import 'dart:io';

import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_box/models/sellableItem_model.dart';
import 'package:shop_box/services/api/api_end_point/apis_endpoints.dart';
import 'package:shop_box/view_model/provider_fetchData_view_model.dart';

class ApiService {
  static Future fetchPosts(ProviderFetchDataViewModel dataViewModel) async {
    List<SellableItem> loadedData = [];
    final response = await http.get(API.sellableItems);
    if (response.statusCode >= 400)
      print('error');
    else {
      final decodedData = jsonDecode(response.body);
      final List body = decodedData['data'];
      body.forEach((element) {
        loadedData.add(SellableItem.fromMap(element));
      });
    }
    dataViewModel.setSellableList(loadedData);
    return loadedData;
  }
}
