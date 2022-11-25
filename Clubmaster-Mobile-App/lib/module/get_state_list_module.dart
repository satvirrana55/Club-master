// To parse this JSON data, do
//
//     final stateListModule = stateListModuleFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<StateListModule> stateListModuleFromJson(String str) =>
    List<StateListModule>.from(
        json.decode(str).map((x) => StateListModule.fromJson(x)));

String stateListModuleToJson(List<StateListModule> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StateListModule {
  StateListModule({
    this.id,
    this.name,
    this.city,
  });

  int? id;
  String? name;
  dynamic city;

  factory StateListModule.fromJson(Map<String, dynamic> json) =>
      StateListModule(
        id: json["id"],
        name: json["name"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
      };
}
