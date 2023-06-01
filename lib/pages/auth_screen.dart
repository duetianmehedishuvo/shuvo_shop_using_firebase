import 'package:flutter/material.dart';
import 'package:shuvo_shop_test/utils/custome_style.dart';
import 'package:shuvo_shop_test/utils/dimension.dart';
import 'package:shuvo_shop_test/utils/helper.dart';
import 'package:shuvo_shop_test/utils/image_utils.dart';
import 'package:shuvo_shop_test/utils/string_utils.dart';

class LoginScreen extends StatelessWidget {
  static const route = '/auth';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset(ImagesUtils.logoImages, width: 150, height: 200, fit: BoxFit.fill),
          Center(child: Text(StringsUtils.appName, style: robotoMedium500.copyWith(fontSize: Dimension.fontSizeBig18))),
          Center(child: Text(StringsUtils.login, style: robotoRegular400.copyWith(fontSize: Dimension.fontSizeExtraBig16))),
        ],
      ),
    );
  }
}
