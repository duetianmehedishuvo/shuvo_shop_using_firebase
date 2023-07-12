import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shuvo_shop_test/helpers/authentication_service.dart';
import 'package:shuvo_shop_test/models/product_model.dart';
import 'package:shuvo_shop_test/utils/app_constraints.dart';

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

  login(String email, String password, Function callback) {
    isLoading = true;
    notifyListeners();
    authenticationService.login(email, password, (int value) {
      isLoading = false;
      notifyListeners();
      callback(value);
    });
  }

  Future<bool> isLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(AppConstraints.userId) && prefs.getString(AppConstraints.userId)!.isNotEmpty) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(AppConstraints.userId);
    prefs.remove(AppConstraints.userEmail);
    prefs.remove(AppConstraints.userName);
    return Future.value(true);
  }

  File? productImage;
  String imageUrl = '';

  void pickImage() async {
    imageUrl = '';
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      productImage = File(image.path);

      authenticationService.uploadImage(productImage!).then((value) {
        imageUrl = value;
        notifyListeners();
      });
    }
    notifyListeners();
  }

  List<String> categoryLists = ['book', 'pen', 'table', 'laptop'];
  String selectedCategory = 'book';

  changeCategory(String value) {
    selectedCategory = value;
    notifyListeners();
  }

  uploadProduct(ProductModel productModel, Function callback) {
    isLoading = true;
    notifyListeners();
    authenticationService.uploadProduct(productModel, (int value) {
      isLoading = false;
      notifyListeners();
      if (value == 1) {
        callback(1);
      } else {
        callback(0);
      }
    });
  }
}
