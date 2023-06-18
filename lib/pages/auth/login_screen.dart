import 'package:shuvo_shop_test/widgets/import_all_files.dart';

class LoginScreen extends StatelessWidget {
  static const route = '/login';

  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, child) => ListView(
          children: [
            Image.asset(ImagesUtils.logoImages, width: 150, height: 200, fit: BoxFit.fill),
            Center(child: Text(StringsUtils.appName, style: robotoMedium500.copyWith(fontSize: Dimension.fontSizeBig18))),
            SizedBox(height: 10),
            Center(child: Text(StringsUtils.login, style: robotoRegular400.copyWith(fontSize: Dimension.fontSizeExtraBig16))),
            SizedBox(height: 10),
            CustomTextField(
                controller: emailController, hintText: StringsUtils.enterYourEmailAddress, inputType: TextInputType.emailAddress),
            SizedBox(height: 10),
            CustomTextField(controller: passwordController, hintText: StringsUtils.enterYourPassword),
            authProvider.isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      authProvider.login(emailController.text, passwordController.text, (int value) {
                        if (value == 1) {
                          toScreen(HomeScreen.route);
                        } else {}
                      });

                      // AuthenticationService ss = AuthenticationService();
                      // ss.login('tt@gmail.com', '12345678');
                    },
                    child: Text(StringsUtils.login)),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                toScreen(SignupScreen.route);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(StringsUtils.dontHaveAnAccount),
                  SizedBox(width: 3),
                  Text(StringsUtils.signupHere),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
