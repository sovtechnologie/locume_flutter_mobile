// To parse this JSON data, do
//
//     final verifyModel = verifyModelFromJson(jsonString);

import 'dart:convert';

VerifyModel verifyModelFromJson(String str) =>
    VerifyModel.fromJson(json.decode(str));

String verifyModelToJson(VerifyModel data) => json.encode(data.toJson());

class VerifyModel {
  int? status;
  String? message;
  Code? result;

  VerifyModel({
    this.status,
    this.message,
    this.result,
  });

  factory VerifyModel.fromJson(Map<String, dynamic> json) => VerifyModel(
        status: json["status"],
        message: json["message"],
        result: json["result"] == null ? null : Code.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": result?.toJson(),
      };
}

class Code {
  int? otpVerficationId;

  Code({
    this.otpVerficationId,
  });

  factory Code.fromJson(Map<String, dynamic> json) => Code(
        otpVerficationId: json["otpVerficationId"],
      );

  Map<String, dynamic> toJson() => {
        "otpVerficationId": otpVerficationId,
      };
}
