import 'dart:convert';

import 'Respones_model.dart';
import 'model.dart';
import 'package:http/http.dart' as http;

class ApiLoginMvvM {
  Future loginMvvMCall({LoginMvvMPost body}) async {
    http.Response response = await http.post(
        Uri.parse("https://codelineinfotech.com/student_api/User/login.php"),
        body: body.toJson());
    var LoginResponse = jsonDecode(response.body);

    if (LoginResponse['status'] == true) {
      print(
          "===================================response bool=${LoginResponse['status']}");
      return responseLoginFromJson(response.body);
    } else {
      print("================================failed");
    }
  }
}
