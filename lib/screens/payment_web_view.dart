import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widget/blue_backbutton.dart';

class PaymentGateway extends StatefulWidget {
  static const String route = '/paymentGateway';
  const PaymentGateway({Key? key}) : super(key: key);

  @override
  State<PaymentGateway> createState() => _PaymentGatewayState();
}

class _PaymentGatewayState extends State<PaymentGateway> {

  final String paymentGateWay =
      "https://discoveritech.com/borderpay_payment/cbd.php?amount=500&orderId=810";

  // final String paymentGateWay =
  //     "https://discoveritech.com/schoolpay-transactions/PaymentInitiator.php?amount=500&parentID=810&studentID=123";

  WebViewController? _controller = null;

  @override
  void initState() {
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
      body: WebView(
        initialUrl: paymentGateWay,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) => _controller = webViewController,
        onPageFinished: (url){
          print('allowing navigation to $url');
        },
        navigationDelegate: (NavigationRequest request) {
          print('allowing navigation to $request');
          return NavigationDecision.navigate;
        },

      ),
    );
  }

  // void readData() {
  //   _controller?.evaluateJavascript(javascriptString)
  // }

}
