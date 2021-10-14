import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_box/constants/buttons.dart';
import 'package:shop_box/view_model/provider_view_model.dart';
import 'package:shop_box/widgets/home_widgets/home_widgets.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userDataProvider =
        Provider.of<ProviderViewModel>(context, listen: false);
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
                      future: userDataProvider.fetchSellableItem(""),
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
                                      child: sellableItemWidget(
                                          onTap: () {
                                            setState(() {
                                              userDataProvider.addItem(
                                                  snapshots.data[i].id,
                                                  snapshots.data[i].price,
                                                  snapshots.data[i].name,
                                                  snapshots.data[i].image,
                                                snapshots.data[i].tax,
                                              );

                                              print(userDataProvider
                                                  .items.values
                                                  .toList());
                                            });
                                          },
                                          itemName: snapshots.data[i].name,
                                          image: snapshots.data[i].image,
                                          price: snapshots.data[i].price)),
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
              Flexible(flex: 2, child: customerCartMenu(context))
            ],
          ),
        ),
      ),
    );
  }
}

// Text(user.name[0] + user.name[lastLitter],
