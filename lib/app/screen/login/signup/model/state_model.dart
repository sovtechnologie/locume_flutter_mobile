// To parse this JSON data, do
//
//     final stateList = stateListFromJson(jsonString);

import 'dart:convert';

StateList stateListFromJson(String str) => StateList.fromJson(json.decode(str));

String stateListToJson(StateList data) => json.encode(data.toJson());

class StateList {
  int? status;
  List<Result>? result;

  StateList({
    this.status,
    this.result,
  });

  factory StateList.fromJson(Map<String, dynamic> json) => StateList(
        status: json["status"],
        result: json["result"] == null
            ? []
            : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class Result {
  String? name;
  String? isoCode;
  CountryCode? countryCode;
  String? latitude;
  String? longitude;

  Result({
    this.name,
    this.isoCode,
    this.countryCode,
    this.latitude,
    this.longitude,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        isoCode: json["isoCode"],
        countryCode: countryCodeValues.map[json["countryCode"]]!,
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "isoCode": isoCode,
        "countryCode": countryCodeValues.reverse[countryCode],
        "latitude": latitude,
        "longitude": longitude,
      };
}

enum CountryCode { IN }

final countryCodeValues = EnumValues({"IN": CountryCode.IN});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
