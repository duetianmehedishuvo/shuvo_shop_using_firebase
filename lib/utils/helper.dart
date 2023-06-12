import 'package:flutter/material.dart';

double getScreenHeight() => MediaQuery.of(navigatorKey.currentState!.context).size.height;

double getScreenWidth() => MediaQuery.of(navigatorKey.currentState!.context).size.width;

final navigatorKey = GlobalKey<NavigatorState>();

toScreen(String name) {
  Navigator.of(navigatorKey.currentState!.context).pushNamed(name);
}

// toRemoveUntilScreen(String name) {
//   Navigator.of(navigatorKey.currentState!.context).pushNamedAndRemoveUntil(name,RoutePredicate());
// }
