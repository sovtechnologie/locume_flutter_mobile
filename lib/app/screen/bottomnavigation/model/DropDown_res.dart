// To parse this JSON data, do
//
//     final dropDownRes = dropDownResFromJson(jsonString);

import 'dart:convert';

DropDownRes dropDownResFromJson(String str) =>
    DropDownRes.fromJson(json.decode(str));

String dropDownResToJson(DropDownRes data) => json.encode(data.toJson());

class DropDownRes {
  int? status;
  bool? message;
  List<Result>? result;

  DropDownRes({
    this.status,
    this.message,
    this.result,
  });

  factory DropDownRes.fromJson(Map<String, dynamic> json) => DropDownRes(
        status: json["status"],
        message: json["message"],
        result: json["result"] == null
            ? []
            : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class Result {
  int? id;
  String? name;
  int? type;

  Result({
    this.id,
    this.name,
    this.type,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
      };
}
