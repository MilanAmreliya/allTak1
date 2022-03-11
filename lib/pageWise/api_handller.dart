import 'package:http/http.dart' as http;

import 'data_model.dart';

class API {
  static Future<NewsGetModel> apiGet() async {
    http.Response response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&from=2021-05-29&sortBy=publishedAt&apiKey=59e9263b747248a7b51f483e317afc7f"));

    return newsGetModelFromJson(response.body);
  }
}
