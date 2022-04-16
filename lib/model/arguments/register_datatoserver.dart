import 'dart:io';

class RegisterDataServer {
  String firstName;
  String lastName;
  String phone;
  String areaCode;
  String email;
  String nationality;
  String password;
  int nationalityId;
  String emiratedpassport;
  File image = File("initial file");

  RegisterDataServer({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.areaCode,
    required this.email,
    required this.nationality,
    required this.password,
    required this.nationalityId,
    required this.emiratedpassport,
  });

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'mobileNumber': phone,
        'country_code': areaCode,
        'email': email,
        'country': nationality,
        'nationalityId': nationalityId,
        "emirate_id": emiratedpassport,
        "password": password,
      };
}
