// To parse this JSON data, do
//
//     final requestRaisedDetails = requestRaisedDetailsFromJson(jsonString);

import 'dart:convert';

RequestRaisedDetails requestRaisedDetailsFromJson(String str) =>
    RequestRaisedDetails.fromJson(json.decode(str));

String requestRaisedDetailsToJson(RequestRaisedDetails data) =>
    json.encode(data.toJson());

class RequestRaisedDetails {
  int? status;
  bool? message;
  List<Result>? result;

  RequestRaisedDetails({
    this.status,
    this.message,
    this.result,
  });

  factory RequestRaisedDetails.fromJson(Map<String, dynamic> json) =>
      RequestRaisedDetails(
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
  List<dynamic>? userData;

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
            : List<dynamic>.from(json["user_data"]!.map((x) => x)),
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
        "user_data":
            userData == null ? [] : List<dynamic>.from(userData!.map((x) => x)),
      };
}
