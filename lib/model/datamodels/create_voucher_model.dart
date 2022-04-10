/// type : "ENTRY"
/// locationId : 1
/// traveler : {"firstName":"Traveler","lastName":"1","email":"traveler1@example.com","mobileNumber":"12312312213","nationalityId":1,"emirateId":"E13123"}

class CreateVoucherModel {
  final String type;
  final int locationId;
  final Traveler traveler;

  CreateVoucherModel(this.type, this.locationId, this.traveler);

  factory CreateVoucherModel.fromJson(dynamic json) {
    return CreateVoucherModel(
      json['type'],
      json['locationId'],
      json['traveler'] != null
          ? Traveler.fromJson(json['traveler'])
          : Traveler(),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['locationId'] = locationId;
    map['traveler'] = traveler.toJson();

    return map;
  }
}

/// firstName : "Traveler"
/// lastName : "1"
/// email : "traveler1@example.com"
/// mobileNumber : "12312312213"
/// nationalityId : 1
/// emirateId : "E13123"

class Traveler {
  String firstName;
  String lastName;
  String email;
  String mobileNumber;
  int nationalityId;
  String emirateId;

  Traveler({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.mobileNumber = '',
    this.nationalityId = -1,
    this.emirateId = '',
  });

  factory Traveler.fromJson(dynamic json) {
    return Traveler(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      mobileNumber: json['mobileNumber'],
      nationalityId: json['nationalityId'],
      emirateId: json['emirateId'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['mobileNumber'] = mobileNumber;
    map['nationalityId'] = nationalityId;
    map['emirateId'] = emirateId;
    return map;
  }
}
