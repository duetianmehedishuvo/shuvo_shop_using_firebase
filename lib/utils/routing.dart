import 'package:flutter/material.dart';
import 'package:shuvo_shop_test/pages/add_product_screen.dart';
import 'package:shuvo_shop_test/pages/auth_screen.dart';
import 'package:shuvo_shop_test/pages/home_screen.dart';
import 'package:shuvo_shop_test/pages/launcher_screen.dart';

Map<String, WidgetBuilder> allRouters = {
  LauncherScreen.route: (context) => LauncherScreen(),
  LoginScreen.route: (context) => LoginScreen(),
  HomeScreen.route: (context) => HomeScreen(),
  AddProductScreen.route: (context) => AddProductScreen(),
};
