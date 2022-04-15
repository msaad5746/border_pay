import 'bulk_vouchers_model.dart';

/// status : true
/// statusMsg : "Successfully paid voucher."
/// data : {"acknowledged":true,"updatedId":14,"vouchers":[{"id":17,"voucherNo":"5c223cc7-5dd5-4722-93a2-bd8432435f8a","status":"ACTIVE","type":"ENTRY","amount":5,"createdByType":"Tourist","createdById":1,"createdByAdminId":null,"locationId":1,"userInfoId":18,"successfulTransactionId":14,"createdAt":"2022-04-12T09:53:26.586Z","updatedAt":"2022-04-14T07:43:54.787Z","user":{"id":18,"email":"uwjn@jss.com","mobileNumber":"12641616161","firstName":"wheiei","lastName":"ejejek","gender":null,"birthdate":null,"passport":null,"emirateId":"nsjs","nationalityId":15,"createdAt":"2022-04-12T09:53:26.586Z","updatedAt":"2022-04-12T09:53:26.588Z"},"location":{"id":1,"title":"Port Rashid 1","image":"/images/locations/port-rashid.png","active":true},"successfulTransaction":{"id":14,"amount":5,"orderId":"A72RSWVXXRZ6CXV","cbdReferenceId":"245664","bankResponse":{"OrderID":"A72RSWVXXRZ6CXV","AuthCode":"831000","CardType":"001","CCReferenceNo":"6496728082616273004002","CBDReferenceNo":"245664","TokenizedValue":"","MaskedCardNumber":"xxxxxxxxxxxx1111","AuthorizationDateTime":"4/11/2022%202:26:48%20PM"},"status":"APPROVED","transactionChannel":"WEB","createdAt":"2022-04-12T09:54:55.085Z","updatedAt":"2022-04-14T07:43:53.446Z"}}]}

class PaidVoucherModel {
  final bool status;
  final String statusMsg;
  final Data data;

  PaidVoucherModel(
      {required this.status, required this.statusMsg, required this.data});

  factory PaidVoucherModel.fromJson(dynamic json) {
    return PaidVoucherModel(
      status: json['status'],
      statusMsg: json['statusMsg'],
      data: json['data'] != null ? Data.fromJson(json['data']) : Data(),
    );
  }
}

/// id : 14
/// vouchers : [{"id":17,"voucherNo":"5c223cc7-5dd5-4722-93a2-bd8432435f8a","status":"ACTIVE","type":"ENTRY","amount":5,"createdByType":"Tourist","createdById":1,"createdByAdminId":null,"locationId":1,"userInfoId":18,"successfulTransactionId":14,"createdAt":"2022-04-12T09:53:26.586Z","updatedAt":"2022-04-14T07:43:54.787Z","user":{"id":18,"email":"uwjn@jss.com","mobileNumber":"12641616161","firstName":"wheiei","lastName":"ejejek","gender":null,"birthdate":null,"passport":null,"emirateId":"nsjs","nationalityId":15,"createdAt":"2022-04-12T09:53:26.586Z","updatedAt":"2022-04-12T09:53:26.588Z"},"location":{"id":1,"title":"Port Rashid 1","image":"/images/locations/port-rashid.png","active":true},"successfulTransaction":{"id":14,"amount":5,"orderId":"A72RSWVXXRZ6CXV","cbdReferenceId":"245664","bankResponse":{"OrderID":"A72RSWVXXRZ6CXV","AuthCode":"831000","CardType":"001","CCReferenceNo":"6496728082616273004002","CBDReferenceNo":"245664","TokenizedValue":"","MaskedCardNumber":"xxxxxxxxxxxx1111","AuthorizationDateTime":"4/11/2022%202:26:48%20PM"},"status":"APPROVED","transactionChannel":"WEB","createdAt":"2022-04-12T09:54:55.085Z","updatedAt":"2022-04-14T07:43:53.446Z"}}]

class Data {
  final int id;
  final List<Vouchers> vouchers;

  Data({this.id = -1, this.vouchers = const []});

  factory Data.fromJson(dynamic json) {
    List<Vouchers> vouchersList = List.empty(growable: true);
    if (json['vouchers'] != null) {
      json['vouchers'].forEach((v) {
        vouchersList.add(Vouchers.fromJson(v));
      });
    }
    return Data(
      id: json['id'] ?? 0,
      vouchers: vouchersList,
    );
  }
}
