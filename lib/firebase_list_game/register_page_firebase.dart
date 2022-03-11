import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';

class FirebaseRegister extends StatefulWidget {
  @override
  _FirebaseRegisterState createState() => _FirebaseRegisterState();
}

class _FirebaseRegisterState extends State<FirebaseRegister> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        autovalidate: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.text,

              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
              ], // Only num
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              validator: EmailValidator(errorText: 'pleas Enter Valid Name'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: MultiValidator([
                EmailValidator(errorText: 'pleas Enter Valid Email'),
                RequiredValidator(errorText: '1 char,1 alafa,'),
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              validator: MultiValidator([
                EmailValidator(errorText: 'zaasas'),
                MinLengthValidator(8,
                    errorText: 'password must be at least 8 digits long'),
                RequiredValidator(errorText: '1 char,1 alafa,'),
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: Colors.deepOrange,
              child: Text('Register'),
              onPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}
