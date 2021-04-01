import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:promoscrapperUI/login.dart';
import 'package:promoscrapperUI/pages/pageWrapper.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return PageWrapper();
    } else {
      return Login();
    }
  }
}
