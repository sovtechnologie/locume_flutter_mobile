// To parse this JSON data, do
//
//     final specialties = specialtiesFromJson(jsonString);

import 'dart:convert';

Specialties specialtiesFromJson(String str) =>
    Specialties.fromJson(json.decode(str));

String specialtiesToJson(Specialties data) => json.encode(data.toJson());

class Specialties {
  int? status;
  String? message;
  List<Result>? result;

  Specialties({
    this.status,
    this.message,
    this.result,
  });

  factory Specialties.fromJson(Map<String, dynamic> json) => Specialties(
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
  String? specialtiesName;
  String? specialtiesImages;
  String? specialtiesDescription;

  Result({
    this.id,
    this.specialtiesName,
    this.specialtiesImages,
    this.specialtiesDescription,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        specialtiesName: json["specialties_name"],
        specialtiesImages: json["specialties_images"],
        specialtiesDescription: json["specialties_description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "specialties_name": specialtiesName,
        "specialties_images": specialtiesImages,
        "specialties_description": specialtiesDescription,
      };
}
