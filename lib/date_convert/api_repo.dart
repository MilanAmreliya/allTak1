import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:khanakhjana/date_convert/date_formet_repo.dart';

class ApiDate {
  Future<List<DateFoemetResponse>> dateFo() async {
    var response = await http.get(Uri.parse(
        'https://8a44d4f7-fc7f-4fcd-a367-113e5748cb45.mock.pstmn.io/api/orders'));
    List<DateFoemetResponse> dateFormmm =
        dateFoemetResponseFromJson(response.body);
    print('------------------response-------$response');
    return dateFormmm;
  }
}
