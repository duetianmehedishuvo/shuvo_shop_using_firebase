import 'package:shuvo_shop_test/widgets/import_all_files.dart';

class LoginScreen extends StatelessWidget {
  static const route = '/login';
  const LoginScreen({super.key});

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
