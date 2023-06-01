import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService{

  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

  createUser()async{
    UserCredential userData=await _firebaseAuth.createUserWithEmailAndPassword(email: 'test@gmail.com', password: '123456');

  }


}