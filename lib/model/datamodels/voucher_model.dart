import 'location_model.dart';
import 'user_model.dart';

/// status : true
/// statusMsg : "Successfully fetched vouchers list"
/// data : [{"id":6,"status":"ACTIVE","type":"ENTRY","amount":"14.5753","location":{"id":1,"title":"Port Rashid 1"},"user":{"firstName":"Traveler","lastName":"1","emirateId":"E13123","passport":null,"gender":null,"tourist":null},"transaction":null},{"id":7,"status":"ACTIVE","type":"ENTRY","amount":"14.5753","location":{"id":1,"title":"Port Rashid 1"},"user":{"firstName":"Traveler","lastName":"1","emirateId":"E13123","passport":null,"gender":null,"tourist":null},"transaction":null},{"id":54,"status":"ACTIVE","type":"ENTRY","amount":"14.5753","location":{"id":1,"title":"Port Rashid 1"},"user":{"firstName":"Traveler","lastName":"1","emirateId":"E13123","passport":null,"gender":null,"tourist":null},"transaction":null}]

class VoucherModel {
  bool status;

  String statusMsg;

  List<VoucherDataModel> data;

  int page;
  int limit;
  bool lastPage;

  VoucherModel({
    this.status = false,
    this.statusMsg = '',
    this.data = const [],
    this.page = 1,
    this.lastPage = true,
    this.limit = 14,
  });

  factory VoucherModel.fromJson({
    dynamic json,
    int page = 1,
    bool lastPage = true,
    int limit = 14,
  }) {
    page = page;
    lastPage = lastPage;
    limit = 14;
    List<VoucherDataModel> dataList = [];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        dataList.add(VoucherDataModel.fromJson(v));
      });
    }
    return VoucherModel(
      status: json['status'],
      statusMsg: json['statusMsg'],
      data: dataList,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['statusMsg'] = statusMsg;
    map['page'] = page;
    map['lastPage'] = lastPage;
    map['limit'] = limit;
    if (data != null) {
      map['data'] = data.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 6
/// status : "ACTIVE"
/// type : "ENTRY"
/// amount : "14.5753"
/// location : {"id":1,"title":"Port Rashid 1"}
/// user : {"firstName":"Traveler","lastName":"1","emirateId":"E13123","passport":null,"gender":null,"tourist":null}
/// transaction : null

class VoucherDataModel {
  int id;
  String status;
  String type;
  int amount;
  LocationModel location;
  UserModel user;
  dynamic transaction;

  VoucherDataModel({
    this.id = -1,
    this.status = '',
    this.type = '',
    this.amount = 0,
    required this.location,
    required this.user,
    this.transaction,
  });

  factory VoucherDataModel.fromJson(dynamic json) {
    return VoucherDataModel(
      id: json['id'],
      status: json['status'] ?? '',
      type: json['type'] ?? '',
      amount: json['amount'],
      location: json['location'] != null
          ? LocationModel.fromJson(json['location'])
          : LocationModel(),
      user:
          json['user'] != null ? UserModel.fromJson(json['user']) : UserModel(),
      transaction: json['transaction'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['status'] = status;
    map['type'] = type;
    map['amount'] = amount;
    if (location != null) {
      map['location'] = location.toJson();
    }
    if (user != null) {
      map['user'] = user.toJson();
    }
    map['transaction'] = transaction;
    return map;
  }
}
