import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/controllers/countries_controller.dart';
import 'package:borderpay/model/datamodels/bulk_vouchers_model.dart';
import 'package:borderpay/widget/blue_backbutton.dart';
import 'package:borderpay/widget/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../localization/app_localization.dart';
import '../../localization/translation_keys.dart';

class SingleVoucher extends StatefulWidget {
  final List<Vouchers> voucher;

  const SingleVoucher({Key? key, required this.voucher}) : super(key: key);

  @override
  _SingleVoucherState createState() => _SingleVoucherState();
}

class _SingleVoucherState extends State<SingleVoucher> {
  CountriesController countriesController = Get.find<CountriesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Row(
          children: [
            SizedBox(width: 20.w),
            Center(
                child: BlueBackButton(
              context: context,
            )),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.36.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 31.h),
                child: Text(
                    AppLocalizations.of(context)!.translate(
                  TranslationKeys.vouchers,
                ), style: CustomizedTheme.sf_b_W500_19),
              ),
              Container(
                width: 1.sw,
                height: 60.sp,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/payments/voucher-bg2.png'),
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.translate(
                        TranslationKeys.voucher_Number,
                      ),
                      style: CustomizedTheme.roboto_w_W400_14,
                    ),
                    Text(
                      widget.voucher[0].voucherNo,
                      style: CustomizedTheme.roboto_w_W700_14,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: CustomizedTheme.primaryBright,
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(10))),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15.w, right: 15.w, top: 32.h, bottom: 26.45.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildText(
                              AppLocalizations.of(context)!.translate(
                                TranslationKeys.travellerName,
                              ),
                              CustomizedTheme.sf_bo_W300_1503),
                          buildText(
                              '${widget.voucher[0].user.firstName} ${widget.voucher[0].user.lastName}',
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
                              AppLocalizations.of(context)!.translate(
                                TranslationKeys.emailID,
                              ), CustomizedTheme.sf_bo_W300_1503),
                          buildText(widget.voucher[0].user.email,
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
                              AppLocalizations.of(context)!.translate(
                                TranslationKeys.phoneNumber,
                              ), CustomizedTheme.sf_bo_W300_1503),
                          buildText(widget.voucher[0].user.mobileNumber,
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
                              AppLocalizations.of(context)!.translate(
                                TranslationKeys.nationality,
                              ), CustomizedTheme.sf_bo_W300_1503),
                          buildText(
                              getNationality(
                                  widget.voucher[0].user.nationalityId),
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
                              AppLocalizations.of(context)!.translate(
                                TranslationKeys.emiratesID,
                              ), CustomizedTheme.sf_bo_W300_1503),
                          buildText(widget.voucher[0].user.emirateId,
                              CustomizedTheme.sf_bo_W500_1503),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15.w, right: 15.w, bottom: 11.45.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildText(
                              AppLocalizations.of(context)!.translate(
                                TranslationKeys.totalAmount,
                              ), CustomizedTheme.sf_bo_W300_1503),
                          buildText('AED ${widget.voucher[0].amount}',
                              CustomizedTheme.sf_bo_W500_1503),
                        ],
                      ),
                    ),
                    verticalSpacer(100),
                  ],
                ),
              ),
              // Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50.h),
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
                                borderRadius: BorderRadius.circular(10.r)),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/PaymentSummary',
                                arguments: widget.voucher);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.translate(
                              TranslationKeys.continueButton,
                            ),
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
      ),
    );
  }

  Text buildText(String title, TextStyle textStyle) =>
      Text(title, style: textStyle);

  String getNationality(int nationalityId) {
    int index = countriesController.countries
        .indexWhere((element) => element.id == nationalityId);
    return countriesController.countries[index].name;
  }

  String getName() {
    String name =
        '${widget.voucher[0].user.firstName} ${widget.voucher[0].user.lastName}';
    return name;
  }
}
