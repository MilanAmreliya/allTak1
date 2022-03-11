import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:khanakhjana/apiCallingByGetXXX/ApiRepo/sucess_response.dart';

import 'apiModel.dart';

class API {
  Future postApiCall({PostModelCall body}) async {
    var response = await http.post(
        Uri.parse("https://codelineinfotech.com/student_api/User/signup.php"),
        body: body.toJson());
    var milldc = jsonDecode(response.body);
    if (response.statusCode == 200) {
      SucessResponse sucessResponseeeee = sucessResponseFromJson(response.body);
      print(
          "======================================================mainRespomse${milldc}");
      return sucessResponseeeee;
    } else {
      return null;
    }
  }
}
