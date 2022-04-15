/// email : "asdf@gmail.com"
/// code : "verification-code"
/// newPassword : "12345qwert"

class VerifyUserModel {
  final String email;
  final String code;
  final String newPassword;

  VerifyUserModel(
      {required this.email,
      this.code = "verification-code",
      required this.newPassword});

  factory VerifyUserModel.fromJson(dynamic json) {
    return VerifyUserModel(
      email: json['email'],
      code: json['code'],
      newPassword: json['newPassword'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['code'] = "verification-code";
    map['newPassword'] = newPassword;
    return map;
  }
}
