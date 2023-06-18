import 'package:flutter/material.dart';
import 'package:shuvo_shop_test/pages/product/create_product_screen.dart';

import '../widgets/import_all_files.dart';

class HomeScreen extends StatelessWidget {
  static const route = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: SizedBox.shrink(),
        leadingWidth: 10,
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).logout().then((value) {
                  if (value == true) {
                    toScreen(AuthScreen.route);
                  }
                });
              },
              icon: Icon(Icons.logout))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            toScreen(CreateProductScreen.route);
          },
          child: Icon(Icons.add)),
    );
  }
}
