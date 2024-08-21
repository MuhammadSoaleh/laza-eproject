import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  //instance of authentication
  final FirebaseAuth auth = FirebaseAuth.instance;
  //sign in
  Future<UserCredential> signinwithEmailAndPassword(
      String email, password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign up
  Future<UserCredential> signupwithemailpassword(String email, password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //logout
  Future<void> signOut() async {
    return await auth.signOut();
  }

  void signupWithEmailPassword(String text, String text2) {}
  //errors
}
