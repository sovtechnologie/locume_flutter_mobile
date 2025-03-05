// To parse this JSON data, do
//
//     final locumRes = locumResFromJson(jsonString);

import 'dart:convert';

LocumRes locumResFromJson(String str) => LocumRes.fromJson(json.decode(str));

String locumResToJson(LocumRes data) => json.encode(data.toJson());

class LocumRes {
  int? status;
  bool? message;
  List<Result>? result;

  LocumRes({
    this.status,
    this.message,
    this.result,
  });

  factory LocumRes.fromJson(Map<String, dynamic> json) => LocumRes(
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
  String? firstName;
  String? mobileNumber;
  String? lastName;
  String? gender;
  List<String>? availability;
  String? medicalId;
  String? location;
  String? customId;
  String? profileImage;
  String? specialization;
  int? hourlyRate;
  int? totalExp;
  List<int>? preferredSpecialities;
  String? emailId;
  String? aboutMe;
  List<int>? category;
  DateTime? createdAt;
  DateTime? updatedAt;

  Result({
    this.id,
    this.firstName,
    this.mobileNumber,
    this.lastName,
    this.gender,
    this.availability,
    this.medicalId,
    this.location,
    this.customId,
    this.profileImage,
    this.specialization,
    this.hourlyRate,
    this.totalExp,
    this.preferredSpecialities,
    this.emailId,
    this.aboutMe,
    this.category,
    this.createdAt,
    this.updatedAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        firstName: json["first_name"],
        mobileNumber: json["mobile_number"],
        lastName: json["last_name"],
        gender: json["gender"],
        availability: json["availability"] == null
            ? []
            : List<String>.from(json["availability"]!.map((x) => x)),
        medicalId: json["medical_id"],
        location: json["location"],
        customId: json["custom_id"],
        profileImage: json["profile_image"],
        specialization: json["specialization"],
        hourlyRate: json["hourly_rate"],
        totalExp: json["total_exp"],
        preferredSpecialities: json["preferred_specialities"] == null
            ? []
            : List<int>.from(json["preferred_specialities"]!.map((x) => x)),
        emailId: json["email_id"],
        aboutMe: json["about_me"],
        category: json["category"] == null
            ? []
            : List<int>.from(json["category"]!.map((x) => x)),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "mobile_number": mobileNumber,
        "last_name": lastName,
        "gender": gender,
        "availability": availability == null
            ? []
            : List<dynamic>.from(availability!.map((x) => x)),
        "medical_id": medicalId,
        "location": location,
        "custom_id": customId,
        "profile_image": profileImage,
        "specialization": specialization,
        "hourly_rate": hourlyRate,
        "total_exp": totalExp,
        "preferred_specialities": preferredSpecialities == null
            ? []
            : List<dynamic>.from(preferredSpecialities!.map((x) => x)),
        "email_id": emailId,
        "about_me": aboutMe,
        "category":
            category == null ? [] : List<dynamic>.from(category!.map((x) => x)),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
