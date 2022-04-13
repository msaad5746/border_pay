import 'package:borderpay/model/datamodels/nationality_model.dart';

class UserModel {
  int userId;
  String firstName;
  String lastName;
  String emirateId;
  String email;
  String phoneNumber;
  NationalityModel? nationality;
  dynamic passport;
  dynamic gender;
  dynamic tourist;

  UserModel({
    this.userId = 1,
    this.firstName = '',
    this.lastName = '',
    this.emirateId = '',
    this.email = '',
    this.phoneNumber = '',
    this.nationality,
    this.passport = '',
    this.gender,
    this.tourist,
  });

  factory UserModel.fromJson(dynamic json) {
    return UserModel(
      userId: json['id'],
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      emirateId: json['emirateId'] ?? '',
      passport: json['passport'] ?? '',
      gender: json['gender'] ?? '',
      nationality: json['nationality'] != null
          ? NationalityModel.fromJson(json['nationality'])
          : NationalityModel(),
      tourist: json['tourist'],
      email: json['email'],
      phoneNumber: json['mobileNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['emirateId'] = emirateId;
    map['passport'] = passport;
    map['gender'] = gender;
    map['tourist'] = tourist;
    map['mobileNumber'] = phoneNumber;
    map['email'] = email;
    return map;
  }
}
