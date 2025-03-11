// To parse this JSON data, do
//
//     final hospitalDetailsRes = hospitalDetailsResFromJson(jsonString);

import 'dart:convert';

HospitalDetailsRes hospitalDetailsResFromJson(String str) =>
    HospitalDetailsRes.fromJson(json.decode(str));

String hospitalDetailsResToJson(HospitalDetailsRes data) =>
    json.encode(data.toJson());

class HospitalDetailsRes {
  int? status;
  bool? message;
  List<Result>? result;

  HospitalDetailsRes({
    this.status,
    this.message,
    this.result,
  });

  factory HospitalDetailsRes.fromJson(Map<String, dynamic> json) =>
      HospitalDetailsRes(
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
  List<String>? visitHospitalSlot;
  dynamic hospitalLocation;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? hospitalName;
  String? hospitalImage;
  int? userId;
  bool? status;
  String? state;
  String? city;
  String? about;
  bool? isDelete;
  int? pincode;
  String? mobileNumber;
  String? address;
  dynamic hospitalImage2;
  dynamic hospitalImage3;

  Result({
    this.id,
    this.visitHospitalSlot,
    this.hospitalLocation,
    this.createdAt,
    this.updatedAt,
    this.hospitalName,
    this.hospitalImage,
    this.userId,
    this.status,
    this.state,
    this.city,
    this.about,
    this.isDelete,
    this.pincode,
    this.mobileNumber,
    this.address,
    this.hospitalImage2,
    this.hospitalImage3,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        visitHospitalSlot: json["visit_hospital_slot"] == null
            ? []
            : List<String>.from(json["visit_hospital_slot"]!.map((x) => x)),
        hospitalLocation: json["hospital_location"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        hospitalName: json["hospital_name"],
        hospitalImage: json["hospital_image"],
        userId: json["user_id"],
        status: json["status"],
        state: json["state"],
        city: json["city"],
        about: json["about"],
        isDelete: json["is_delete"],
        pincode: json["pincode"],
        mobileNumber: json["mobile_number"],
        address: json["address"],
        hospitalImage2: json["hospital_image2"],
        hospitalImage3: json["hospital_image3"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "visit_hospital_slot": visitHospitalSlot == null
            ? []
            : List<dynamic>.from(visitHospitalSlot!.map((x) => x)),
        "hospital_location": hospitalLocation,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "hospital_name": hospitalName,
        "hospital_image": hospitalImage,
        "user_id": userId,
        "status": status,
        "state": state,
        "city": city,
        "about": about,
        "is_delete": isDelete,
        "pincode": pincode,
        "mobile_number": mobileNumber,
        "address": address,
        "hospital_image2": hospitalImage2,
        "hospital_image3": hospitalImage3,
      };
}
