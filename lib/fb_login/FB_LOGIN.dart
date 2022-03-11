import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;

class FbLogin extends StatefulWidget {
  @override
  _FbLoginState createState() => _FbLoginState();
}

class _FbLoginState extends State<FbLogin> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  static final FacebookLogin facebookSignIn = new FacebookLogin();
  String name = '', image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
        actions: [
          FlatButton(
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              final FacebookLoginResult result =
                  await facebookSignIn.logIn(['email']);

              switch (result.status) {
                case FacebookLoginStatus.loggedIn:
                  final FacebookAccessToken accessToken = result.accessToken;
                  final graphResponse = await http.get(Uri.parse(
                      'https://graph.facebook.com/v2.12/me?fields=first_name,picture&access_token=${accessToken.token}'));
                  AuthCredential _credential =
                      FacebookAuthProvider.credential(accessToken.token);
                  await _auth.signInWithCredential(_credential);

                  final profile = jsonDecode(graphResponse.body);
                  print(profile);
                  setState(() {
                    name = profile['first_name'];
                    image = profile['picture']['data']['url'];
                  });
                  // _auth.signInWithCredential(accessToken);
                  print('''
         Logged in! 
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
                  break;
                case FacebookLoginStatus.cancelledByUser:
                  print('Login cancelled by the user.');
                  break;
                case FacebookLoginStatus.error:
                  print('Something went wrong with the login process.\n'
                      'Here\'s the error Facebook gave us: ${result.errorMessage}');
                  break;
              }
            },
          )
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name),
          image != null
              ? Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(image)),
                      shape: BoxShape.circle),
                )
              : Container()
        ],
      )),
    );
  }
}
