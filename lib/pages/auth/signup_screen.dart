import 'package:shuvo_shop_test/widgets/import_all_files.dart';

class SignupScreen extends StatelessWidget {
  static const route = '/signup';

  SignupScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
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
            Center(child: Text(StringsUtils.signUp, style: robotoRegular400.copyWith(fontSize: Dimension.fontSizeExtraBig16))),
            SizedBox(height: 30),
            CustomTextField(controller: nameController, hintText: StringsUtils.enterYourName),
            SizedBox(height: 10),
            CustomTextField(
                controller: emailController, hintText: StringsUtils.enterYourEmailAddress, inputType: TextInputType.emailAddress),
            SizedBox(height: 10),
            CustomTextField(controller: phoneController, hintText: StringsUtils.enterYourPhone, inputType: TextInputType.phone),
            SizedBox(height: 10),
            CustomTextField(controller: passwordController, hintText: StringsUtils.enterYourPassword),
            authProvider.isLoading?CircularProgressIndicator():
            ElevatedButton(
                onPressed: () {
                  authProvider.addUser(nameController.text, emailController.text, passwordController.text, phoneController.text);
                },
                child: Text(StringsUtils.signUp)),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                toScreen(LoginScreen.route);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(StringsUtils.alreadyHaveAnAccount),
                  SizedBox(width: 3),
                  Text(StringsUtils.loginHere),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
