/// type : "ENTRY"
/// locationId : 1
/// voucherIds : [9]
/// transactionChannel : "WEB"
/// bankResponse : {"status":"APPROVED","cyberSourceId":"123","orderId":"12321","amount":"10.0"}

class PayVoucherModel {
  final String type;
  final int locationId;
  final List<int> voucherIds;
  final String transactionChannel;
  final BankResponse bankResponse;

  PayVoucherModel({
    required this.type,
    required this.locationId,
    required this.voucherIds,
    this.transactionChannel = "WEB",
    required this.bankResponse,
  });

  factory PayVoucherModel.fromJson(dynamic json) {
    return PayVoucherModel(
      type: json['type'],
      locationId: json['locationId'],
      voucherIds:
          json['voucherIds'] != null ? json['voucherIds'].cast<int>() : [],
      transactionChannel: json['transactionChannel'],
      bankResponse: json['bankResponse'] != null
          ? BankResponse.fromJson(json['bankResponse'])
          : BankResponse(orderId: '', amount: 0, cyberSourceId: '', status: ''),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['locationId'] = locationId;
    map['voucherIds'] = voucherIds;
    map['transactionChannel'] = transactionChannel;
    if (bankResponse != null) {
      map['bankResponse'] = bankResponse.toJson();
    }
    return map;
  }
}

/// status : "APPROVED"
/// cyberSourceId : "123"
/// orderId : "12321"
/// amount : "10.0"

class BankResponse {
  final String status;
  final String cyberSourceId;
  final String orderId;
  final int amount;

  BankResponse(
      {this.status = "APPROVED",
      required this.cyberSourceId,
      required this.orderId,
      required this.amount});

  factory BankResponse.fromJson(dynamic json) {
    return BankResponse(
      status: json['status'],
      cyberSourceId: json['cyberSourceId'],
      orderId: json['orderId'],
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['cyberSourceId'] = cyberSourceId;
    map['orderId'] = orderId;
    map['amount'] = amount;
    return map;
  }
}
