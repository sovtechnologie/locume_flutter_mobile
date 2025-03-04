// To parse this JSON data, do
//
//     final hospitalRes = hospitalResFromJson(jsonString);

import 'dart:convert';

HospitalRes hospitalResFromJson(String str) =>
    HospitalRes.fromJson(json.decode(str));

String hospitalResToJson(HospitalRes data) => json.encode(data.toJson());

class HospitalRes {
  int? status;
  String? message;
  List<Result>? result;

  HospitalRes({
    this.status,
    this.message,
    this.result,
  });

  factory HospitalRes.fromJson(Map<String, dynamic> json) => HospitalRes(
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
  String? hospitalLocation;
  String? hospitalName;
  String? hospitalImage;
  String? state;
  String? city;
  String? mobileNumber;
  String? address;
  String? doctorCount;

  Result({
    this.id,
    this.hospitalLocation,
    this.hospitalName,
    this.hospitalImage,
    this.state,
    this.city,
    this.mobileNumber,
    this.address,
    this.doctorCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        hospitalLocation: json["hospital_location"],
        hospitalName: json["hospital_name"],
        hospitalImage: json["hospital_image"],
        state: json["state"],
        city: json["city"],
        mobileNumber: json["mobile_number"],
        address: json["address"],
        doctorCount: json["doctor_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hospital_location": hospitalLocation,
        "hospital_name": hospitalName,
        "hospital_image": hospitalImage,
        "state": state,
        "city": city,
        "mobile_number": mobileNumber,
        "address": address,
        "doctor_count": doctorCount,
      };
}
