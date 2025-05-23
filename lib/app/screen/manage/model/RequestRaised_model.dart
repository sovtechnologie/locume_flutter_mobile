// To parse this JSON data, do
//
//     final requestRaised = requestRaisedFromJson(jsonString);

import 'dart:convert';

RequestRaised requestRaisedFromJson(String str) =>
    RequestRaised.fromJson(json.decode(str));

String requestRaisedToJson(RequestRaised data) => json.encode(data.toJson());

class RequestRaised {
  int? status;
  bool? message;
  List<Result>? result;

  RequestRaised({
    this.status,
    this.message,
    this.result,
  });

  factory RequestRaised.fromJson(Map<String, dynamic> json) => RequestRaised(
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
  int? clinicHospitalId;
  String? clinicHospitalName;
  String? clinicHospitalImage;
  String? state;
  String? city;
  int? pincode;
  String? mobileNumber;
  String? address;
  String? about;
  int? id;
  String? hospitalName;
  int? firstRange;
  int? secondRange;
  List<int>? categoryId;
  String? shift;
  DateTime? startDate;
  DateTime? endDate;
  int? bookingType;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isActive;
  int? bookingStatus;
  int? hospitalClinicId;
  int? isHospitalOrClinic;
  List<UserDatum>? userData;

  Result({
    this.clinicHospitalId,
    this.clinicHospitalName,
    this.clinicHospitalImage,
    this.state,
    this.city,
    this.pincode,
    this.mobileNumber,
    this.address,
    this.about,
    this.id,
    this.hospitalName,
    this.firstRange,
    this.secondRange,
    this.categoryId,
    this.shift,
    this.startDate,
    this.endDate,
    this.bookingType,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.isActive,
    this.bookingStatus,
    this.hospitalClinicId,
    this.isHospitalOrClinic,
    this.userData,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        clinicHospitalId: json["clinic_hospital_id"],
        clinicHospitalName: json["clinic_hospital_name"],
        clinicHospitalImage: json["clinic_hospital_image"],
        state: json["state"],
        city: json["city"],
        pincode: json["pincode"],
        mobileNumber: json["mobile_number"],
        address: json["address"],
        about: json["about"],
        id: json["id"],
        hospitalName: json["hospital_name"],
        firstRange: json["first_range"],
        secondRange: json["second_range"],
        categoryId: json["category_id"] == null
            ? []
            : List<int>.from(json["category_id"]!.map((x) => x)),
        shift: json["shift"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        bookingType: json["booking_type"],
        userId: json["user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
        bookingStatus: json["booking_status"],
        hospitalClinicId: json["hospital_clinic_id"],
        isHospitalOrClinic: json["is_hospital_or_clinic"],
        userData: json["user_data"] == null
            ? []
            : List<UserDatum>.from(
                json["user_data"]!.map((x) => UserDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "clinic_hospital_id": clinicHospitalId,
        "clinic_hospital_name": clinicHospitalName,
        "clinic_hospital_image": clinicHospitalImage,
        "state": state,
        "city": city,
        "pincode": pincode,
        "mobile_number": mobileNumber,
        "address": address,
        "about": about,
        "id": id,
        "hospital_name": hospitalName,
        "first_range": firstRange,
        "second_range": secondRange,
        "category_id": categoryId == null
            ? []
            : List<dynamic>.from(categoryId!.map((x) => x)),
        "shift": shift,
        "start_date": startDate?.toIso8601String(),
        "end_date": endDate?.toIso8601String(),
        "booking_type": bookingType,
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "is_active": isActive,
        "booking_status": bookingStatus,
        "hospital_clinic_id": hospitalClinicId,
        "is_hospital_or_clinic": isHospitalOrClinic,
        "user_data": userData == null
            ? []
            : List<dynamic>.from(userData!.map((x) => x.toJson())),
      };
}

class UserDatum {
  int? id;
  String? firstName;
  dynamic lastName;
  String? gender;
  dynamic availability;
  dynamic medicalId;
  String? location;
  dynamic specialization;
  dynamic hourlyRate;
  int? otpVerificationId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic totalExp;
  dynamic idealNumber;
  dynamic preferredSpecialities;
  dynamic profileImage;
  dynamic hospitalId;
  dynamic clinicId;
  dynamic emailId;
  dynamic aboutMe;
  String? customId;
  dynamic category;
  dynamic deviceToken;
  String? state;
  dynamic certificate;

  UserDatum({
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

  factory UserDatum.fromJson(Map<String, dynamic> json) => UserDatum(
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
        category: json["category"],
        deviceToken: json["device_token"],
        state: json["state"],
        certificate: json["certificate"],
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
        "category": category,
        "device_token": deviceToken,
        "state": state,
        "certificate": certificate,
      };
}
