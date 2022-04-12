/// voucherIds : [4]

class VoucherTransactionRequest {
  final List<int> voucherIds;

  VoucherTransactionRequest(this.voucherIds);

  factory VoucherTransactionRequest.fromJson(dynamic json) {
    return VoucherTransactionRequest(
      json['voucherIds'] != null ? json['voucherIds'].cast<int>() : [],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['voucherIds'] = voucherIds;
    map['transactionChannel'] = "WEB";
    return map;
  }
}

/// acknowledged : true
/// id : 3
/// orderId : "KLOKM8RJ60B4SCZ"
/// amount : 5

class VoucherTransactionReceived {
  final bool acknowledged;
  final int id;
  final String orderId;
  final int amount;

  VoucherTransactionReceived({
    this.acknowledged = false,
    this.id = 0,
    this.orderId = '',
    this.amount = 0,
  });

  factory VoucherTransactionReceived.fromJson(dynamic json) {
    return VoucherTransactionReceived(
      acknowledged: json['data']['acknowledged'],
      id: json['data']['id'],
      orderId: json['data']['orderId'],
      amount: json['data']['amount'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['acknowledged'] = acknowledged;
    map['id'] = id;
    map['orderId'] = orderId;
    map['amount'] = amount;
    return map;
  }
}
