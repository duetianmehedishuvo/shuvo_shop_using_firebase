import 'package:flutter/material.dart';
import 'package:shuvo_shop_test/pages/add_product_screen.dart';
import 'package:shuvo_shop_test/pages/auth/login_screen.dart';
import 'package:shuvo_shop_test/pages/auth/signup_screen.dart';
import 'package:shuvo_shop_test/pages/auth_screen.dart';
import 'package:shuvo_shop_test/pages/home_screen.dart';
import 'package:shuvo_shop_test/pages/launcher_screen.dart';

Map<String, WidgetBuilder> allRouters = {
  LauncherScreen.route: (context) => const LauncherScreen(),
  AuthScreen.route: (context) => const AuthScreen(),
  LoginScreen.route: (context) => const LoginScreen(),
  SignupScreen.route: (context) =>  SignupScreen(),
  HomeScreen.route: (context) => const HomeScreen(),
  AddProductScreen.route: (context) => const AddProductScreen(),
};
