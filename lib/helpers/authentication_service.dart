import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shuvo_shop_test/models/product_model.dart';
import 'package:shuvo_shop_test/models/student_model.dart';
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
      var result =
          await firebaseFirestore.collection(AppConstraints.user).doc(AppConstraints.user).collection(value.user!.uid).doc(AppConstraints.user).get();
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

  Future<String> uploadImage(File file) async {
    final firebaseStorage = FirebaseStorage.instance;

    var snapshot = firebaseStorage.ref().child('images/').child('').putFile(file).snapshot;
    var downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  uploadProduct(ProductModel productModel, Function callBack) async {
    firebaseFirestore.collection(AppConstraints.product).doc(productModel.id.toString()).set(productModel.toJson()).then((value) {
      callBack(1);
    });
  }

  static final DatabaseReference messagesRef = FirebaseDatabase.instance.ref();

  static Future<List<ProductModel>> getAllProduct() async {
    List<ProductModel> data = [];
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var snapshot = await firebaseFirestore.collection(AppConstraints.product).get();

    if (snapshot != null) {
      data = snapshot.docs.map((e) {
        print(e.data());
        return ProductModel.fromJson(e.data());
      }).toList();
      return data;
    }

    return data;
  }

// login(String email, String password) async {
//   // UserCredential userData=await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
//   // UserModel userModel=UserModel(userData.user!.uid,name,phoneNo,email);
//
//   return _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
// }

//TODO:    this is for student

  addStudentRecord(StudentModel studentModel, int series, Function callBack) async {
    firebaseFirestore
        .collection(AppConstraints.series)
        .doc('data')
        .collection('$series Series')
        .doc(studentModel.id.toString())
        .set(studentModel.toJson())
        .then((value) {

      firebaseFirestore.collection(AppConstraints.seriesName).doc(series.toString()).set({'series': '$series Series'}).then((value){
        callBack(1);
      });


    });
  }

  static getAllCategorySeries() async {
    // List<ProductModel> data = [];
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var snapshot = await firebaseFirestore.collection(AppConstraints.seriesName).get();
    print('${snapshot.metadata} ${snapshot.size}');
    snapshot.docs.toList().forEach((element) {
      print(element.id);
    });

    // firebaseFirestore.collection(AppConstraints.series).get().then((value){
    //   print('shuvo ${value.docs.first.id}');
    // });
    // print('shuvo ${snapshot}');
    // snapshot.get().then((value){
    //   print(value.docs as Map<String, dynamic>);
    // });
    //
    //     // .doc('data').id;
    // print(snapshot);
    // snapshot.then((value){
    //
    //   print(value.data());
    // });
    // if (snapshot != null) {
    //   data = snapshot.docs.map((e) {
    //     print(e.data());
    //     return ProductModel.fromJson(e.data());
    //   }).toList();
    //   return data;
    // }
    //
    // return data;
  }

  static getAllSeries(int series) async {
    // List<ProductModel> data = [];
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var snapshot = await firebaseFirestore.collection(AppConstraints.series)
        .doc('data')
        .collection('$series Series').get();
    // print('${snapshot.metadata} ${snapshot.size}');
    snapshot.docs.toList().forEach((element) {
      print(element.data());
    });

    // firebaseFirestore.collection(AppConstraints.series).get().then((value){
    //   print('shuvo ${value.docs.first.id}');
    // });
    // print('shuvo ${snapshot}');
    // snapshot.get().then((value){
    //   print(value.docs as Map<String, dynamic>);
    // });
    //
    //     // .doc('data').id;
    // print(snapshot);
    // snapshot.then((value){
    //
    //   print(value.data());
    // });
    // if (snapshot != null) {
    //   data = snapshot.docs.map((e) {
    //     print(e.data());
    //     return ProductModel.fromJson(e.data());
    //   }).toList();
    //   return data;
    // }
    //
    // return data;
  }
}
