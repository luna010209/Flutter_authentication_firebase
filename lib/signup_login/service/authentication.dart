import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signupUser({
    required String email,
    required String password,
    required String name,
  }) async {
    String res = " Some error Occurred";
    try {
      // for user log in with email and password
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      // for adding user to cloud firestore
      // await _firestore.collection("users").doc(credential.user!.uid).set({
      //   'name': name,
      //   'email': email,
      //   'uid': credential.user!.uid,
      // });
      res = "Signup Successful";
    } catch(e){
      print(e.toString());
    }
    return res;
  }
}

