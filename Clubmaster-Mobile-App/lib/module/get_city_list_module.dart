// To parse this JSON data, do
//
//     final cityListModule = cityListModuleFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<CityListModule> cityListModuleFromJson(String str) =>
    List<CityListModule>.from(
        json.decode(str).map((x) => CityListModule.fromJson(x)));

String cityListModuleToJson(List<CityListModule> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CityListModule {
  CityListModule({
    this.id,
    this.name,
    this.state,
    this.stateId,
  });

  int? id;
  String? name;
  dynamic? state;
  int? stateId;

  factory CityListModule.fromJson(Map<String, dynamic> json) => CityListModule(
        id: json["id"],
        name: json["name"],
        state: json["state"],
        stateId: json["stateId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "state": state,
        "stateId": stateId,
      };
}
