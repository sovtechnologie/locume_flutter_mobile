import 'dart:convert';

class Specialmodel {
  int status;
  String message;
  List<Result> result;

  Specialmodel({
    required this.status,
    required this.message,
    required this.result,
  });

  factory Specialmodel.fromRawJson(String str) =>
      Specialmodel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Specialmodel.fromJson(Map<String, dynamic> json) => Specialmodel(
        status: json["status"],
        message: json["message"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  int id;
  String specialtiesName;
  String specialtiesImages;

  Result({
    required this.id,
    required this.specialtiesName,
    required this.specialtiesImages,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        specialtiesName: json["specialties_name"],
        specialtiesImages: json["specialties_images"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "specialties_name": specialtiesName,
        "specialties_images": specialtiesImages,
      };
}
