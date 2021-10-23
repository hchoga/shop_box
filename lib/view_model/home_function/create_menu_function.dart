
import 'package:shop_box/models/sellableItem_model.dart';

import '../provider_cart_view_model.dart';
import '../provider_fetchData_view_model.dart';


void menuGeneratorFunction({CartProviderViewModel cartProvider,ProviderFetchDataViewModel fetchDataProvider}) {


  for (int i = 0; i < fetchDataProvider.menuList.length; i++) {
    List<String> menusCheckList = [];
    List <String> menusNames=[];
    List <String> menusIds=[];
    List <String> menusImages=[];
    for (int k = 0; k < fetchDataProvider.menuList[i].sellableItemList.length; k++) {
      menusCheckList.add(fetchDataProvider.menuList[i].sellableItemList[k].id);
      menusNames.add(fetchDataProvider.menuList[i].name);
      menusIds.add(fetchDataProvider.menuList[i].id);
      menusImages.add(fetchDataProvider.menuList[i].image);
    }

    if (menusCheckList.every((item) => cartProvider.items.keys.toList().contains(item))) {
      for (int i=0; i<menusCheckList.length;i++){
        cartProvider.addItem(productId:menusIds[i],
            image: menusImages[i],
            menuGroup: [
              SellableItem(

                  menuName: menusNames[i],
                  name: fetchDataProvider.sellableList[i].name,
                  price: fetchDataProvider.sellableList[i].price,
                  id: fetchDataProvider.sellableList[i].id,
                  image: fetchDataProvider.sellableList[i].image,
                  tax: fetchDataProvider.sellableList[i].tax),

            ]);
        cartProvider.decreaseQuantity(productId: menusCheckList[i]);

      }
      for (int i=0; i<menusCheckList.length-1;i++){
        cartProvider.decreaseQuantity(productId: menusIds[i].toString());
      }}
    else print("false");

  }


}
