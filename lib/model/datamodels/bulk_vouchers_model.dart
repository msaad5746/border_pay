/// status : true
/// statusMsg : "Successfully created tourist voucher"
/// data : {"acknowledged":true,"count":1,"vouchers":[{"id":44,"voucherNo":"029785e3-d6ff-4c37-8522-ab2ad44a45a2","status":"INACTIVE","type":"ENTRY","amount":"14.5753","createdByType":"Tourist","createdById":1,"createdByAdminId":null,"locationId":1,"userInfoId":45,"successfulTransactionId":null,"createdAt":"2022-04-06T10:55:06.907Z","updatedAt":"2022-04-06T10:55:06.912Z","user":{"id":45,"email":"traveler1@example.com","mobileNumber":"12312312213","firstName":"Traveler","lastName":"1","gender":null,"birthdate":null,"passport":null,"emirateId":"E13123","nationalityId":1,"createdAt":"2022-04-06T10:55:06.907Z","updatedAt":"2022-04-06T10:55:06.912Z"}}]}

class BulkVouchersModel {
  final bool status;
  final String statusMsg;
  final BulkVoucherData data;

  BulkVouchersModel(this.status, this.statusMsg, this.data);

  factory BulkVouchersModel.fromJson(dynamic json) {
    return BulkVouchersModel(
      json['status'],
      json['statusMsg'],
      json['data'] != null
          ? BulkVoucherData.fromJson(json['data'])
          : BulkVoucherData(),
    );
  }
}

/// acknowledged : true
/// count : 1
/// vouchers : [{"id":44,"voucherNo":"029785e3-d6ff-4c37-8522-ab2ad44a45a2","status":"INACTIVE","type":"ENTRY","amount":"14.5753","createdByType":"Tourist","createdById":1,"createdByAdminId":null,"locationId":1,"userInfoId":45,"successfulTransactionId":null,"createdAt":"2022-04-06T10:55:06.907Z","updatedAt":"2022-04-06T10:55:06.912Z","user":{"id":45,"email":"traveler1@example.com","mobileNumber":"12312312213","firstName":"Traveler","lastName":"1","gender":null,"birthdate":null,"passport":null,"emirateId":"E13123","nationalityId":1,"createdAt":"2022-04-06T10:55:06.907Z","updatedAt":"2022-04-06T10:55:06.912Z"}}]

class BulkVoucherData {
  final bool acknowledged;
  final int count;
  final List<Vouchers> vouchers;

  BulkVoucherData(
      {this.acknowledged = false, this.count = 1, this.vouchers = const []});

  factory BulkVoucherData.fromJson(dynamic json) {
    List<Vouchers> vouchersData = List.empty(growable: true);
    if (json['vouchers'] != null) {
      json['vouchers'].forEach((v) {
        vouchersData.add(Vouchers.fromJson(v));
      });
    }
    return BulkVoucherData(
      acknowledged: json['acknowledged'],
      count: json['count'],
      vouchers: vouchersData,
    );
  }
}

/// id : 44
/// voucherNo : "029785e3-d6ff-4c37-8522-ab2ad44a45a2"
/// status : "INACTIVE"
/// type : "ENTRY"
/// amount : "14.5753"
/// createdByType : "Tourist"
/// createdById : 1
/// createdByAdminId : null
/// locationId : 1
/// userInfoId : 45
/// successfulTransactionId : null
/// createdAt : "2022-04-06T10:55:06.907Z"
/// updatedAt : "2022-04-06T10:55:06.912Z"
/// user : {"id":45,"email":"traveler1@example.com","mobileNumber":"12312312213","firstName":"Traveler","lastName":"1","gender":null,"birthdate":null,"passport":null,"emirateId":"E13123","nationalityId":1,"createdAt":"2022-04-06T10:55:06.907Z","updatedAt":"2022-04-06T10:55:06.912Z"}

class Vouchers {
  final int id;
  final String voucherNo;
  final String status;
  final String type;
  final int amount;
  final String createdByType;
  final int createdById;
  final dynamic createdByAdminId;
  final int locationId;
  final int userInfoId;
  final dynamic successfulTransactionId;
  final String createdAt;
  final String updatedAt;
  final BulkVoucherUser user;
  final Location location;

  Vouchers({
    this.id = -1,
    this.voucherNo = '',
    this.status = '',
    this.type = '',
    this.amount = 0,
    this.createdByType = '',
    this.createdById = -1,
    this.createdByAdminId,
    this.locationId = -1,
    this.userInfoId = -1,
    this.successfulTransactionId,
    this.createdAt = '',
    this.updatedAt = '',
    required this.user,
    required this.location,
  });

  factory Vouchers.fromJson(dynamic json) {
    return Vouchers(
      id: json['id'],
      voucherNo: json['voucherNo'],
      status: json['status'],
      type: json['type'],
      amount: json['amount'],
      createdByType: json['createdByType'],
      createdById: json['createdById'],
      createdByAdminId: json['createdByAdminId'],
      locationId: json['locationId'],
      userInfoId: json['userInfoId'],
      successfulTransactionId: json['successfulTransactionId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      user: json['user'] != null
          ? BulkVoucherUser.fromJson(json['user'])
          : BulkVoucherUser(),
      location: json['location'] != null
          ? Location.fromJson(json['location'])
          : Location(),
    );
  }
}

/// id : 45  Location(id: -1, title: '', image: '', active: true),
/// email : "traveler1@example.com"
/// mobileNumber : "12312312213"
/// firstName : "Traveler"
/// lastName : "1"
/// gender : null
/// birthdate : null
/// passport : null
/// emirateId : "E13123"
/// nationalityId : 1
/// createdAt : "2022-04-06T10:55:06.907Z"
/// updatedAt : "2022-04-06T10:55:06.912Z"

class BulkVoucherUser {
  final int id;
  final String email;
  final String mobileNumber;
  final String firstName;
  final String lastName;
  final dynamic gender;
  final dynamic birthdate;
  final dynamic passport;
  final String emirateId;
  final int nationalityId;
  final String createdAt;
  final String updatedAt;

  BulkVoucherUser({
    this.id = -1,
    this.email = '',
    this.mobileNumber = '',
    this.firstName = '',
    this.lastName = '',
    this.gender,
    this.birthdate,
    this.passport,
    this.emirateId = '',
    this.nationalityId = -1,
    this.createdAt = '',
    this.updatedAt = '',
  });

  factory BulkVoucherUser.fromJson(dynamic json) {
    return BulkVoucherUser(
      id: json['id'],
      email: json['email'],
      mobileNumber: json['mobileNumber'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      birthdate: json['birthdate'],
      passport: json['passport'],
      emirateId: json['emirateId'],
      nationalityId: json['nationalityId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

/// id : 1
/// title : "Port Rashid 1"
/// image : "/images/locations/port-rashid.png"
/// active : true

class Location {
  final int id;
  final String title;
  final String image;
  final bool active;

  Location({
    this.id = -1,
    this.title = '',
    this.image = '',
    this.active = false,
  });

  factory Location.fromJson(dynamic json) {
    return Location(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      active: json['active'],
    );
  }
}
