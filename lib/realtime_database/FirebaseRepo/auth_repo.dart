import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final firebaseAuth = FirebaseAuth.instance;

class AuthLogin {
  static Future klogin({@required email, @required password}) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    // .signInWithEmailAndPassword(email: email, password: password)
    // .then((value) => print("======================================$value"))
    // .catchError((e) => print(e));
  }
}
