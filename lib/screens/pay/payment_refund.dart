import 'package:borderpay/Route_Constants/route_constants.dart';
import 'package:borderpay/app_theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentRefundPage extends StatefulWidget {
  const PaymentRefundPage({Key? key}) : super(key: key);


  @override
  _PaymentRefundPageState createState() => _PaymentRefundPageState();
}

class _PaymentRefundPageState extends State<PaymentRefundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
                        padding: const EdgeInsets.only(top: 50.0,left: 20.36,right: 20.36),
              child: Container(
                  height: 37.26,
                  width: 37.26,
                  // margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.11),
                      color: CustomizedTheme.colorAccent),
                  child: Icon(Icons.arrow_back,color: CustomizedTheme.white)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 36.43,right: 20.36,left: 20.36),
            child: Text("Refund Payment",style: CustomizedTheme.sf_b_W500_26,),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.36),
            child: SizedBox(
              height: 42,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.36),
            child: Text('AED 105.25 will be refunded to your account.',style: CustomizedTheme.sf_b_W400_17),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.36,vertical: 34),
            child: Text('Do you want to proceed?',style: CustomizedTheme.sf_b_W500_17),
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.only(left: 20.36,right: 20.36,bottom: 37.93),
            child: Container(
              height: 61.07,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  // border: Border.all(color: CustomizedTheme.white,width: .5),
                  color: CustomizedTheme.colorAccent
              ),
              child: TextButton(onPressed: () {
                showCupertinoDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (ctx) {
                    return AlertDialog(
                      actionsAlignment: MainAxisAlignment.center,
                      insetPadding: const EdgeInsets.symmetric(horizontal: 0),
                      scrollable: true,
                      contentPadding: const EdgeInsets.all(0),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      titlePadding:  const EdgeInsets.all(0.0),
                      title: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          gradient: CustomizedTheme.dialogBG,
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(20))
                        ),
                        child: Image.asset('assets/icons/ic_alert.png'),
                      ),
                      content: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 22),
                            child: Text('Approval pending',style: CustomizedTheme.sf_b_W500_18,),
                          ),
                          Text('AED 105.25 will be refunded to your account',style: CustomizedTheme.sf_b_W400_1237,)
                        ],
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30.69,left: 62.49,right: 62.49,top: 24),
                          child: Container(
                            height: 37.59,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(color: CustomizedTheme.primaryBold,width: .5),
                                color: CustomizedTheme.primaryLight
                            ),
                            child: TextButton(onPressed: () {Navigator.pop(ctx);Navigator.pushNamed(context, RouteConstant.homePage);},
                                child: Text("Return to Dashboard",style: CustomizedTheme.r_b_W300_13)),
                          ),
                        ),
                      ],
                    );
                  },);
                },
                  child: Text("Continue",style: CustomizedTheme.sf_w_W500_23)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 41.93,left: 20.0,right: 20),
            child: Container(
              height: 61.07,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: CustomizedTheme.primaryBold,width: .5),
                  color: CustomizedTheme.primaryLight
              ),
              child: TextButton(onPressed: () {Navigator.pushNamed(context, '/new_user');},
                  child: Text("Cancel",style: CustomizedTheme.sf_b_W400_2347)),
            ),
          ),
        ],
      ),
    );
  }
}
