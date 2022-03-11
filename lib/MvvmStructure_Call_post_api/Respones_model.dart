// To parse this JSON data, do
//
//     final responseLogin = responseLoginFromJson(jsonString);

import 'dart:convert';

ResponseLogin responseLoginFromJson(String str) => ResponseLogin.fromJson(json.decode(str));

String responseLoginToJson(ResponseLogin data) => json.encode(data.toJson());

class ResponseLogin {
  ResponseLogin({
    this.status,
    this.message,
    this.id,
    this.username,
  });

  bool status;
  String message;
  String id;
  String username;

  factory ResponseLogin.fromJson(Map<String, dynamic> json) => ResponseLogin(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    id: json["id"] == null ? null : json["id"],
    username: json["username"] == null ? null : json["username"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "id": id == null ? null : id,
    "username": username == null ? null : username,
  };
}
