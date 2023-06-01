import 'package:flutter/material.dart';
import 'package:shuvo_shop_test/utils/helper.dart';

void showSnackBarMessage(String title, {bool isError = true}) {
  ScaffoldMessenger.of(navigatorKey.currentState!.context)
      .showSnackBar(SnackBar(content: Text(title), backgroundColor: isError ? Colors.red : Colors.green));
}

