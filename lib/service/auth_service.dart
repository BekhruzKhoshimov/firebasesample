
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  static final _auth = FirebaseAuth.instance;

  static Future<User?> signInUser(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = _auth.currentUser;
      return user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email' : {
          print("Email xato");
          break;
        }
        case 'user-not-found' : {
          print("User mavjud emas");
        }
      }
    }
    return null;
  }

  static Future<User?> signUpUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = _auth.currentUser;
      return user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email' : {
          print("Email xato");
          break;
        }
        case 'uid-already-exists' : {
          print("User oldindan mavjud");
        }
      }
    }
    return null;
  }

  static Future<void> signOutUser() async {
    await _auth.signOut();
  }

  static bool isLoggedIn() {
    final User? firebaseUser = _auth.currentUser;
    return firebaseUser != null;
  }

  static String currentUserId() {
    final User? firebaseUser = _auth.currentUser;
    return firebaseUser!.uid;
  }

}