// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.status,
    required this.response,
  });

  bool status;
  Response? response;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    response: Response.fromJson(json["response"]),
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
    required this.company,
    required this.tokenDetail,
  });

  Company company;
  TokenDetail tokenDetail;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    company: Company.fromJson(json["company"]),
    tokenDetail: TokenDetail.fromJson(json["token_detail"]),
  );

  Map<String, dynamic> toJson() => {
    "company": company.toJson(),
    "token_detail": tokenDetail.toJson(),
  };
}

class Company {
  Company({
    required this.id,
    required this.userId,
    required this.referenceId,
    required this.loginId,
    required this.driverId,
    required this.nationality,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.emirateId,
    required this.emirateDocument,
    required this.country,
    required this.phone,
    required this.truckNumber,
    required this.licenseNumber,
    required this.emailVerificationCode,
    required this.phoneVerificationCode,
    required this.resetPasswordToken,
    required this.platform,
    required this.googleSocialCode,
    required this.facebookSocialCode,
    required this.image,
    required this.totalAmount,
    required this.deviceToken,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
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

  int id;
  String userId;
  dynamic referenceId;
  dynamic loginId;
  int driverId;
  String nationality;
  String firstName;
  String lastName;
  String email;
  String emirateId;
  String emirateDocument;
  String country;
  int phone;
  dynamic truckNumber;
  dynamic licenseNumber;
  int emailVerificationCode;
  int phoneVerificationCode;
  int resetPasswordToken;
  String platform;
  dynamic googleSocialCode;
  dynamic facebookSocialCode;
  dynamic image;
  int totalAmount;
  dynamic deviceToken;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
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
    id: json["id"],
    userId: json["user_id"],
    referenceId: json["reference_id"],
    loginId: json["login_id"],
    driverId: json["driver_id"],
    nationality: json["nationality"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    emirateId: json["emirate_id"],
    emirateDocument: json["emirate_document"],
    country: json["country"],
    phone: json["phone"],
    truckNumber: json["truck_number"],
    licenseNumber: json["license_number"],
    emailVerificationCode: json["email_verification_code"],
    phoneVerificationCode: json["phone_verification_code"],
    resetPasswordToken: json["reset_password_token"],
    platform: json["platform"],
    googleSocialCode: json["google_social_code"],
    facebookSocialCode: json["facebook_social_code"],
    image: json["image"],
    totalAmount: json["total_amount"],
    deviceToken: json["device_token"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
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
    "id": id,
    "user_id": userId,
    "reference_id": referenceId,
    "login_id": loginId,
    "driver_id": driverId,
    "nationality": nationality,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "emirate_id": emirateId,
    "emirate_document": emirateDocument,
    "country": country,
    "phone": phone,
    "truck_number": truckNumber,
    "license_number": licenseNumber,
    "email_verification_code": emailVerificationCode,
    "phone_verification_code": phoneVerificationCode,
    "reset_password_token": resetPasswordToken,
    "platform": platform,
    "google_social_code": googleSocialCode,
    "facebook_social_code": facebookSocialCode,
    "image": image,
    "total_amount": totalAmount,
    "device_token": deviceToken,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
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
