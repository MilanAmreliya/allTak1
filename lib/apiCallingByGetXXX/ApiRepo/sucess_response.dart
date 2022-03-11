// To parse this JSON data, do
//
//     final sucessResponse = sucessResponseFromJson(jsonString);

import 'dart:convert';

SucessResponse sucessResponseFromJson(String str) =>
    SucessResponse.fromJson(json.decode(str));

String sucessResponseToJson(SucessResponse data) => json.encode(data.toJson());

class SucessResponse {
  SucessResponse({
    this.status,
    this.message,
    this.id,
    this.username,
  });

  bool status;
  String message;
  String id;
  String username;

  factory SucessResponse.fromJson(Map<String, dynamic> json) => SucessResponse(
        status: json["status"],
        message: json["message"],
        id: json["id"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "id": id,
        "username": username,
      };
}
