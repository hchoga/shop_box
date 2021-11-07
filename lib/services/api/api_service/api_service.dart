import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_box/models/menu_group_model.dart';
import 'package:shop_box/models/menu_model.dart';
import 'package:shop_box/models/sellableItem_model.dart';
import 'package:shop_box/services/api/api_end_point/apis_endpoints.dart';
import 'package:shop_box/view_model/provider_fetchData_view_model.dart';

class ApiService {
  static Future fetchMenus() async {
    List<Menu> loadedData = [];

    final response = await http.get(API.menusApis);
    if (response.statusCode >= 400)
      print('error');
    else {
      final decodedData = jsonDecode(response.body);
      final List body = decodedData;
      body.forEach((menuElement) {
        loadedData.add(Menu.fromMap(menuElement));
      });
    }

    // dataViewModel.setMenusList(loadedData);
    //
    // dataViewModel.setSellableList(await extractSellableItemList(loadedData));
print("done");
    return loadedData;
  }

}
