import 'dart:io';

import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/model/datamodels/bulk_vouchers_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MultiVoucherSuccessPage extends StatefulWidget {
  final List<Vouchers> vouchersData;

  const MultiVoucherSuccessPage({Key? key, required this.vouchersData})
      : super(key: key);

  @override
  _MultiVoucherSuccessPageState createState() =>
      _MultiVoucherSuccessPageState();
}

class _MultiVoucherSuccessPageState extends State<MultiVoucherSuccessPage> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomizedTheme.white,
        body: SafeArea(
          top: Platform.isIOS ? false : true,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 235.61.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                      color: CustomizedTheme.primaryBold,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(30.r))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 50.0.h, left: 20.36.w, right: 20.36.w),
                          child: Container(
                              height: 37.26.h,
                              width: 37.26.w,
                              // margin: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.11.r),
                                  color: CustomizedTheme.white),
                              child: Icon(Icons.arrow_back,
                                  color: CustomizedTheme.colorAccent)),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 37.w, right: 37.w, top: 17.43.h),
                        child: Container(
                          width: 1.sw,
                          height: 83.h,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: CustomizedTheme.white,
                                  spreadRadius: 0,
                                  blurRadius: 1,
                                  offset: const Offset(
                                      0, 5), // changes position of shadow
                                ),
                              ],
                              // border: Border.all(color: CustomizedTheme.white,width: 5),
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(22.r)),
                              color: CustomizedTheme.white),
                          child: Center(
                              child: Text('Voucher Successful',
                                  style: CustomizedTheme.sf_b_W600_2487)),
                        ),
                      )
                    ],
                  ),
                ),

                //Center
                Padding(
                  padding:
                      EdgeInsets.only(top: 75.39.h, left: 20.w, right: 20.w),
                  child: Container(
                    width: 1.sw,
                    // height: 109.h,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/payments/voucher-bg-multi.png'),
                    )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 19.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Voucher Number : ',
                                style: CustomizedTheme.roboto_w_W400_20,
                              ),
                              Container(
                                width: 150.w,
                                child: Text(
                                  'L${widget.vouchersData[0].id.toString()}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomizedTheme.roboto_w_W700_20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Number of travellers: ',
                              style: CustomizedTheme.roboto_w_W400_14,
                            ),
                            Text(
                              widget.vouchersData.length.toString(),
                              style: CustomizedTheme.roboto_w_W700_14,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 12.h, bottom: 5.h, left: 19.w),
                              child: Container(
                                height: 50.h,
                                width: 50.w,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 5.h),
                                color: CustomizedTheme.white,
                                child: Image.asset(
                                  'assets/icons/ic_qr_small.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.vouchersData.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ExpansionPanelList.radio(
                        animationDuration: const Duration(milliseconds: 600),
                        expansionCallback: (panelIndex, isExpanded) {
                          setState(() {
                            _expanded = !_expanded;
                          });
                        },
                        children: [
                          ExpansionPanelRadio(
                            backgroundColor: CustomizedTheme.primaryBright,
                            headerBuilder: (context, isExpanded) {
                              return ListTile(
                                  title: Text("Traveller ${index + 1}",
                                      style: CustomizedTheme.sf_b_W500_19));
                            },
                            body: Container(
                              decoration: BoxDecoration(
                                  color: CustomizedTheme.primaryBright,
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(10.r))),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 15.w,
                                        right: 15.w,
                                        top: 32.h,
                                        bottom: 26.45.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        buildText('Traveller Name',
                                            CustomizedTheme.sf_bo_W300_1503),
                                        buildText(
                                            '${widget.vouchersData[index].user.firstName} ${widget.vouchersData[index].user.lastName}',
                                            CustomizedTheme.sf_bo_W500_1503),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 15.w,
                                        right: 15.w,
                                        bottom: 26.45.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        buildText('Email ID',
                                            CustomizedTheme.sf_bo_W300_1503),
                                        buildText(
                                            widget
                                                .vouchersData[index].user.email,
                                            CustomizedTheme.sf_bo_W500_1503),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 15.w,
                                        right: 15.w,
                                        bottom: 26.45.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        buildText('Phone Number',
                                            CustomizedTheme.sf_bo_W300_1503),
                                        buildText(
                                            widget.vouchersData[index].user
                                                .mobileNumber,
                                            CustomizedTheme.sf_bo_W500_1503),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 15.w,
                                        right: 15.w,
                                        bottom: 26.45.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        buildText('Nationality',
                                            CustomizedTheme.sf_bo_W300_1503),
                                        buildText(
                                            '${widget.vouchersData[index].user.nationalityId}',
                                            CustomizedTheme.sf_bo_W500_1503),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 15.w,
                                        right: 15.w,
                                        bottom: 26.45.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        buildText('Emirates ID',
                                            CustomizedTheme.sf_bo_W300_1503),
                                        buildText(
                                            widget.vouchersData[index].user
                                                .emirateId,
                                            CustomizedTheme.sf_bo_W500_1503),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 15.w,
                                        right: 15.w,
                                        bottom: 26.45.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        buildText('Total Amount',
                                            CustomizedTheme.sf_bo_W300_1503),
                                        buildText(
                                            'AED ${widget.vouchersData[index].amount}',
                                            CustomizedTheme.sf_bo_W500_1503),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 15.w,
                                        right: 15.w,
                                        bottom: 26.45.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        buildText('Payment Date',
                                            CustomizedTheme.sf_bo_W300_1503),
                                        buildText('21 October, 2021',
                                            CustomizedTheme.sf_bo_W500_1503),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 15.w,
                                        right: 15.w,
                                        bottom: 24.01.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        buildText('Payment Time',
                                            CustomizedTheme.sf_bo_W300_1503),
                                        buildText('09:30 PM',
                                            CustomizedTheme.sf_bo_W500_1503),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      height: 117.h,
                                      width: 117.w,
                                      color: CustomizedTheme.white,
                                      padding: const EdgeInsets.all(11.86),
                                      child: Image.asset(
                                        'assets/icons/ic_QR.png',
                                        fit: BoxFit.fill,
                                      )),
                                  SizedBox(
                                    height: 24.h,
                                  ),
                                ],
                              ),
                            ),
                            canTapOnHeader: true,
                            value: index + 1,
                          )
                        ],
                      );
                    },
                  ),
                ),
                //Button continuew to home
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 50.h, horizontal: 20.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          // width: 154.94,
                          height: 56.8.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11.72.r),
                              // border: Border.all(color: CustomizedTheme.primaryColor,width: .5),
                              color: CustomizedTheme.colorAccent),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: CustomizedTheme.colorAccent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(context,
                                    '/host/homePage', (route) => false);
                              },
                              child: Text("Download / Print Summary",
                                  style: CustomizedTheme.sf_w_W500_19)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Text buildText(String title, TextStyle textStyle) =>
      Text(title, style: textStyle);
}
