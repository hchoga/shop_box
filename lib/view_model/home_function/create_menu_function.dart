import 'package:shop_box/models/sellableItem_model.dart';

import '../provider_cart_view_model.dart';
import '../provider_fetchData_view_model.dart';

void menuGeneratorFunction(
    {CartProviderViewModel cartProvider,
    ProviderFetchDataViewModel fetchDataProvider}) {
  List <List> checkedList = [];
  for (int w = 0; w < fetchDataProvider.menusList.length; w++) {
    for (int k = 0;
        k < fetchDataProvider.menusList[w].menuGroupList.length;
        k++) {
      for (int z = 0;
          z <
              fetchDataProvider
                  .menusList[w].menuGroupList[k].sellableItemList.length;
          z++) {
      print(fetchDataProvider
          .menusList[w].menuGroupList[k].quantity);

      // should check here if menuGroup quantity == sellable list [i] in cart
        // if true add this menu group to Cart and remove items

      }
    }
  }
}
