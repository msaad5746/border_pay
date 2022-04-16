import 'dart:convert';
import 'dart:typed_data';

import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/model/datamodels/voucher_model.dart';
import 'package:borderpay/repo/voucher_repo/voucher_repo.dart';
import 'package:borderpay/repo/voucher_repo/voucher_repo_impl.dart';
import 'package:borderpay/widget/blue_backbutton.dart';
import 'package:borderpay/widget/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailedVoucher extends StatefulWidget {
  final VoucherDataModel voucherDetails;

  const DetailedVoucher({required this.voucherDetails, Key? key})
      : super(key: key);

  @override
  _DetailedVoucherState createState() => _DetailedVoucherState();
}

class _DetailedVoucherState extends State<DetailedVoucher> {
  late VoucherDataModel voucher;

  bool isLoading = true;
  bool isError = false;
  Uint8List? image;

  @override
  void initState() {
    getVoucherDetails(1, widget.voucherDetails.id);
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
          ),
        ),
        title: Text(
          "Vouchers",
          style: CustomizedTheme.sf_b_W500_19,
        ),
      ),
      body: isLoading
          ? getLoadingScreen()
          : isError
              ? getErrorScreen()
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.36.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Padding(
                        //   padding: EdgeInsets.only(bottom: 31.h),
                        //   child: Text("Vouchers", style: CustomizedTheme.sf_b_W500_19),
                        // ),
                        Container(
                          width: 1.sw,
                          height: 60.sp,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                AssetImage('assets/payments/voucher-bg2.png'),
                          )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Voucher Number : ',
                                style: CustomizedTheme.roboto_w_W400_14,
                              ),
                              Text(
                                voucher.id.toString(),
                                style: CustomizedTheme.roboto_w_W700_14,
                              ),
                            ],
                          ),
                          // Stack(
                          //   children: [
                          //     Positioned(
                          //       top : 40,
                          //       right: 160,
                          //       child: Text('Voucher 1',style: CustomizedTheme.sf_b_W500_26,)
                          //     ),
                          //     Positioned(
                          //       top : 130,
                          //       right: 160,
                          //       child: Row(
                          //         children: [
                          //           Text('Voucher Number : ',style: CustomizedTheme.roboto_w_W400_14,),
                          //           Text('L103545672',style: CustomizedTheme.roboto_w_W700_14,),
                          //         ],
                          //       ),
                          //     ),
                          //     Positioned(
                          //       top : 110,
                          //       right: 60,
                          //       child: Container(
                          //           height: 50,
                          //           width: 50,
                          //           color: CustomizedTheme.white,
                          //           child: Image.asset('assets/icons/ic_qr_small.png')
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: CustomizedTheme.primaryBright,
                            borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(
                                10,
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 15.w,
                                  right: 15.w,
                                  top: 32.h,
                                  bottom: 26.45.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    buildText(
                                      'Traveller Name',
                                      CustomizedTheme.sf_bo_W300_1503,
                                    ),
                                    buildText(
                                      voucher.user.firstName +
                                          '\t' +
                                          voucher.user.lastName,
                                      CustomizedTheme.sf_bo_W500_1503,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 15.w,
                                  right: 15.w,
                                  bottom: 26.45.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    buildText(
                                      'Email ID',
                                      CustomizedTheme.sf_bo_W300_1503,
                                    ),
                                    buildText(
                                      voucher.user.email,
                                      CustomizedTheme.sf_bo_W500_1503,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 15.w,
                                  right: 15.w,
                                  bottom: 26.45.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    buildText(
                                      'Phone Number',
                                      CustomizedTheme.sf_bo_W300_1503,
                                    ),
                                    buildText(
                                      voucher.user.phoneNumber,
                                      CustomizedTheme.sf_bo_W500_1503,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 15.w,
                                  right: 15.w,
                                  bottom: 26.45.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    buildText(
                                      'Nationality',
                                      CustomizedTheme.sf_bo_W300_1503,
                                    ),
                                    buildText(
                                      voucher.user.nationality?.name ??
                                          'missing',
                                      CustomizedTheme.sf_bo_W500_1503,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 15.w,
                                  right: 15.w,
                                  bottom: 26.45.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    buildText(
                                      'Emirates ID',
                                      CustomizedTheme.sf_bo_W300_1503,
                                    ),
                                    buildText(
                                      voucher.user.emirateId,
                                      CustomizedTheme.sf_bo_W500_1503,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 15.w,
                                  right: 15.w,
                                  bottom: 11.45.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    buildText(
                                      'Total Amount',
                                      CustomizedTheme.sf_bo_W300_1503,
                                    ),
                                    buildText(
                                      'AED ' + voucher.amount.toString(),
                                      CustomizedTheme.sf_bo_W500_1503,
                                    ),
                                  ],
                                ),
                              ),
                              verticalSpacer(16),
                              image != null
                                  ? Image.memory(
                                      image!,
                                    )
                                  : const Icon(
                                      Icons.image,
                                    ),
                              SizedBox(
                                height: 24.h,
                              ),
                            ],
                          ),
                        ),
                        // Spacer(),
                        // Padding(
                        //   padding:  EdgeInsets.symmetric(vertical: 50.h),
                        //   child: Row(
                        //     children: [
                        //       Expanded(
                        //         child: Container(
                        //           // width: 154.94,
                        //           height: 56.8.h,
                        //           decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(11.72.r),
                        //               // border: Border.all(color: CustomizedTheme.primaryColor,width: .5),
                        //               color: CustomizedTheme.colorAccent
                        //           ),
                        //           child: ElevatedButton(
                        //               style: ElevatedButton.styleFrom(
                        //                 primary: CustomizedTheme.colorAccent,
                        //                 elevation: 0,
                        //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                        //               ),
                        //               onPressed: () {
                        //                 Navigator.pushNamed(context, '/PaymentSummary');
                        //               },
                        //               child: Text("Continue",style: CustomizedTheme.sf_w_W500_19)),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
    );
  }


  Future<void> getVoucherDetails(int userId, int voucherId) async {
    VoucherRepo repo = VoucherRepoImpl();
    var response = await repo.getVoucherDetails(userId, voucherId);
    if (response != null) {
      voucher = response;
      final res = await repo.getQrCodeImage(
        voucherNumber: widget.voucherDetails.voucherNumber,
      );
      if (res != null) {
        List<String> images = res.toString().split(',');
        image = base64.decode(images[1]);

        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      setState(
        () {
          isError = true;
        },
      );
    }
  }

  Widget getLoadingScreen() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget getErrorScreen() {
    return const Center(
      child: Text(
        'No data found',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Text buildText(String title, TextStyle textStyle) =>
      Text(title, style: textStyle);
}
