import 'package:cloud_firestore/cloud_firestore.dart';
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
          .add(userModel.toJson())
          .then((value) {
        callBack(1);
      });

      print(userModel.toJson());
    });
  }

  login(String email, String password) async {
    // UserCredential userData=await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    // UserModel userModel=UserModel(userData.user!.uid,name,phoneNo,email);

    return _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }
}
