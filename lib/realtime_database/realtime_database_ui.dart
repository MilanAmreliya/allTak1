import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RealDataAdd extends StatefulWidget {
  @override
  _RealDataAddState createState() => _RealDataAddState();
}

class _RealDataAddState extends State<RealDataAdd> {
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();

  final fb = FirebaseDatabase.instance;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final ref = fb.reference().child("milanData");

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: fName,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: lName,
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                color: Colors.deepOrange,
                onPressed: () async {
                  AuthLogin.klogin(
                          email: fName.text.trim(), password: lName.text.trim())
                      .then((value) {
                    print('-----${FirebaseAuth.instance.currentUser}');
                  });
                  // await _auth
                  //     .createUserWithEmailAndPassword(
                  //         email: lName.text, password: fName.text)
                  //     .then((value) {
                  //   print('-----${FirebaseAuth.instance.currentUser}');
                  // });
                  // if (FirebaseAuth.instance.currentUser != null) {
                  //   final User user = _auth.currentUser;
                  //   final uid = user;
                  //   print('-------uid------$uid');
                  //   print('------------${fName.text}');
                  //   ref
                  //       .child('${FirebaseAuth.instance.currentUser}')
                  //       .set({'FirstName': fName.text, "LastName": lName.text});
                  // }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AuthLogin {
  static Future klogin({@required email, @required password}) async {
    var userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    // .signInWithEmailAndPassword(email: email, password: password)
    // .then((value) => print("======================================$value"))
    // .catchError((e) => print(e));
  }
}
