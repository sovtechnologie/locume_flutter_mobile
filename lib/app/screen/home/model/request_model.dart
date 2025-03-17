// To parse this JSON data, do
//
//     final requestRes = requestResFromJson(jsonString);

import 'dart:convert';

RequestRes requestResFromJson(String str) =>
    RequestRes.fromJson(json.decode(str));

String requestResToJson(RequestRes data) => json.encode(data.toJson());

class RequestRes {
  int? status;
  bool? message;
  List<Result>? result;

  RequestRes({
    this.status,
    this.message,
    this.result,
  });

  factory RequestRes.fromJson(Map<String, dynamic> json) => RequestRes(
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
  String? hospitalName;
  DateTime? startDate;
  DateTime? endDate;
  List<int>? categoryId;
  int? userId;
  String? shift;

  Result({
    this.id,
    this.hospitalName,
    this.startDate,
    this.endDate,
    this.categoryId,
    this.userId,
    this.shift,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        hospitalName: json["hospital_name"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        categoryId: json["category_id"] == null
            ? []
            : List<int>.from(json["category_id"]!.map((x) => x)),
        userId: json["user_id"],
        shift: json["shift"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hospital_name": hospitalName,
        "start_date": startDate?.toIso8601String(),
        "end_date": endDate?.toIso8601String(),
        "category_id": categoryId == null
            ? []
            : List<dynamic>.from(categoryId!.map((x) => x)),
        "user_id": userId,
        "shift": shift,
      };
}
