import 'package:borderpay/model/datamodels/user_model.dart';

class LoginUserModel {
  final bool status;
  final String statusMsg;
  final UserModel data;

  LoginUserModel(this.status, this.statusMsg, this.data);

  factory LoginUserModel.fromJson(dynamic json) {
    return LoginUserModel(
      json['status'],
      json['statusMsg'],
      json['data'] != null ? UserModel.fromJson(json['data']) : UserModel(),
    );
  }
}
