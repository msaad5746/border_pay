// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RegisterModel registerModelFromJson(dynamic json) =>
    RegisterModel.fromJson(json);

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    required this.status,
    required this.response,
  });

  bool status;
  Response? response;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        status: json["status"],
        response: json["response"]!=null ? Response.fromJson(json["response"]):null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": response!.toJson(),
      };
}

class Response {
  Response({
    required this.message,
    required this.detail,
  });

  String message;
  Detail detail;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        message: json["message"],
        detail: Detail.fromJson(json["detail"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "detail": detail.toJson(),
      };
}

class Detail {
  Detail({
    required this.messageResponse,
    required this.company,
    required this.tokenDetail,
  });

  String messageResponse;
  Company company;
  TokenDetail tokenDetail;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        messageResponse: json["message response"],
        company: Company.fromJson(json["company"]),
        tokenDetail: TokenDetail.fromJson(json["token_detail"]),
      );

  Map<String, dynamic> toJson() => {
        "message response": messageResponse,
        "company": company.toJson(),
        "token_detail": tokenDetail.toJson(),
      };
}

class Company {
  Company({
    required this.userId,
    required this.nationality,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.emirateId,
    required this.phone,
    required this.country,
    required this.platform,
    required this.phoneVerificationCode,
    required this.updatedAt,
    required this.createdAt,
    required this.phoneVerified,
    required this.emailVerified,
    required this.active,
    required this.customer,
    required this.admin,
    required this.immigration,
    required this.financial,
    required this.supervisor,
    required this.company,
    required this.pushNotifications,
    required this.biometricVerification,
    required this.imageUrl,
  });

  String userId;
  String nationality;
  String firstName;
  String lastName;
  String email;
  String emirateId;
  String phone;
  String country;
  String platform;
  int phoneVerificationCode;
  DateTime updatedAt;
  DateTime createdAt;
  bool phoneVerified;
  bool emailVerified;
  bool active;
  bool customer;
  bool admin;
  bool immigration;
  bool financial;
  bool supervisor;
  bool company;
  bool pushNotifications;
  bool biometricVerification;
  dynamic imageUrl;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        userId: json["user_id"],
        nationality: json["nationality"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        emirateId: json["emirate_id"],
        phone: json["phone"],
        country: json["country"],
        platform: json["platform"],
        phoneVerificationCode: json["phone_verification_code"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        phoneVerified: json["phone_verified"],
        emailVerified: json["email_verified"],
        active: json["active"],
        customer: json["customer"],
        admin: json["admin"],
        immigration: json["immigration"],
        financial: json["financial"],
        supervisor: json["supervisor"],
        company: json["company"],
        pushNotifications: json["push_notifications"],
        biometricVerification: json["biometric_verification"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "nationality": nationality,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "emirate_id": emirateId,
        "phone": phone,
        "country": country,
        "platform": platform,
        "phone_verification_code": phoneVerificationCode,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "phone_verified": phoneVerified,
        "email_verified": emailVerified,
        "active": active,
        "customer": customer,
        "admin": admin,
        "immigration": immigration,
        "financial": financial,
        "supervisor": supervisor,
        "company": company,
        "push_notifications": pushNotifications,
        "biometric_verification": biometricVerification,
        "image_url": imageUrl,
      };
}

class TokenDetail {
  TokenDetail({
    required this.accessToken,
    required this.tokenType,
  });

  String accessToken;
  String tokenType;

  factory TokenDetail.fromJson(Map<String, dynamic> json) => TokenDetail(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
      };
}
