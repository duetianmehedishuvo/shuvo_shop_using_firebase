import 'package:flutter/material.dart';

double  getScreenHeight() => MediaQuery.of(navigatorKey.currentState!.context).size.height;
double  getScreenWidth() => MediaQuery.of(navigatorKey.currentState!.context).size.width;

final navigatorKey = GlobalKey<NavigatorState>();
