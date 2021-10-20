import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_box/view_model/provider_cart_view_model.dart';
import 'package:shop_box/widgets/home_widgets/add_customer/add_cutsomer_widget.dart';
import 'package:shop_box/widgets/home_widgets/drivers_menu/drivers_menu_widget.dart';



class  CustomerCartMenu extends StatelessWidget {
  final Widget widget;
  CustomerCartMenu({this.widget});
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProviderViewModel>(context, listen: false);
    return Container(
      child: Column(
        children: [
          Flexible(flex: 1, child: AddCustomerWidget()),
          SizedBox(
            height: 15,
          ),
          Flexible(
            flex: 8,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                child: Column(
                  children: [
                    DriversMenuWidget(),
                    Divider(
                      color: Colors.grey[300],
                      indent: 15,
                      endIndent: 15,
                    ),
                    widget,
                    Spacer(
                      flex: 1,
                    ),
                    Row(
                      children: [
                        Text(
                          "Subtotal",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Text(
                          "${cartProvider.totalAmount.toStringAsFixed(2)} Kr ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.grey[300],
                      indent: 15,
                      endIndent: 15,
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Total after Tax",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Text(
                          "${cartProvider.totalAmountWithTax.toStringAsFixed(2)} Kr ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

