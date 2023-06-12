import 'package:flutter/foundation.dart';
import 'package:shuvo_shop_test/helpers/authentication_service.dart';

class AuthProvider with ChangeNotifier {
  bool isLoading = false;
  AuthenticationService authenticationService = AuthenticationService();

  void addUser(String name, String email, String password, String phone) {
    isLoading = true;
    notifyListeners();
    authenticationService.createUser(name, email, phone, password, (int status) {
      if (status == 1) {
        isLoading = false;
        notifyListeners();
      }
    });
  }
}
