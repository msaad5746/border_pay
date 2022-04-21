import 'package:borderpay/app_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../localization/app_localization.dart';
import '../localization/translation_keys.dart';

class CustomAlertDialog {
  static blueDialog({
    required BuildContext context,
    required String title,
    required String message,
    required Function buttonAction,
  }) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => AlertDialog(
              insetPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r)),
              title: Container(
                decoration: BoxDecoration(
                    color: CustomizedTheme.colorAccent,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15.r))),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(_);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 18.h, right: 18.w, bottom: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.clear,
                              color: CustomizedTheme.white,
                              size: 18.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 68.sp,
                      width: 68.sp,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 23.42.h),
                        child: Image.asset('assets/icons/ic_tick.png',
                            fit: BoxFit.fill),
                      ),
                    )
                  ],
                ),
              ),
              titlePadding: const EdgeInsetsDirectional.all(0),
              content: SizedBox(
                width: 0.8.sw,
                height: 0.23.sh,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 19.66.h, bottom: 14.52.h),
                      child: Text(title, style: CustomizedTheme.sf_b_W500_20),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.w, bottom: 20.66.h, right: 20.w),
                      child: Text(
                        message,
                        style: CustomizedTheme.popp_b_w400_1203,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pop(_);
                          buttonAction.call();
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: Size(0.5.sw, 40.h),
                          side: BorderSide(
                              width: 1.0.h,
                              color: CustomizedTheme.primaryColor),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.r)),
                          ),
                        ),
                        child: Text("Continue",
                            style: CustomizedTheme.roboto_p_W400_14))
                  ],
                ),
              ),
            ));
  }

  static greenDialog({
    required BuildContext context,
    required String title,
    required String message,
    required Function buttonAction,
  }) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => AlertDialog(
              insetPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r)),
              title: Container(
                // height: 150.42.h,
                decoration: BoxDecoration(
                    // gradient: CustomizedTheme.dialogGreen,
                    color: CustomizedTheme.greenDialog,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15.r))),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(_);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 18.h, right: 18.w, bottom: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.clear,
                              color: CustomizedTheme.white,
                              size: 18.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      // height: 68.sp,
                      width: 68.w,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 23.42.h),
                        child: Image.asset('assets/icons/ic_tick.png',
                            fit: BoxFit.fill),
                      ),
                    )
                  ],
                ),
              ),
              titlePadding: const EdgeInsetsDirectional.all(0),
              content: SizedBox(
                width: 0.8.sw,
                height: 200.58.h,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 19.66.h, bottom: 14.52.h),
                      child: Text(title, style: CustomizedTheme.sf_b_W500_20),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.w, bottom: 20.66.h, right: 20.w),
                      child: Text(
                        message,
                        style: CustomizedTheme.popp_b_w400_1203,
                        textAlign: TextAlign.center,
                      ),
                    ),

                    OutlinedButton(
                        onPressed: () {
                          Navigator.pop(_);
                          buttonAction.call();
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: Size(0.5.sw, 40.h),
                          side: BorderSide(
                              width: 1.0.w,
                              color: CustomizedTheme.primaryColor),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.r)),
                          ),
                        ),
                        child: Text("Continue",
                            style: CustomizedTheme.roboto_p_W400_14)),
                    // SizedBox(height:20.75.h),
                  ],
                ),
              ),
            ));
  }

  static redDialog({
    required BuildContext context,
    required String title,
    required String message,
    required Function buttonAction,
  }) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              insetPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r)),
              title: Container(
                decoration: BoxDecoration(
                    color: CustomizedTheme.lightRed,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15.r))),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(_);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 18.h, right: 18.w, bottom: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.clear,
                              color: CustomizedTheme.white,
                              size: 18.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 68.sp,
                      width: 68.sp,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 23.42.h),
                        child: Image.asset('assets/icons/ic_clear.png',
                            fit: BoxFit.fill),
                      ),
                    )
                  ],
                ),
              ),
              titlePadding: const EdgeInsetsDirectional.all(0),
              content: SizedBox(
                width: 0.8.sw,
                height: 180.h,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 19.66.h, bottom: 14.52.h),
                      child: Text(title, style: CustomizedTheme.sf_b_W500_20),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.w, bottom: 20.66.h, right: 20.w),
                      child: Text(message,
                          style: CustomizedTheme.popp_b_w400_1203),
                    ),
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pop(_);
                          buttonAction.call();
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: Size(0.5.sw, 40.h),
                          side: BorderSide(
                              width: 1.0, color: CustomizedTheme.primaryColor),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.r)),
                          ),
                        ),
                        child: Text("Continue",
                            style: CustomizedTheme.roboto_p_W400_14))
                  ],
                ),
              ),
            ));
  }

  static goldDialog({
    required BuildContext context,
    required String title,
    required String message,
    required Function buttonAction,
  }) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              insetPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r)),
              title: Container(
                decoration: BoxDecoration(
                    color: CustomizedTheme.gold,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15.r))),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(_);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 18.h, right: 18.w, bottom: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.clear,
                              color: CustomizedTheme.white,
                              size: 18.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 68.sp,
                      width: 68.sp,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 23.42.h),
                        child: Image.asset(
                            'assets/icons/ic_exclamation_white.png',
                            fit: BoxFit.fill),
                      ),
                    )
                  ],
                ),
              ),
              titlePadding: const EdgeInsetsDirectional.all(0),
              content: SizedBox(
                width: 0.8.sw,
                height: 180.h,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 19.66.h, bottom: 14.52.h),
                      child: Text(title, style: CustomizedTheme.sf_b_W500_20),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.w, bottom: 20.66.h, right: 20.w),
                      child: Text(
                        message,
                        style: CustomizedTheme.popp_b_w400_1203,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pop(_);
                          buttonAction.call();
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: Size(0.5.sw, 40.h),
                          side: BorderSide(
                              width: 1.0.w,
                              color: CustomizedTheme.primaryColor),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.r)),
                          ),
                        ),
                        child: Text("Continue",
                            style: CustomizedTheme.roboto_p_W400_14))
                  ],
                ),
              ),
            ));
  }

  static baseDialog({
    required BuildContext context,
    required String title,
    required String message,
    required Function buttonAction,
    bool showCrossIcon = true,
  }) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => AlertDialog(
              insetPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r)),
              title: Container(
                // height: 150.42.h,
                decoration: BoxDecoration(
                    // gradient: CustomizedTheme.dialogGreen,
                    color: CustomizedTheme.primaryBold,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15.r))),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(_);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 18.h, right: 18.w, left: 18.w, bottom: 10.w),
                        child: showCrossIcon
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(_);
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: CustomizedTheme.white,
                                      size: 18.sp,
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox.shrink(),
                      ),
                    ),
                    SizedBox(
                      // height: 68.sp,
                      width: 68.w,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 23.42.h),
                        child: Image.asset('assets/icons/ic_tick.png',
                            fit: BoxFit.fill),
                      ),
                    )
                  ],
                ),
              ),
              titlePadding: const EdgeInsetsDirectional.all(0),
              content: SizedBox(
                width: 0.8.sw,
                height: 200.58.h,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 19.66.h, bottom: 14.52.h),
                      child: Text(title, style: CustomizedTheme.sf_b_W500_20),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.w, bottom: 20.66.h, right: 20.w),
                      child: Text(
                        message,
                        style: CustomizedTheme.popp_b_w400_1203,
                        textAlign: TextAlign.center,
                      ),
                    ),

                    OutlinedButton(
                        onPressed: () {
                          Navigator.pop(_);
                          buttonAction.call();
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: Size(0.5.sw, 40.h),
                          side: BorderSide(
                              width: 1.0.w,
                              color: CustomizedTheme.primaryColor),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.r)),
                          ),
                        ),
                        child: Text(
                            AppLocalizations.of(context)!.translate(
                              TranslationKeys.continueButton,
                            ),
                            style: CustomizedTheme.roboto_p_W400_14)),
                    // SizedBox(height:20.75.h),
                  ],
                ),
              ),
            ));
  }

  static twoActionDialog({
    required BuildContext context,
    required Function buttonAction1,
    required Function buttonAction2,
  }) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => AlertDialog(
              insetPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r)),
              title: Container(
                // height: 150.42.h,
                decoration: BoxDecoration(
                    // gradient: CustomizedTheme.dialogGreen,
                    color: CustomizedTheme.primaryBold,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15.r))),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(_);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 18.h, right: 18.w, left: 18.w, bottom: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.clear,
                              color: CustomizedTheme.white,
                              size: 18.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 23.42.h),
                        child: Image.asset('assets/icons/ic_tick.png',
                            fit: BoxFit.fill),
                      ),
                    )
                  ],
                ),
              ),
              titlePadding: const EdgeInsetsDirectional.all(0),
              content: SizedBox(
                width: 0.8.sw,
                height: 200.58.h,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Column(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pop(_);
                          buttonAction1.call();
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: CustomizedTheme.primaryColor,
                          minimumSize: Size(0.5.sw, 40.h),
                          side: BorderSide(
                              width: 1.0.w,
                              color: CustomizedTheme.primaryColor),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.r)),
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.translate(
                            TranslationKeys.useExistingDetails,
                          ),
                          style: CustomizedTheme.roboto_w_W400_14,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pop(_);
                          buttonAction2.call();
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: Size(0.5.sw, 40.h),
                          backgroundColor: CustomizedTheme.primaryColor,
                          side: BorderSide(
                              width: 1.0.w,
                              color: CustomizedTheme.primaryColor),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.r)),
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.translate(
                            TranslationKeys.buyForDifferentTraveller,
                          ),
                          style: CustomizedTheme.roboto_w_W400_14,
                        ),
                      ),
                      // SizedBox(height:20.75.h),
                    ],
                  ),
                ),
              ),
            ));
  }
}
