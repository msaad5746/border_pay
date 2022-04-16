import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:borderpay/Route_Constants/route_constants.dart';
import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/controllers/countries_controller.dart';
import 'package:borderpay/model/datamodels/bulk_vouchers_model.dart';
import 'package:borderpay/repo/voucher_repo/voucher_repo.dart';
import 'package:borderpay/repo/voucher_repo/voucher_repo_impl.dart';
import 'package:borderpay/screens/download_pdf/download_pdf.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VoucherSuccessPage extends StatefulWidget {
  final Vouchers data;

  const VoucherSuccessPage({Key? key, required this.data}) : super(key: key);

  @override
  _VoucherSuccessPageState createState() => _VoucherSuccessPageState();
}

class _VoucherSuccessPageState extends State<VoucherSuccessPage> {
  CountriesController countriesController = Get.find<CountriesController>();
  bool isLoading = false;
  Uint8List? image;

  @override
  void initState() {
    getVoucherDetails();
    super.initState();
  }

  Future<void> getVoucherDetails() async {
    VoucherRepo repo = VoucherRepoImpl();
    final res = await repo.getQrCodeImage(
      voucherNumber: widget.data.voucherNo,
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
  }

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
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(
                        30.r,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            RouteConstant.hostPage,
                            ModalRoute.withName(
                              RouteConstant.hostPage,
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 50.0.h,
                            left: 20.36.w,
                            right: 20.36.w,
                          ),
                          child: Container(
                            height: 37.26.h,
                            width: 37.26.w,
                            // margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10.11.r,
                              ),
                              color: CustomizedTheme.white,
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              color: CustomizedTheme.colorAccent,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 37.w,
                          right: 37.w,
                          top: 17.43.h,
                        ),
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
                              top: Radius.circular(
                                22.r,
                              ),
                            ),
                            color: CustomizedTheme.white,
                          ),
                          child: Center(
                            child: Text(
                              'Voucher Successful',
                              style: CustomizedTheme.sf_b_W600_2487,
                            ),
                          ),
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
                    height: 60.sp,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'assets/payments/voucher-bg2.png',
                      ),
                    )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Voucher Number : ',
                          style: CustomizedTheme.roboto_w_W400_14,
                        ),
                        SizedBox(
                          width: 100.w,
                          child: Text(
                            'L${widget.data.id.toString()}',
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: CustomizedTheme.roboto_w_W700_14,
                          ),
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                    decoration: BoxDecoration(
                        color: CustomizedTheme.primaryBright,
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(10))),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15.w,
                              right: 15.w,
                              top: 32.h,
                              bottom: 26.45.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildText('Traveller Name',
                                  CustomizedTheme.sf_bo_W300_1503),
                              buildText(
                                  widget.data.user.firstName +
                                      ' ' +
                                      widget.data.user.lastName,
                                  CustomizedTheme.sf_bo_W500_1503),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15.w, right: 15.w, bottom: 26.45.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildText(
                                  'Email ID', CustomizedTheme.sf_bo_W300_1503),
                              buildText(widget.data.user.email,
                                  CustomizedTheme.sf_bo_W500_1503),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15.w, right: 15.w, bottom: 26.45.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildText('Phone Number',
                                  CustomizedTheme.sf_bo_W300_1503),
                              buildText(widget.data.user.mobileNumber,
                                  CustomizedTheme.sf_bo_W500_1503),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15.w, right: 15.w, bottom: 26.45.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildText('Nationality',
                                  CustomizedTheme.sf_bo_W300_1503),
                              buildText(
                                  getNationality(
                                      widget.data.user.nationalityId),
                                  CustomizedTheme.sf_bo_W500_1503),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15.w, right: 15.w, bottom: 26.45.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildText('Emirates ID',
                                  CustomizedTheme.sf_bo_W300_1503),
                              buildText(widget.data.user.emirateId,
                                  CustomizedTheme.sf_bo_W500_1503),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15.w, right: 15.w, bottom: 26.45.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildText('Total Amount',
                                  CustomizedTheme.sf_bo_W300_1503),
                              buildText(widget.data.amount.toString(),
                                  CustomizedTheme.sf_bo_W500_1503),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15.w, right: 15.w, bottom: 26.45.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildText(
                                'Payment Date',
                                CustomizedTheme.sf_bo_W300_1503,
                              ),
                              buildText(
                                getPaymentDate(
                                  widget.data.createdAt,
                                ),
                                CustomizedTheme.sf_bo_W500_1503,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 15.w,
                            right: 15.w,
                            bottom: 24.01.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildText(
                                'Payment Time',
                                CustomizedTheme.sf_bo_W300_1503,
                              ),
                              buildText(
                                getPaymentTime(
                                  widget.data.createdAt,
                                ),
                                CustomizedTheme.sf_bo_W500_1503,
                              ),
                            ],
                          ),
                        ),
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
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 50.h,
                    horizontal: 20.w,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          // width: 154.94,
                          height: 56.8.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              11.72.r,
                            ),
                            color: CustomizedTheme.colorAccent,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: CustomizedTheme.colorAccent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              final pdfFile = await PdfApi.generateCenteredText(
                                widget.data,
                              );
                              setState(() {
                                isLoading = false;
                              });
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                RouteConstant.hostPage,
                                ModalRoute.withName(
                                  RouteConstant.hostPage,
                                ),
                              );
                            },
                            child: isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Download / Print Summary",
                                    style: CustomizedTheme.sf_w_W500_19,
                                  ),
                          ),
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

  String getNationality(int nationalityId) {
    int index = countriesController.countries
        .indexWhere((element) => element.id == nationalityId);
    return countriesController.countries[index].name;
  }

  String getPaymentTime(String dateTime) {
    if (dateTime.isNotEmpty) {
      return dateTime.substring(12, 19);
    }
    return '';
  }

  String getPaymentDate(String dateTime) {
    if (dateTime.isNotEmpty) {
      return dateTime.substring(0, 10);
    }
    return '';
  }
}
