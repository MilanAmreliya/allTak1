import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khanakhjana/MvvmStructure_Call_post_api/sharedpreference_login_id.dart';

import 'Respones_model.dart';
import 'getController_login_.dart';
import 'model.dart';

class LoginRepo extends StatelessWidget {
  TextEditingController _usernamecontroller = TextEditingController();
  TextEditingController _passcontroller = TextEditingController();
  LoginControllerClass _loginControllerClass = Get.put(LoginControllerClass());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              controller: _usernamecontroller,
              decoration: InputDecoration(hintText: "username"),
            ),
            TextFormField(
              controller: _passcontroller,
              decoration: InputDecoration(hintText: "username"),
            ),
            MaterialButton(
              color: Colors.deepOrange,
              onPressed: () async {
                LoginMvvMPost _loginModel = LoginMvvMPost();
                ResponseLogin sucesss = _loginControllerClass.apiResponse.data;
                _loginModel.username = _usernamecontroller.text;
                _loginModel.password = _passcontroller.text;
                await _loginControllerClass.loginGetControllerFunction(
                    model: _loginModel);
                await PreferenceManager.saveLoginId(id: sucesss.id);
                var milnaaaaaaa = PreferenceManager.idloginRead();
                print("===========================saveShredId==${milnaaaaaaa}");
                if (milnaaaaaaa == !null) {
                  print("navigator============================");
                } else {
                  print("failed============================");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
