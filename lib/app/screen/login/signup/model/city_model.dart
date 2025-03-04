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
        name: json["name"] ?? "Unknown", // ✅ Default to "Unknown" if null
        countryCode: json["countryCode"] != null
            ? countryCodeValues.map[json["countryCode"]]
            : null, // ✅ Null-safe handling
        stateCode: json["stateCode"] != null
            ? stateCodeValues.map[json["stateCode"]]
            : null, // ✅ Null-safe handling
        latitude: json["latitude"]?.toString() ?? "0.0", // ✅ Convert to string
        longitude: json["longitude"]?.toString() ?? "0.0",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "countryCode": countryCode != null
            ? countryCodeValues.reverse[countryCode]
            : null, // ✅ Prevent null errors
        "stateCode":
            stateCode != null ? stateCodeValues.reverse[stateCode] : null,
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
