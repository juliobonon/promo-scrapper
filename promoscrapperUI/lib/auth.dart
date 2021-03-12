import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<User> createUserWithEmailandPassword(String email, String password);
  Future<String> currentUser();
  Future<void> signOut();
}

class Auth implements BaseAuth {
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return user.user;
  }

  Future<User> createUserWithEmailandPassword(
      String email, String password) async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return user.user;
  }

  Future<String> currentUser() async {
    User user = await FirebaseAuth.instance.currentUser;
    return user.uid;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
