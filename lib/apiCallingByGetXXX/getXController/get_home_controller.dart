import 'dart:io';

import 'package:get/get.dart';
import 'package:khanakhjana/apiCallingByGetXXX/ApiRepo/apiHandler.dart';
import 'package:khanakhjana/apiCallingByGetXXX/ApiRepo/apiModel.dart';
import 'package:khanakhjana/apiCallingByGetXXX/ApiRepo/saveResponse.dart';

class ApiClassHandler extends GetxController {
  File image;
  setimage(File value) {
    image = value;
    update();
  }

  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initial request');

  ApiResponse get apiResponse => _apiResponse;

  apiResponss({PostModelCall model}) async {
    dynamic response = await API().postApiCall(body: model);
    _apiResponse = ApiResponse.complete(response);
    update();
  }
}
