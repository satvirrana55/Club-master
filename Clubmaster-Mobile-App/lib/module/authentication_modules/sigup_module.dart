// To parse this JSON data, do
//
//     final signUpModule = signUpModuleFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SignUpModule signUpModuleFromJson(String str) =>
    SignUpModule.fromJson(json.decode(str));

String signUpModuleToJson(SignUpModule data) => json.encode(data.toJson());

class SignUpModule {
  SignUpModule({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory SignUpModule.fromJson(Map<String, dynamic> json) => SignUpModule(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
