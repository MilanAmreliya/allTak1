import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class TextFiledScreen extends StatelessWidget {
  static InputBorder outLineGrey = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
  );
  static InputBorder outLineRed = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: Colors.red, width: 1.0),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextFormField(
          // controller: _controller,
          // validator: MultiValidator([
          //   RequiredValidator(errorText: "reqired"),
          //   //EmailValidator(errorText: "email is not"),
          //   MaxLengthValidator(6, errorText: "only 6  digit"),
          // ]),
          maxLength: 5,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "password",
            focusColor: Colors.deepOrange,
            fillColor: Colors.blue,
            focusedBorder: outLineGrey,
            enabledBorder: outLineGrey,
            disabledBorder: outLineGrey,
          ),
        ),
      ),
    );
  }
}
