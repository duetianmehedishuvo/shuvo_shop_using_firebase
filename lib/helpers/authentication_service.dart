import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shuvo_shop_test/widgets/custom_message.dart';
import 'package:shuvo_shop_test/widgets/import_all_files.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  createUser(String name, String email, String phoneNo, String password, Function callBack) async {
    _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
      UserModel userModel = UserModel(value.user!.uid, name, phoneNo, email);

      firebaseFirestore
          .collection(AppConstraints.user)
          .doc(AppConstraints.user)
          .collection(value.user!.uid)
          .doc(AppConstraints.user)
          .set(userModel.toJson())
          .then((value) {
        callBack(1);
      });

      print(userModel.toJson());
    });
  }

  login(String email, String password, Function callback) async {
    _firebaseAuth.signInWithEmailAndPassword(email: email, password: password).then((value) async {
      var result = await firebaseFirestore
          .collection(AppConstraints.user)
          .doc(AppConstraints.user)
          .collection(value.user!.uid)
          .doc(AppConstraints.user)
          .get();
      UserModel userModel = UserModel.fromJson(result.data()!);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(AppConstraints.userId, value.user!.uid);
      prefs.setString(AppConstraints.userName, userModel.name!);
      prefs.setString(AppConstraints.userEmail, userModel.email!);

      callback(1);
    }).catchError((e) {
      if (e.toString().startsWith('[firebase_auth/user-not-found]')) {
        showSnackBarMessage(e.toString().replaceAll("[firebase_auth/user-not-found]", ""));
      } else if (e.toString().startsWith('[firebase_auth/wrong-password]')) {
        showSnackBarMessage(e.toString().replaceAll("[firebase_auth/wrong-password]", ""));
      }

      callback(0);
    });
  }



  uploadImage(File file)async{
    final firebaseStorage = FirebaseStorage.instance;

    var snapshot = firebaseStorage.ref()
        .child('images/imageName')
        .putFile(file).snapshot;
    var downloadUrl = await snapshot.ref.getDownloadURL();
    // setState(() {
    //   imageUrl = downloadUrl;
    // });

    print(downloadUrl);
  }


// login(String email, String password) async {
//   // UserCredential userData=await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
//   // UserModel userModel=UserModel(userData.user!.uid,name,phoneNo,email);
//
//   return _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
// }
}
