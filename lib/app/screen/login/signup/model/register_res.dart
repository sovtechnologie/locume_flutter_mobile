// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  int? status;
  String? message;
  User? user;
  String? token;

  Register({
    this.status,
    this.message,
    this.user,
    this.token,
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        status: json["status"],
        message: json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "user": user?.toJson(),
        "token": token,
      };
}

class User {
  String? firstName;
  String? mobileNumber;
  int? id;
  dynamic profileImage;
  String? lastName;
  String? gender;
  List<String>? availability;
  String? medicalId;
  dynamic totalExp;
  String? customId;
  String? location;
  String? specialization;
  int? hourlyRate;
  int? otpVerificationId;
  dynamic preferredSpecialities;
  dynamic emailId;
  dynamic aboutMe;
  dynamic hospitalName;
  dynamic visitHospitalSlot;
  dynamic hospitalLocation;
  dynamic clinicName;
  dynamic clinicTimeSlot;
  dynamic clinicLocation;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.firstName,
    this.mobileNumber,
    this.id,
    this.profileImage,
    this.lastName,
    this.gender,
    this.availability,
    this.medicalId,
    this.totalExp,
    this.customId,
    this.location,
    this.specialization,
    this.hourlyRate,
    this.otpVerificationId,
    this.preferredSpecialities,
    this.emailId,
    this.aboutMe,
    this.hospitalName,
    this.visitHospitalSlot,
    this.hospitalLocation,
    this.clinicName,
    this.clinicTimeSlot,
    this.clinicLocation,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
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
        totalExp: json["total_exp"],
        customId: json["custom_id"],
        location: json["location"],
        specialization: json["specialization"],
        hourlyRate: json["hourly_rate"],
        otpVerificationId: json["otp_verification_id"],
        preferredSpecialities: json["preferred_specialities"],
        emailId: json["email_id"],
        aboutMe: json["about_me"],
        hospitalName: json["hospital_name"],
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
        "total_exp": totalExp,
        "custom_id": customId,
        "location": location,
        "specialization": specialization,
        "hourly_rate": hourlyRate,
        "otp_verification_id": otpVerificationId,
        "preferred_specialities": preferredSpecialities,
        "email_id": emailId,
        "about_me": aboutMe,
        "hospital_name": hospitalName,
        "visit_hospital_slot": visitHospitalSlot,
        "hospital_location": hospitalLocation,
        "clinic_name": clinicName,
        "clinic_time_slot": clinicTimeSlot,
        "clinic_location": clinicLocation,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
