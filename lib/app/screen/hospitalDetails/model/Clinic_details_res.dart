// To parse this JSON data, do
//
//     final clinicDetails = clinicDetailsFromJson(jsonString);

import 'dart:convert';

ClinicDetails clinicDetailsFromJson(String str) =>
    ClinicDetails.fromJson(json.decode(str));

String clinicDetailsToJson(ClinicDetails data) => json.encode(data.toJson());

class ClinicDetails {
  int? status;
  bool? message;
  List<Result>? result;

  ClinicDetails({
    this.status,
    this.message,
    this.result,
  });

  factory ClinicDetails.fromJson(Map<String, dynamic> json) => ClinicDetails(
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
  List<String>? clinicTimeSlot;
  dynamic clinicLocation;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? clinicName;
  String? clinicImage;
  int? userId;
  bool? status;
  String? state;
  String? city;
  String? about;
  int? pincode;
  String? mobileNumber;
  String? address;
  dynamic clinicImage2;
  dynamic clinicImage3;

  Result({
    this.id,
    this.clinicTimeSlot,
    this.clinicLocation,
    this.createdAt,
    this.updatedAt,
    this.clinicName,
    this.clinicImage,
    this.userId,
    this.status,
    this.state,
    this.city,
    this.about,
    this.pincode,
    this.mobileNumber,
    this.address,
    this.clinicImage2,
    this.clinicImage3,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        clinicTimeSlot: json["clinic_time_slot"] == null
            ? []
            : List<String>.from(json["clinic_time_slot"]!.map((x) => x)),
        clinicLocation: json["clinic_location"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        clinicName: json["clinic_name"],
        clinicImage: json["clinic_image"],
        userId: json["user_id"],
        status: json["status"],
        state: json["state"],
        city: json["city"],
        about: json["about"],
        pincode: json["pincode"],
        mobileNumber: json["mobile_number"],
        address: json["address"],
        clinicImage2: json["clinic_image2"],
        clinicImage3: json["clinic_image3"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "clinic_time_slot": clinicTimeSlot == null
            ? []
            : List<dynamic>.from(clinicTimeSlot!.map((x) => x)),
        "clinic_location": clinicLocation,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "clinic_name": clinicName,
        "clinic_image": clinicImage,
        "user_id": userId,
        "status": status,
        "state": state,
        "city": city,
        "about": about,
        "pincode": pincode,
        "mobile_number": mobileNumber,
        "address": address,
        "clinic_image2": clinicImage2,
        "clinic_image3": clinicImage3,
      };
}
