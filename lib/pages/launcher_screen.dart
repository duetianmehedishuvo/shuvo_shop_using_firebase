import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shuvo_shop_test/pages/auth_screen.dart';
import 'package:shuvo_shop_test/pages/home_screen.dart';
import 'package:shuvo_shop_test/utils/helper.dart';
import 'package:shuvo_shop_test/utils/image_utils.dart';

class LauncherScreen extends StatefulWidget {
  static const route = '/launch';

  const LauncherScreen({Key? key}) : super(key: key);

  @override
  State<LauncherScreen> createState() => _LauncherScreenState();
}

class _LauncherScreenState extends State<LauncherScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushNamed(LoginScreen.route);
    });
    // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(ImagesUtils.logoImages, width: 100, height: 100)),
    );
  }
}
