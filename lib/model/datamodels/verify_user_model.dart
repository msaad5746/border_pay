/// email : "asdf@gmail.com"
/// code : "verification-code"
/// newPassword : "12345qwert"

class VerifyUserModel {
  final String mobileNumber;
  final String code;
  final String newPassword;

  VerifyUserModel({
    required this.mobileNumber,
    required this.code,
    required this.newPassword,
  });

  factory VerifyUserModel.fromJson(dynamic json) {
    return VerifyUserModel(
      mobileNumber: json['mobileNumber'],
      code: json['code'],
      newPassword: json['newPassword'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobileNumber'] = mobileNumber;
    map['code'] = code;
    map['newPassword'] = newPassword;
    return map;
  }
}
