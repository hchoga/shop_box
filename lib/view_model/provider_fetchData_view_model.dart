import 'package:flutter/material.dart';
import 'package:shop_box/models/menu_model.dart';
import 'package:shop_box/models/sellableItem_model.dart';
import 'package:shop_box/services/api/api_service/api_service.dart';

class ProviderFetchDataViewModel extends ChangeNotifier {
  List _sellableList = [];
  List<Menu> _menusList = [];
  Future future ;
  List<Menu> get menusList => [..._menusList];

  List get sellableList => [..._sellableList];

  setMenusList() async {
    _menusList = await ApiService.fetchMenus();
    notifyListeners();
  }


  setSellableList()async {
    _sellableList = extractSellableItemList(_menusList);
    notifyListeners();
  }


  fetchData() async {
    await setMenusList();
    await setSellableList();
    return extractSellableItemList( _menusList);
  }

  extractSellableItemList(loadedData) {
    List sellableList = [];

    for (int i = 0; i < loadedData.length; i++) {
      for (int k = 0; k < loadedData[i].menuGroupList.length; k++) {
        for (int z = 0;
            z < loadedData[i].menuGroupList[k].sellableItemList.length;
            z++) {
          sellableList.add(SellableItem(
            type: loadedData[i].name,
              name: loadedData[i].menuGroupList[k].sellableItemList[z].name,
              tax: loadedData[i]
                  .menuGroupList[k]
                  .sellableItemList[z]
                  .tax
                  .toString(),
              price: loadedData[i]
                  .menuGroupList[k]
                  .sellableItemList[z]
                  .price
                  .toString(),
              id: loadedData[i]
                  .menuGroupList[k]
                  .sellableItemList[z]
                  .id
                  .toString()));
        }
      }
    }

    return sellableList;
  }
}
