/// type : "ENTRY"
/// locationId : 1
/// traveler : {"firstName":"Traveler","lastName":"1","email":"traveler1@example.com","mobileNumber":"12312312213","nationalityId":1,"emirateId":"E13123"}

class CreateBulkVoucherModel {
  final String type;
  final int locationId;
  final List<BulkTraveler> traveler;

  CreateBulkVoucherModel(this.type, this.locationId, this.traveler);

  factory CreateBulkVoucherModel.fromJson(dynamic json) {
    List<BulkTraveler> travelersData = List.empty(growable: true);
    if (json['traveler'] != null) {
      json['traveler'].forEach((element) {
        travelersData.add(BulkTraveler.fromJson(element));
      });
    }
    return CreateBulkVoucherModel(
      json['type'],
      json['locationId'],
      travelersData,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['locationId'] = locationId;
    if (traveler.isNotEmpty) {
      map['travelers'] = traveler.map((v) => v.toJson()).toList();
    }

    return map;
  }
}

/// firstName : "Traveler"
/// lastName : "1"
/// email : "traveler1@example.com"
/// mobileNumber : "12312312213"
/// nationalityId : 1
/// emirateId : "E13123"

class BulkTraveler {
  String firstName;
  String lastName;
  String email;
  String mobileNumber;
  int nationalityId;
  String emirateId;

  BulkTraveler({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.mobileNumber = '',
    this.nationalityId = -1,
    this.emirateId = '',
  });

  factory BulkTraveler.fromJson(dynamic json) {
    return BulkTraveler(
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
