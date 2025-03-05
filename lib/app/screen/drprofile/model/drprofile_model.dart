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
  int? id;
  String? firstName;
  dynamic lastName;
  String? gender;
  dynamic availability;
  String? medicalId;
  String? location;
  dynamic specialization;
  dynamic hourlyRate;
  int? otpVerificationId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic totalExp;
  dynamic idealNumber;
  dynamic preferredSpecialities;
  String? profileImage;
  dynamic hospitalId;
  dynamic clinicId;
  dynamic emailId;
  dynamic aboutMe;
  String? customId;
  List<int>? category;
  String? deviceToken;
  String? state;
  dynamic certificate;
  List<HospitalDatum>? hospitalData;
  List<ClinicDatum>? clinicData;

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
    this.hospitalData,
    this.clinicData,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        availability: json["availability"],
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
        hospitalData: json["hospital_data"] == null
            ? []
            : List<HospitalDatum>.from(
                json["hospital_data"]!.map((x) => HospitalDatum.fromJson(x))),
        clinicData: json["clinic_data"] == null
            ? []
            : List<ClinicDatum>.from(
                json["clinic_data"]!.map((x) => ClinicDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "availability": availability,
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
        "hospital_data": hospitalData == null
            ? []
            : List<dynamic>.from(hospitalData!.map((x) => x.toJson())),
        "clinic_data": clinicData == null
            ? []
            : List<dynamic>.from(clinicData!.map((x) => x.toJson())),
      };
}

class ClinicDatum {
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
  int? mobileNumber;
  String? address;

  ClinicDatum({
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
  });

  factory ClinicDatum.fromJson(Map<String, dynamic> json) => ClinicDatum(
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
      };
}

class HospitalDatum {
  int? id;
  List<String>? visitHospitalSlot;
  String? hospitalLocation;
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
  int? mobileNumber;
  String? address;

  HospitalDatum({
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
  });

  factory HospitalDatum.fromJson(Map<String, dynamic> json) => HospitalDatum(
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
      };
}
