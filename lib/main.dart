import 'package:flutter/material.dart';
import 'package:shuvo_shop_test/pages/add_product_screen.dart';
import 'package:shuvo_shop_test/pages/auth_screen.dart';
import 'package:shuvo_shop_test/pages/home_screen.dart';
import 'package:shuvo_shop_test/pages/launcher_screen.dart';
import 'package:shuvo_shop_test/utils/helper.dart';
import 'package:shuvo_shop_test/utils/routing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shuvo Shop',
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: allRouters,
      home: const LauncherScreen(),
    );
  }
}
