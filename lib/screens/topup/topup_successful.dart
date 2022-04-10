import 'package:borderpay/app_theme/theme.dart';
import 'package:flutter/material.dart';

class TopUpSuccessfulPage extends StatefulWidget {
  const TopUpSuccessfulPage({Key? key}) : super(key: key);


  @override
  _TopUpSuccessfulPageState createState() => _TopUpSuccessfulPageState();
}

class _TopUpSuccessfulPageState extends State<TopUpSuccessfulPage> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: CustomizedTheme.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: deviceHeight *.3,
                width:  deviceWidth,
                decoration: BoxDecoration(
                    color: CustomizedTheme.primaryBold,
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30))
                ),
                child: Column(
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
                                color: CustomizedTheme.white),
                            child: Icon(Icons.arrow_back,color: CustomizedTheme.colorAccent)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 37.5,right: 37.5,top: 17.43,bottom: 10.4),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          // border: Border.all(color: CustomizedTheme.white,width: 5),
                            borderRadius: BorderRadius.circular(30),
                            color: CustomizedTheme.white),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 37.5,right: 37.5,top: 17.43,bottom: 10.4),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  // border: Border.all(color: CustomizedTheme.white,width: 5),
                                    borderRadius: BorderRadius.circular(30),
                                    color: CustomizedTheme.white),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 38.82),
                                      child: Text('Top Up  Successful',style: CustomizedTheme.sf_b_W600_2487),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              //Center
              Padding(
                padding: const EdgeInsets.only(top: 53.63,bottom: 42.25,right: 20.36,left: 20.36),
                child: Text('Topup Voucher',style: CustomizedTheme.popp_b_W500_23,),
              ),
              Center(child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26.53),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: .5,
                            color: CustomizedTheme.primaryBold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.56),
                          child: Text('Details',style: CustomizedTheme.popp_b_w400_1203),
                        ),
                        Expanded(
                          child: Container(
                            height: .5,
                            color: CustomizedTheme.primaryBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),

              //Details
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.36,vertical: 48.75),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      leading: Text('Phone Number',style: CustomizedTheme.sf_bo_W300_1503),
                      trailing: Text('+971 52 479 2176',style: CustomizedTheme.sf_bo_W500_1503),
                    ),
                    ListTile(
                      leading: Text('Number of people',style: CustomizedTheme.sf_bo_W300_1503),
                      trailing: Text('1',style: CustomizedTheme.sf_bo_W500_1503),
                    ),
                    ListTile(
                      leading: Text('Total Amount',style: CustomizedTheme.sf_bo_W300_1503),
                      trailing: Text('AED 105',style: CustomizedTheme.sf_bo_W500_1503),
                    ),
                    ListTile(
                      leading: Text('Payment Method',style: CustomizedTheme.sf_bo_W300_1503),
                      trailing: Text('Credit Card',style: CustomizedTheme.sf_bo_W500_1503),
                    ),
                    ListTile(
                      leading: Text('Payment Date',style: CustomizedTheme.sf_bo_W300_1503),
                      trailing: Text('21 October, 2021',style: CustomizedTheme.sf_bo_W500_1503),
                    ),
                    ListTile(
                      leading: Text('Payment Time',style: CustomizedTheme.sf_bo_W300_1503),
                      trailing: Text('09:30 PM',style: CustomizedTheme.sf_bo_W500_1503),
                    ),
                  ],
                ),
              ),


            ],
          ),
        )
    );
  }
}
