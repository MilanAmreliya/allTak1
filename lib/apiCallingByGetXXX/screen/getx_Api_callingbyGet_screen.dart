import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khanakhjana/MvvmStructure_Call_post_api/sharedpreference_login_id.dart';
import 'package:khanakhjana/apiCallingByGetXXX/ApiRepo/apiHandler.dart';
import 'package:khanakhjana/apiCallingByGetXXX/ApiRepo/apiModel.dart';
import 'package:khanakhjana/apiCallingByGetXXX/ApiRepo/sucess_response.dart';
import 'package:khanakhjana/apiCallingByGetXXX/getXController/get_home_controller.dart';

class GetxCallApiScreen extends StatelessWidget {
  TextEditingController _userController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _firstController = TextEditingController();
  TextEditingController _lastController = TextEditingController();
  ApiClassHandler _apiClassHandlerController = Get.put(ApiClassHandler());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'firstname'),
              controller: _firstController,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'lastname'),
              controller: _lastController,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'username'),
              controller: _userController,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'password'),
              controller: _passController,
            ),
            MaterialButton(
              color: Colors.deepOrange,
              onPressed: () async {
                PostModelCall _user = PostModelCall();
                _user.firstName = _firstController.text;
                _user.password = _passController.text;
                _user.lastName = _lastController.text;
                _user.username = _userController.text;

                SucessResponse sucesssssssss =
                    _apiClassHandlerController.apiResponse.data;
                //API().postApiCall(body: _user);
                await _apiClassHandlerController.apiResponss(model: _user);
                await PreferenceManager.saveId(id: sucesssssssss.id);
                var milan = await PreferenceManager.idRead();
                print(
                    "====================================================saveSherdid==${milan}");

                print(
                    "================================================status=${sucesssssssss.status}");
                print(
                    "================================================id=${sucesssssssss.id}");
              },
            ),
          ],
        ),
      ),
    );
  }
}
