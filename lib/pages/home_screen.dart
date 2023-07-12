import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shuvo_shop_test/helpers/authentication_service.dart';
import 'package:shuvo_shop_test/models/product_model.dart';
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
                // AuthenticationService service = AuthenticationService();
                // service.getAllProduct();
              },
              icon: Icon(Icons.add)),
          IconButton(
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).logout().then((value) {
                  if (value == true) {
                    toScreen(AuthScreen.route);
                  }
                });
              },
              icon: Icon(Icons.logout)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            toScreen(CreateProductScreen.route);
          },
          child: Icon(Icons.add)),
      body: FutureBuilder(
        future: AuthenticationService.getAllProduct(),
        builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    width: 100,
                    height: 100,
                    child: snapshot.data![index].imageUrl == null ? FlutterLogo()
                        : Image.network(snapshot.data![index].imageUrl!),
                  ),
                  title: Text(snapshot.data![index].name!),
                  subtitle: Text(snapshot.data![index].category!),
                );
              });
        },
      ),
    );
  }
}
