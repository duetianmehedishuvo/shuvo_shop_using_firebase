import 'package:shuvo_shop_test/widgets/import_all_files.dart';

class AuthScreen extends StatelessWidget {
  static const route = '/auth';

  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset(ImagesUtils.logoImages, width: 150, height: 200, fit: BoxFit.fill),
          Center(child: Text(StringsUtils.appName, style: robotoMedium500.copyWith(fontSize: Dimension.fontSizeBig18))),
          SizedBox(height: 10),
          Center(child: Text(StringsUtils.pleaseChooseOneFor, style: robotoRegular400.copyWith(fontSize: Dimension.fontSizeExtraBig16))),
          SizedBox(height: 20),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pushNamed(LoginScreen.route);
            },
            child: Text('Login', style: robotoMedium500.copyWith(color: Colors.white,fontSize: 18)),
            color: kPrimaryColor,
          ),
          SizedBox(height: 20),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pushNamed(SignupScreen.route);
            },
            child: Text('Signup', style: robotoMedium500.copyWith(color: Colors.white,fontSize: 18)),
            color: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
