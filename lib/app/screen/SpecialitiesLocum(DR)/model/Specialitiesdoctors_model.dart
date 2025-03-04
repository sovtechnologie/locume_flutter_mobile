// To parse this JSON data, do
//
//     final specialtiesDoctors = specialtiesDoctorsFromJson(jsonString);

import 'dart:convert';

SpecialtiesDoctors specialtiesDoctorsFromJson(String str) =>
    SpecialtiesDoctors.fromJson(json.decode(str));

String specialtiesDoctorsToJson(SpecialtiesDoctors data) =>
    json.encode(data.toJson());

class SpecialtiesDoctors {
  int? status;
  String? message;
  List<Result>? result;

  SpecialtiesDoctors({
    this.status,
    this.message,
    this.result,
  });

  factory SpecialtiesDoctors.fromJson(Map<String, dynamic> json) =>
      SpecialtiesDoctors(
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
  dynamic lastName;
  String? gender;
  List<String>? availability;
  String? medicalId;
  String? location;
  dynamic specialization;
  int? hourlyRate;
  int? otpVerificationId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? totalExp;
  dynamic idealNumber;
  dynamic preferredSpecialities;
  String? profileImage;
  dynamic hospitalId;
  dynamic clinicId;
  String? emailId;
  String? aboutMe;
  String? customId;
  List<int>? category;
  String? deviceToken;
  String? state;
  dynamic certificate;

  Result({
    this.id,
    this.firstName,
    this.lastName,
    this.gender,
    this.availability,
    this.medicalId,
    this.location,
    this.specialization,
    this.hourlyRate,
    this.otpVerificationId,
    this.createdAt,
    this.updatedAt,
    this.totalExp,
    this.idealNumber,
    this.preferredSpecialities,
    this.profileImage,
    this.hospitalId,
    this.clinicId,
    this.emailId,
    this.aboutMe,
    this.customId,
    this.category,
    this.deviceToken,
    this.state,
    this.certificate,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        availability: json["availability"] == null
            ? []
            : List<String>.from(json["availability"]!.map((x) => x)),
        medicalId: json["medical_id"],
        location: json["location"],
        specialization: json["specialization"],
        hourlyRate: json["hourly_rate"],
        otpVerificationId: json["otp_verification_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        totalExp: json["total_exp"],
        idealNumber: json["ideal_number"],
        preferredSpecialities: json["preferred_specialities"],
        profileImage: json["profile_image"],
        hospitalId: json["hospital_id"],
        clinicId: json["clinic_id"],
        emailId: json["email_id"],
        aboutMe: json["about_me"],
        customId: json["custom_id"],
        category: json["category"] == null
            ? []
            : List<int>.from(json["category"]!.map((x) => x)),
        deviceToken: json["device_token"],
        state: json["state"],
        certificate: json["certificate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "availability": availability == null
            ? []
            : List<dynamic>.from(availability!.map((x) => x)),
        "medical_id": medicalId,
        "location": location,
        "specialization": specialization,
        "hourly_rate": hourlyRate,
        "otp_verification_id": otpVerificationId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "total_exp": totalExp,
        "ideal_number": idealNumber,
        "preferred_specialities": preferredSpecialities,
        "profile_image": profileImage,
        "hospital_id": hospitalId,
        "clinic_id": clinicId,
        "email_id": emailId,
        "about_me": aboutMe,
        "custom_id": customId,
        "category":
            category == null ? [] : List<dynamic>.from(category!.map((x) => x)),
        "device_token": deviceToken,
        "state": state,
        "certificate": certificate,
      };
}
