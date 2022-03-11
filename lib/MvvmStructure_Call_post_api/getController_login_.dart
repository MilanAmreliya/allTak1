import 'dart:convert';

import 'package:get/get.dart';
import 'package:khanakhjana/MvvmStructure_Call_post_api/Api_Service_Repo.dart';
import 'package:khanakhjana/apiCallingByGetXXX/ApiRepo/saveResponse.dart';

import 'model.dart';

class LoginControllerClass extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initial request');

  ApiResponse get apiResponse => _apiResponse;

  loginGetControllerFunction({LoginMvvMPost model}) async {
    _apiResponse = ApiResponse.loading();
    update();
    try {
      dynamic response = await ApiLoginMvvM().loginMvvMCall(body: model);

      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print("LoginControllerClass=============");
      _apiResponse = ApiResponse.error();
      print(e);
    }
    update();
  }
}
