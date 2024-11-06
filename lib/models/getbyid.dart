import 'dart:convert';

class Getbyid {
  int status;
  String message;
  List<Result> result;

  Getbyid({
    required this.status,
    required this.message,
    required this.result,
  });

  factory Getbyid.fromRawJson(String str) => Getbyid.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Getbyid.fromJson(Map<String, dynamic> json) => Getbyid(
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
  String firstName;
  String mobileNumber;
  int id;
  String profileImage;
  String lastName;
  String gender;
  List<String> availability;
  String medicalId;
  String customId;
  String location;
  String specialization;
  List<int> category;
  int hourlyRate;
  int otpVerificationId;
  int totalExp;
  String emailId;
  String aboutMe;
  String hospitalName;
  List<int> preferredSpecialities;
  List<String> visitHospitalSlot;
  String hospitalLocation;
  String clinicName;
  List<String> clinicTimeSlot;
  String clinicLocation;
  DateTime createdAt;
  DateTime updatedAt;

  Result({
    required this.firstName,
    required this.mobileNumber,
    required this.id,
    required this.profileImage,
    required this.lastName,
    required this.gender,
    required this.availability,
    required this.medicalId,
    required this.customId,
    required this.location,
    required this.specialization,
    required this.category,
    required this.hourlyRate,
    required this.otpVerificationId,
    required this.totalExp,
    required this.emailId,
    required this.aboutMe,
    required this.hospitalName,
    required this.preferredSpecialities,
    required this.visitHospitalSlot,
    required this.hospitalLocation,
    required this.clinicName,
    required this.clinicTimeSlot,
    required this.clinicLocation,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        firstName: json["first_name"],
        mobileNumber: json["mobile_number"],
        id: json["id"],
        profileImage: json["profile_image"],
        lastName: json["last_name"],
        gender: json["gender"],
        availability: List<String>.from(json["availability"].map((x) => x)),
        medicalId: json["medical_id"],
        customId: json["custom_id"],
        location: json["location"],
        specialization: json["specialization"],
        category: List<int>.from(json["category"].map((x) => x)),
        hourlyRate: json["hourly_rate"],
        otpVerificationId: json["otp_verification_id"],
        totalExp: json["total_exp"],
        emailId: json["email_id"],
        aboutMe: json["about_me"],
        hospitalName: json["hospital_name"],
        preferredSpecialities:
            List<int>.from(json["preferred_specialities"].map((x) => x)),
        visitHospitalSlot:
            List<String>.from(json["visit_hospital_slot"].map((x) => x)),
        hospitalLocation: json["hospital_location"],
        clinicName: json["clinic_name"],
        clinicTimeSlot:
            List<String>.from(json["clinic_time_slot"].map((x) => x)),
        clinicLocation: json["clinic_location"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "mobile_number": mobileNumber,
        "id": id,
        "profile_image": profileImage,
        "last_name": lastName,
        "gender": gender,
        "availability": List<dynamic>.from(availability.map((x) => x)),
        "medical_id": medicalId,
        "custom_id": customId,
        "location": location,
        "specialization": specialization,
        "category": List<dynamic>.from(category.map((x) => x)),
        "hourly_rate": hourlyRate,
        "otp_verification_id": otpVerificationId,
        "total_exp": totalExp,
        "email_id": emailId,
        "about_me": aboutMe,
        "hospital_name": hospitalName,
        "preferred_specialities":
            List<dynamic>.from(preferredSpecialities.map((x) => x)),
        "visit_hospital_slot":
            List<dynamic>.from(visitHospitalSlot.map((x) => x)),
        "hospital_location": hospitalLocation,
        "clinic_name": clinicName,
        "clinic_time_slot": List<dynamic>.from(clinicTimeSlot.map((x) => x)),
        "clinic_location": clinicLocation,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
