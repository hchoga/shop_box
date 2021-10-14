import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_box/view/home_view.dart';
import 'package:shop_box/view_model/provider_view_model.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProviderViewModel(),
      child: MaterialApp(
        title: 'shop box',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[200],
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    );
  }
}
