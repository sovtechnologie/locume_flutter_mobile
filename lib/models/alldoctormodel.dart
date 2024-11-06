import 'dart:convert';

class Alldoctormodel {
  int status;
  bool message;
  List<Result> result;

  Alldoctormodel({
    required this.status,
    required this.message,
    required this.result,
  });

  factory Alldoctormodel.fromRawJson(String str) =>
      Alldoctormodel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Alldoctormodel.fromJson(Map<String, dynamic> json) => Alldoctormodel(
        status: json["status"],
        message: json["message"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  int id;
  String firstName;
  String mobileNumber;
  String lastName;
  String gender;
  List<String> availability;
  String medicalId;
  String location;
  String customId;
  String? profileImage;
  String specialization;
  int hourlyRate;
  int? totalExp;
  List<int> preferredSpecialities;
  int otpVerificationId;
  String? emailId;
  String? aboutMe;
  List<int> category;
  int? clinicId;
  String? clinicName;
  String? clinicLocation;
  List<String>? clinicTimeSlot;
  int? hospitalId;
  List<String>? visitHospitalSlot;
  String? hospitalLocation;
  String? hospitalName;
  DateTime createdAt;
  DateTime updatedAt;

  Result({
    required this.id,
    required this.firstName,
    required this.mobileNumber,
    required this.lastName,
    required this.gender,
    required this.availability,
    required this.medicalId,
    required this.location,
    required this.customId,
    required this.profileImage,
    required this.specialization,
    required this.hourlyRate,
    required this.totalExp,
    required this.preferredSpecialities,
    required this.otpVerificationId,
    required this.emailId,
    required this.aboutMe,
    required this.category,
    required this.clinicId,
    required this.clinicName,
    required this.clinicLocation,
    required this.clinicTimeSlot,
    required this.hospitalId,
    required this.visitHospitalSlot,
    required this.hospitalLocation,
    required this.hospitalName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        firstName: json["first_name"],
        mobileNumber: json["mobile_number"],
        lastName: json["last_name"],
        gender: json["gender"],
        availability: List<String>.from(json["availability"].map((x) => x)),
        medicalId: json["medical_id"],
        location: json["location"],
        customId: json["custom_id"],
        profileImage: json["profile_image"],
        specialization: json["specialization"],
        hourlyRate: json["hourly_rate"],
        totalExp: json["total_exp"],
        preferredSpecialities:
            List<int>.from(json["preferred_specialities"].map((x) => x)),
        otpVerificationId: json["otp_verification_id"],
        emailId: json["email_id"],
        aboutMe: json["about_me"],
        category: List<int>.from(json["category"].map((x) => x)),
        clinicId: json["clinic_id"],
        clinicName: json["clinic_name"],
        clinicLocation: json["clinic_location"],
        clinicTimeSlot: json["clinic_time_slot"] == null
            ? []
            : List<String>.from(json["clinic_time_slot"]!.map((x) => x)),
        hospitalId: json["hospital_id"],
        visitHospitalSlot: json["visit_hospital_slot"] == null
            ? []
            : List<String>.from(json["visit_hospital_slot"]!.map((x) => x)),
        hospitalLocation: json["hospital_location"],
        hospitalName: json["hospital_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "mobile_number": mobileNumber,
        "last_name": lastName,
        "gender": gender,
        "availability": List<dynamic>.from(availability.map((x) => x)),
        "medical_id": medicalId,
        "location": location,
        "custom_id": customId,
        "profile_image": profileImage,
        "specialization": specialization,
        "hourly_rate": hourlyRate,
        "total_exp": totalExp,
        "preferred_specialities":
            List<dynamic>.from(preferredSpecialities.map((x) => x)),
        "otp_verification_id": otpVerificationId,
        "email_id": emailId,
        "about_me": aboutMe,
        "category": List<dynamic>.from(category.map((x) => x)),
        "clinic_id": clinicId,
        "clinic_name": clinicName,
        "clinic_location": clinicLocation,
        "clinic_time_slot": clinicTimeSlot == null
            ? []
            : List<dynamic>.from(clinicTimeSlot!.map((x) => x)),
        "hospital_id": hospitalId,
        "visit_hospital_slot": visitHospitalSlot == null
            ? []
            : List<dynamic>.from(visitHospitalSlot!.map((x) => x)),
        "hospital_location": hospitalLocation,
        "hospital_name": hospitalName,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
