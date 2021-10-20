import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_box/services/api/api_service/api_service.dart';
import 'package:shop_box/view_model/provider_cart_view_model.dart';
import 'package:shop_box/view_model/provider_fetchData_view_model.dart';
import 'package:shop_box/widgets/home_widgets/customer_cart_menu/customer_cart_widget.dart';
import 'package:provider/provider.dart';
import 'package:shop_box/widgets/home_widgets/sellable_item/sellable_item_widget.dart';
import 'package:shop_box/widgets/home_widgets/sellable_item_menu/sellable_item_menu.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cartProvider =
        Provider.of<CartProviderViewModel>(context, listen: true);
    var fetchDataProvider =
        Provider.of<ProviderFetchDataViewModel>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Flexible(
                  flex: 5,
                  child: Container(
                    child: FutureBuilder(
                      future: ApiService.fetchPosts(fetchDataProvider),
                      builder: (context, snapshots) {
                        if (snapshots.hasData) {
                          return GridView.builder(
                              itemCount: snapshots.data.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      crossAxisSpacing: 15,
                                      mainAxisSpacing: 15,
                                      childAspectRatio: 9 / 7),
                              itemBuilder: (context, i) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SellableItemWidget(
                                        itemName: snapshots.data[i].name,
                                        image: snapshots.data[i].image,
                                        price: snapshots.data[i].price,
                                        onTap: () {
                                          cartProvider.addItem(
                                            productId: snapshots.data[i].id,
                                            price: snapshots.data[i].price,
                                            name: snapshots.data[i].name,
                                            image: snapshots.data[i].image,
                                            tax: snapshots.data[i].tax,
                                          );
                                          print(fetchDataProvider
                                              .sellableList[0].name);
                                          menuCheckFunction(
                                              userDataProvider: cartProvider);
                                        },
                                      )),
                                );
                              });
                        } else
                          return Center(child: CircularProgressIndicator());
                      },
                    ),
                  )),
              SizedBox(
                width: 20,
              ),
              Flexible(
                  flex: 2,
                  child: CustomerCartMenu(
                    widget: SingleChildScrollView(
                      child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: cartProvider.itemCount,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 3,
                                  mainAxisSpacing: 3,
                                  childAspectRatio: 9 / 7),
                          itemBuilder: (context, i) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: cartProvider.items.values
                                              .toList()[i]
                                              .name ==
                                          null
                                      ? SellableItemMenu(
                                          productId: cartProvider.items.values
                                              .toList()[i]
                                              .id,
                                          sellableList: cartProvider
                                              .items.values
                                              .toList()[i]
                                              .menuGroup,
                                          quantity: cartProvider.items.values
                                              .toList()[i]
                                              .quantity)
                                      : SellableItemWidget(
                                          onTap: () {},
                                          itemName: cartProvider.items.values
                                              .toList()[i]
                                              .name,
                                          image: cartProvider.items.values
                                              .toList()[i]
                                              .image,
                                          count: cartProvider.items.values
                                              .toList()[i]
                                              .quantity,
                                          countOrPrice: true)),
                            );
                          }),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
