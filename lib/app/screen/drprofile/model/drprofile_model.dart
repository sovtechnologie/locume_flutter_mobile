// To parse this JSON data, do
//
//     final drprofile = drprofileFromJson(jsonString);

import 'dart:convert';

Drprofile drprofileFromJson(String str) => Drprofile.fromJson(json.decode(str));

String drprofileToJson(Drprofile data) => json.encode(data.toJson());

class Drprofile {
  int? status;
  String? message;
  List<Result>? result;

  Drprofile({
    this.status,
    this.message,
    this.result,
  });

  factory Drprofile.fromJson(Map<String, dynamic> json) => Drprofile(
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
  String? firstName;
  String? mobileNumber;
  int? id;
  dynamic profileImage;
  String? lastName;
  String? gender;
  List<String>? availability;
  String? medicalId;
  String? customId;
  String? location;
  String? specialization;
  List<dynamic>? category;
  int? hourlyRate;
  int? otpVerificationId;
  int? totalExp;
  dynamic emailId;
  dynamic aboutMe;
  dynamic hospitalName;
  List<dynamic>? preferredSpecialities;
  dynamic visitHospitalSlot;
  dynamic hospitalLocation;
  dynamic clinicName;
  dynamic clinicTimeSlot;
  dynamic clinicLocation;
  DateTime? createdAt;
  DateTime? updatedAt;

  Result({
    this.firstName,
    this.mobileNumber,
    this.id,
    this.profileImage,
    this.lastName,
    this.gender,
    this.availability,
    this.medicalId,
    this.customId,
    this.location,
    this.specialization,
    this.category,
    this.hourlyRate,
    this.otpVerificationId,
    this.totalExp,
    this.emailId,
    this.aboutMe,
    this.hospitalName,
    this.preferredSpecialities,
    this.visitHospitalSlot,
    this.hospitalLocation,
    this.clinicName,
    this.clinicTimeSlot,
    this.clinicLocation,
    this.createdAt,
    this.updatedAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        firstName: json["first_name"],
        mobileNumber: json["mobile_number"],
        id: json["id"],
        profileImage: json["profile_image"],
        lastName: json["last_name"],
        gender: json["gender"],
        availability: json["availability"] == null
            ? []
            : List<String>.from(json["availability"]!.map((x) => x)),
        medicalId: json["medical_id"],
        customId: json["custom_id"],
        location: json["location"],
        specialization: json["specialization"],
        category: json["category"] == null
            ? []
            : List<int>.from(json["category"]!.map((x) => x)),
        hourlyRate: json["hourly_rate"],
        otpVerificationId: json["otp_verification_id"],
        totalExp: json["total_exp"],
        emailId: json["email_id"],
        aboutMe: json["about_me"],
        hospitalName: json["hospital_name"],
        preferredSpecialities: json["preferred_specialities"] == null
            ? []
            : List<int>.from(json["preferred_specialities"]!.map((x) => x)),
        visitHospitalSlot: json["visit_hospital_slot"],
        hospitalLocation: json["hospital_location"],
        clinicName: json["clinic_name"],
        clinicTimeSlot: json["clinic_time_slot"],
        clinicLocation: json["clinic_location"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "mobile_number": mobileNumber,
        "id": id,
        "profile_image": profileImage,
        "last_name": lastName,
        "gender": gender,
        "availability": availability == null
            ? []
            : List<dynamic>.from(availability!.map((x) => x)),
        "medical_id": medicalId,
        "custom_id": customId,
        "location": location,
        "specialization": specialization,
        "category":
            category == null ? [] : List<dynamic>.from(category!.map((x) => x)),
        "hourly_rate": hourlyRate,
        "otp_verification_id": otpVerificationId,
        "total_exp": totalExp,
        "email_id": emailId,
        "about_me": aboutMe,
        "hospital_name": hospitalName,
        "preferred_specialities": preferredSpecialities == null
            ? []
            : List<dynamic>.from(preferredSpecialities!.map((x) => x)),
        "visit_hospital_slot": visitHospitalSlot,
        "hospital_location": hospitalLocation,
        "clinic_name": clinicName,
        "clinic_time_slot": clinicTimeSlot,
        "clinic_location": clinicLocation,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
