class RegisterResponse {
  bool? status;
  String? statusMsg;
  int? statusCode;
  Data? data;

  RegisterResponse({
    this.status,
    this.statusMsg,
    this.statusCode,
    this.data,
  });

  static RegisterResponse emptyObj() {
    return RegisterResponse(
      status: false,
      statusMsg: '',
      statusCode: 0,
      data: Data.emptyObj(),
    );
  }

  RegisterResponse.fromJson(
    Map<String, dynamic> json,
    int statusCode,
  ) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    this.statusCode = statusCode;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusMsg'] = statusMsg;
    data['statusCode'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  bool? acknowledged;
  int? insertedId;

  Data({
    this.acknowledged,
    this.insertedId,
  });

  static Data emptyObj() {
    return Data(
      acknowledged: false,
      insertedId: 0,
    );
  }

  Data.fromJson(Map<String, dynamic> json) {
    acknowledged = json['acknowledged'];
    insertedId = json['insertedId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['acknowledged'] = acknowledged;
    data['insertedId'] = insertedId;
    return data;
  }
}
