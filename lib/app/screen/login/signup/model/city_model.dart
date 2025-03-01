// To parse this JSON data, do
//
//     final cityList = cityListFromJson(jsonString);

import 'dart:convert';

CityList cityListFromJson(String str) => CityList.fromJson(json.decode(str));

String cityListToJson(CityList data) => json.encode(data.toJson());

class CityList {
  int? status;
  List<Result>? result;

  CityList({
    this.status,
    this.result,
  });

  factory CityList.fromJson(Map<String, dynamic> json) => CityList(
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
  CountryCode? countryCode;
  StateCode? stateCode;
  String? latitude;
  String? longitude;

  Result({
    this.name,
    this.countryCode,
    this.stateCode,
    this.latitude,
    this.longitude,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        countryCode: countryCodeValues.map[json["countryCode"]]!,
        stateCode: stateCodeValues.map[json["stateCode"]]!,
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "countryCode": countryCodeValues.reverse[countryCode],
        "stateCode": stateCodeValues.reverse[stateCode],
        "latitude": latitude,
        "longitude": longitude,
      };
}

enum CountryCode { IN }

final countryCodeValues = EnumValues({"IN": CountryCode.IN});

enum StateCode { HR }

final stateCodeValues = EnumValues({"HR": StateCode.HR});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
