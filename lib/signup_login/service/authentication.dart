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
      if (email.isNotEmpty && password.isNotEmpty && name.isNotEmpty) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, 
            password: password
        );
        res = "Signup Successful";
      }
      // for adding user to cloud firestore
      // await _firestore.collection("users").doc(credential.user!.uid).set({
      //   'name': name,
      //   'email': email,
      //   'uid': credential.user!.uid,
      // });
    } catch(e){
      print(e.toString());
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = " Some error occurred";
    try{
      if (email.isNotEmpty || password.isNotEmpty){
        await _auth.signInWithEmailAndPassword(
            email: email,
            password: password
        );
        res = "Login successful!";
      }
    } catch (e){
      print(e.toString());
    }
    return res;
  }

  Future<void> signOut() async{
    await _auth.signOut();
  }
}

