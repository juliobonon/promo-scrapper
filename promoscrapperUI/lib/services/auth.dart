import 'package:firebase_auth/firebase_auth.dart';
import 'package:promoscrapperUI/services/database.dart';

abstract class BaseAuth {
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailandPassword(String email, String password);
  Stream<User> get authStateChanges;
  Future<void> signOut();
}

class Auth implements BaseAuth {
  Stream<User> get authStateChanges => FirebaseAuth.instance.authStateChanges();

  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return 'Logado';
    } catch (e) {
      return e.message;
    }
  }

  Future<String> createUserWithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return 'Logado';
    } catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
