import 'dart:convert';

import 'package:borderpay/model/arguments/payment_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:xml2json/xml2json.dart';

import '../widget/blue_backbutton.dart';

class PaymentGateway extends StatefulWidget {
  final PaymentArgument argument;
  static const String route = '/paymentGateway';

  const PaymentGateway({Key? key, required this.argument}) : super(key: key);

  @override
  State<PaymentGateway> createState() => _PaymentGatewayState();
}

class _PaymentGatewayState extends State<PaymentGateway> {
  late String paymentGateWay;
  final myTransformer = Xml2Json();
  bool isLoading = false;
  bool isCodeReceived = false;

  @override
  void initState() {
    paymentGateWay =
        "https://discoveritech.com/BorderPay_Payment_Api/borderPay_request.php?amount=${widget.argument.payment}&orderid=${widget.argument.orderId}";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Center(
            child: BlueBackButton(
          context: context,
        )),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : WebView(
              initialUrl: paymentGateWay,
              javascriptMode: JavascriptMode.unrestricted,
              onPageStarted: (url) {
                debugPrint('onPageStarted $url');
              },
              onPageFinished: (url) {
                debugPrint('onPageFinished $url');
                if (!isCodeReceived &&
                    url.contains(
                        'https://discoveritech.com/BorderPay_Payment_Api/cdb_recieve.php')) {
                  debugPrint('CBD response received');
                  isCodeReceived = true;
                  var CBDReferenceNo = getResponse(
                      Uri.parse(url).queryParameters['string'] ?? '');
                  if (CBDReferenceNo != null) {
                    Navigator.pop(context, CBDReferenceNo);
                  }
                }
              },
            ),
    );
  }

  Object? getResponse(String response) {
    response = response.replaceAll('\\', '');
    response = response.replaceAll('\"', '');
    myTransformer.parse(response);
    var jsonString = myTransformer.toParker();
    var data = jsonDecode(jsonString);
    return response;
  }
}
