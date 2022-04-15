import 'package:borderpay/app_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaymentSuccessfulPage extends StatefulWidget {
  const PaymentSuccessfulPage({Key? key}) : super(key: key);

  @override
  _PaymentSuccessfulPageState createState() => _PaymentSuccessfulPageState();
}

class _PaymentSuccessfulPageState extends State<PaymentSuccessfulPage> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: CustomizedTheme.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: deviceHeight * .3,
            width: deviceWidth,
            decoration: BoxDecoration(
              color: CustomizedTheme.primaryBold,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 50.0,
                      left: 20.36,
                      right: 20.36,
                    ),
                    child: Container(
                      height: 37.26,
                      width: 37.26,
                      // margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10.11,
                          ),
                          color: CustomizedTheme.white),
                      child: Icon(
                        Icons.arrow_back,
                        color: CustomizedTheme.colorAccent,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 37.5,
                    right: 37.5,
                    top: 17.43,
                    bottom: 10.4,
                  ),
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
                          child: Text(
                            'Payment  Successful',
                            style: CustomizedTheme.sf_b_W600_2487,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6.29),
                          child: Text(
                            'Exit Fee paid',
                            style: CustomizedTheme.sf_b_W300_14,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),

          //Center
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 37.63,
                      bottom: 28,
                      right: 20.36,
                      left: 20.36,
                    ),
                    child: Text(
                      'Payment Voucher',
                      style: CustomizedTheme.popp_b_W500_23,
                    ),
                  ),
                  Center(
                      child: Column(
                    children: [
                      Text(
                        'Scan QR Code to view payment receipt ',
                        style: CustomizedTheme.sf_bo_W400_15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 26,
                          bottom: 39.83,
                        ),
                        child: QrImage(
                          data: "1234567890",
                          version: QrVersions.auto,
                          size: 200.0,
                          foregroundColor:
                              CustomizedTheme.primaryColor.withOpacity(
                            .6,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 26.53,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: .5,
                                color: CustomizedTheme.primaryBold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5.56,
                              ),
                              child: Text(
                                'Details',
                                style: CustomizedTheme.popp_b_w400_1203,
                              ),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.36,
                    ),
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        ListTile(
                          leading: Text(
                            'Receipt Number',
                            style: CustomizedTheme.sf_bo_W300_1503,
                          ),
                          trailing: Text(
                            '76765421',
                            style: CustomizedTheme.sf_bo_W500_1503,
                          ),
                        ),
                        ListTile(
                          leading: Text(
                            'Phone Number',
                            style: CustomizedTheme.sf_bo_W300_1503,
                          ),
                          trailing: Text(
                            '+971 52 479 2176',
                            style: CustomizedTheme.sf_bo_W500_1503,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: ExpansionTile(
                            title: Text(
                              "3",
                              style: CustomizedTheme.sf_bo_W500_1503,
                            ),
                            childrenPadding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 6),
                            collapsedBackgroundColor: Colors.white,
                            collapsedIconColor: CustomizedTheme.primaryBold,
                            iconColor: CustomizedTheme.primaryBold,
                            leading: Text(
                              'Number of people',
                              style: CustomizedTheme.sf_bo_W300_1503,
                            ),
                            backgroundColor: CustomizedTheme.primaryBright,
                            children: <Widget>[
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 6.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Person 1',
                                          style:
                                              CustomizedTheme.sf_bo_W300_1503,
                                        ),
                                        Text(
                                          'W18561',
                                          style:
                                              CustomizedTheme.sf_bo_W500_1503,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.symmetric(vertical: 6.0),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       Text('Person 1',style: CustomizedTheme.sf_bo_W300_1503),
                              //       Text('W18561',style: CustomizedTheme.sf_bo_W500_1503),
                              //     ],),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.symmetric(vertical: 6.0),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       Text('Person 2',style: CustomizedTheme.sf_bo_W300_1503),
                              //       Text('W18562',style: CustomizedTheme.sf_bo_W500_1503),
                              //     ],),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.symmetric(vertical: 6.0),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       Text('Person 3',style: CustomizedTheme.sf_bo_W300_1503),
                              //       Text('W18563',style: CustomizedTheme.sf_bo_W500_1503),
                              //     ],),
                              // ),
                            ],
                          ),
                        ),
                        ListTile(
                          leading: Text(
                            'Total Amount',
                            style: CustomizedTheme.sf_bo_W300_1503,
                          ),
                          trailing: Text(
                            'AED 105.25',
                            style: CustomizedTheme.sf_bo_W500_1503,
                          ),
                        ),
                        ListTile(
                          leading: Text(
                            'Payment Method',
                            style: CustomizedTheme.sf_bo_W300_1503,
                          ),
                          trailing: Text(
                            'Credit Card',
                            style: CustomizedTheme.sf_bo_W500_1503,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.36,
                      right: 20.36,
                      bottom: 37.93,
                    ),
                    child: Container(
                      height: 61.07,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          // border: Border.all(color: CustomizedTheme.white,width: .5),
                          color: CustomizedTheme.colorAccent),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/payment_refund');
                        },
                        child: Text(
                          "Refund Payment",
                          style: CustomizedTheme.w_W500_19,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
