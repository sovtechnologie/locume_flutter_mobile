// To parse this JSON data, do
//
//     final clinicData = clinicDataFromJson(jsonString);

import 'dart:convert';

ClinicData clinicDataFromJson(String str) =>
    ClinicData.fromJson(json.decode(str));

String clinicDataToJson(ClinicData data) => json.encode(data.toJson());

class ClinicData {
  int? status;
  String? message;
  List<Result>? result;

  ClinicData({
    this.status,
    this.message,
    this.result,
  });

  factory ClinicData.fromJson(Map<String, dynamic> json) => ClinicData(
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
  dynamic clinicLocation;
  String? clinicName;
  String? clinicImage;
  String? state;
  String? city;
  String? mobileNumber;
  String? address;
  String? doctorCount;

  Result({
    this.id,
    this.clinicLocation,
    this.clinicName,
    this.clinicImage,
    this.state,
    this.city,
    this.mobileNumber,
    this.address,
    this.doctorCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        clinicLocation: json["clinic_location"],
        clinicName: json["clinic_name"],
        clinicImage: json["clinic_image"],
        state: json["state"],
        city: json["city"],
        mobileNumber: json["mobile_number"],
        address: json["address"],
        doctorCount: json["doctor_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "clinic_location": clinicLocation,
        "clinic_name": clinicName,
        "clinic_image": clinicImage,
        "state": state,
        "city": city,
        "mobile_number": mobileNumber,
        "address": address,
        "doctor_count": doctorCount,
      };
}
