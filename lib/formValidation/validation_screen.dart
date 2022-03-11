import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class ValidationScreen extends StatefulWidget {
  static InputBorder outLineGrey = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: Colors.green, width: 1.0),
  );
  static InputBorder outLineRed = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: Colors.red, width: 1.0),
  );

  @override
  _ValidationScreenState createState() => _ValidationScreenState();
}

class _ValidationScreenState extends State<ValidationScreen> {
  TextEditingController controller = TextEditingController();
  TextEditingController _userPasswordController = TextEditingController();

  TextEditingController _controller = TextEditingController();

  GlobalKey<FormState> globalObjectKey = GlobalKey<FormState>();

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Form(
        autovalidate: true,

        //autovalidateMode:AutovalidateMode.always,
        key: globalObjectKey,
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              height: 40,
              width: Get.width,
              child: TextFormField(
                controller: controller,
                validator: EmailValidator(errorText: "not validation "),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                  labelText: "Email",
                  contentPadding: EdgeInsets.only(
                      top: Get.height * 0.013,
                      bottom: Get.height * 0.013,
                      left: Get.height * 0.019,
                      right: Get.height * 0.019),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: _userPasswordController,
              obscureText:
                  !_passwordVisible, //This will obscure text dynamically
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                // Here is key idea
                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
            Container(
              height: 80,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                // initialValue: 'sathyabaman@gmail.com',
                style: new TextStyle(
                    fontWeight: FontWeight.normal, color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Email',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
                validator: EmailValidator(errorText: 'enter the valid email'),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            TextFormField(
              controller: _controller,
              validator: MultiValidator([
                RequiredValidator(errorText: "reqired"),
                //EmailValidator(errorText: "email is not"),
                MaxLengthValidator(6, errorText: "only 6  digit"),
              ]),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
                labelText: "password",
              ),
            ),
            SizedBox(
              height: 100,
            ),
            MaterialButton(
              color: Colors.deepOrange,
              child: Text("Login"),
              onPressed: () {
                if (globalObjectKey.currentState.validate()) {
                  print("==============================sucesss");
                }
              },
            )
          ],
        ),
      )),
    );
  }
}
