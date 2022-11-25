//     final verifyOtpModule = verifyOtpModuleFromJson(jsonString);
import 'package:meta/meta.dart';
import 'dart:convert';

VerifyOtpModule verifyOtpModuleFromJson(String str) =>
    VerifyOtpModule.fromJson(json.decode(str));

String verifyOtpModuleToJson(VerifyOtpModule data) =>
    json.encode(data.toJson());

class VerifyOtpModule {
  VerifyOtpModule({
    this.status,
    this.token,
    this.expiration,
    this.message,
  });

  bool? status;
  String? token;
  DateTime? expiration;
  String? message;

  factory VerifyOtpModule.fromJson(Map<String, dynamic> json) =>
      VerifyOtpModule(
        status: json["status"],
        token: json["token"],
        expiration: DateTime.parse(json["expiration"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "expiration": expiration!.toIso8601String(),
        "message": message,
      };
}
