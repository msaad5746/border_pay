
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomizedTheme{
  //Colors
  static Color primaryColor = const Color(0xff147F8D);
  static Color primaryBold = const Color(0xff006E7D);
  static Color primaryBright = const Color(0xffF0F0F0);
  static Color colorAccent = const Color(0xff04ACDD);
  static Color voucherDark = const Color(0xff2F4858);
  static Color voucherPaid = const Color(0xff1FA91C);
  static Color greenDialog = const Color(0xff2EEE86);
  static Color voucherUnpaid = const Color(0xffD93434);
  static Color lightRed = const Color(0xffFF5B5B);
  static Color gold = const Color(0xffDEAB2D);
  static Color colorAccentBlack = const Color(0xff1E1E1E);
  static Color primaryButton = const Color(0xff147F8D);
  static Color primaryLight = const Color(0x26FFFFFF);
  static Color primaryLine = const Color(0xffC4C4C4);
  static Color white = const Color(0xffffffff);
  static Color whiteButton = const Color(0xffffffff);
  static Gradient dialogBG = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [const Color(0xffDEAB2D), const Color(0xffADF6D27A),const Color(0x00FFFFFF).withOpacity(1)]);

  static Gradient dialogGreen = LinearGradient(
      begin: Alignment.center,
      end: Alignment.bottomCenter,
      colors: [const Color(0xff2EEE86), const Color(0xffFFFFFF).withOpacity(0.1)]);

  //TextStyle
  static TextStyle w_W500_2622 =TextStyle(color: white,fontWeight: FontWeight.w500,fontSize: 26.22.sp, fontFamily: 'roboto');
  static TextStyle w_W300_12 =TextStyle(color: white,fontWeight: FontWeight.w300,fontSize: 12.sp, fontFamily: 'roboto');
  static TextStyle w_W500_15 =TextStyle(color: white,fontWeight: FontWeight.w500,fontSize: 15.sp, fontFamily: 'roboto');
  static TextStyle w_W500_17 =TextStyle(color: white,fontWeight: FontWeight.w500,fontSize: 17.sp, fontFamily: 'roboto');
  static TextStyle w_W500_2617 =TextStyle(color: white,fontWeight: FontWeight.w500,fontSize: 26.17.sp, fontFamily: 'roboto');
  static TextStyle p_W500_19 =TextStyle(color: primaryButton,fontWeight: FontWeight.w500,fontSize: 19.sp, fontFamily: 'roboto');
  static TextStyle poppins_dark_W500_19 =TextStyle(color: primaryButton,fontWeight: FontWeight.w500,fontSize: 19.sp, fontFamily: 'roboto');
  static TextStyle w_W500_19 =TextStyle(color: whiteButton,fontWeight: FontWeight.w500,fontSize: 19.sp, fontFamily: 'roboto');
  static TextStyle sf_b_W400_1237 =TextStyle(color: colorAccentBlack,fontWeight: FontWeight.w400,fontSize: 12.37.sp, fontFamily: 'roboto');
  static TextStyle sf_b_W400_1137 =TextStyle(color: colorAccent,fontWeight: FontWeight.w700,fontSize: 12.37.sp, fontFamily: 'roboto');
  static TextStyle b_W400_16 =TextStyle(color: colorAccentBlack,fontWeight: FontWeight.w400,fontSize: 16.sp, fontFamily: 'roboto');
  static TextStyle sf_b_W400_15 =TextStyle(color: colorAccentBlack,fontWeight: FontWeight.w400,fontSize: 15.sp, fontFamily: 'roboto');
  static TextStyle sf_w_W500_23 =TextStyle(color: white,fontWeight: FontWeight.w500,fontSize: 23.sp, fontFamily: 'roboto');
  static TextStyle popp_b_W500_23 =TextStyle(color: primaryBold,fontWeight: FontWeight.w500,fontSize: 23.sp, fontFamily: 'roboto');
  static TextStyle sf_b_W300_13 =TextStyle(color: voucherDark,fontWeight: FontWeight.w300,fontSize: 13.sp, fontFamily: 'roboto');
  static TextStyle r_b_W300_13 =TextStyle(color: primaryColor,fontWeight: FontWeight.w400,fontSize: 13.28.sp, fontFamily: 'roboto');
  static TextStyle sf_b_W300_13Paid =TextStyle(color: voucherPaid,fontWeight: FontWeight.w300,fontSize: 13.sp, fontFamily: 'roboto');
  static TextStyle sf_b_W300_13Unpaid =TextStyle(color: voucherUnpaid,fontWeight: FontWeight.w300,fontSize: 13.sp, fontFamily: 'roboto');
  static TextStyle sf_pb_W300_13 =TextStyle(color: primaryBold,fontWeight: FontWeight.w300,fontSize: 13.sp, fontFamily: 'roboto');
  static TextStyle sf_pb_W700_13 =TextStyle(color: primaryBold,fontWeight: FontWeight.w700,fontSize: 13.sp, fontFamily: 'roboto');
  static TextStyle sf_b_W300_14 =TextStyle(color: primaryBold,fontWeight: FontWeight.w300,fontSize: 14.sp, fontFamily: 'roboto');
  static TextStyle sf_w_W300_14 =TextStyle(color: white,fontWeight: FontWeight.w300,fontSize: 14.sp, fontFamily: 'roboto');
  static TextStyle sf_w_W400_15 =TextStyle(color: white,fontWeight: FontWeight.w400,fontSize: 15.sp, fontFamily: 'roboto');
  static TextStyle sf_bo_W400_15 =TextStyle(color: primaryBold,fontWeight: FontWeight.w400,fontSize: 15.sp, fontFamily: 'roboto');
  static TextStyle sf_bo_W300_1503 =TextStyle(color: primaryBold,fontWeight: FontWeight.w300,fontSize: 15.03.sp, fontFamily: 'roboto');
  static TextStyle sf_bo_W500_1503 =TextStyle(color: primaryBold,fontWeight: FontWeight.w500,fontSize: 15.03.sp, fontFamily: 'roboto');
  static TextStyle sf_bo_W400_1592 =TextStyle(color: primaryColor,fontWeight: FontWeight.w400,fontSize: 15.92.sp, fontFamily: 'roboto');
  static TextStyle sf_w_W400_1592 =TextStyle(color: white,fontWeight: FontWeight.w400,fontSize: 15.92.sp, fontFamily: 'roboto');
  static TextStyle sf_b_W400_176 =TextStyle(color: primaryBold,fontWeight: FontWeight.w400,fontSize: 17.6.sp, fontFamily: 'roboto');
  static TextStyle sf_b_W500_17 =TextStyle(color: primaryBold,fontWeight: FontWeight.w500,fontSize: 17.sp, fontFamily: 'roboto');
  static TextStyle sf_b_W700_17 =TextStyle(color: primaryBold,fontWeight: FontWeight.w700,fontSize: 17.sp, fontFamily: 'roboto');
  static TextStyle sf_b_W500_18 =TextStyle(color: primaryBold,fontWeight: FontWeight.w500,fontSize: 18.sp, fontFamily: 'roboto');
  static TextStyle sf_b_W400_17 =TextStyle(color: primaryBold,fontWeight: FontWeight.w400,fontSize: 17.sp, fontFamily: 'roboto');
  static TextStyle sf_w_W400_17 =TextStyle(color: white,fontWeight: FontWeight.w400,fontSize: 17.sp, fontFamily: 'roboto');
  static TextStyle sf_w_W500_17 =TextStyle(color: white,fontWeight: FontWeight.w500,fontSize: 17.sp, fontFamily: 'roboto');
  static TextStyle sf_b_W500_19 =TextStyle(color: primaryBold,fontWeight: FontWeight.w500,fontSize: 19.sp, fontFamily: 'roboto');
  static TextStyle sf_w_W500_19 =TextStyle(color: white,fontWeight: FontWeight.w500,fontSize: 19.sp, fontFamily: 'roboto');
  static TextStyle sf_b_W500_20 =TextStyle(color: primaryBold,fontWeight: FontWeight.w500,fontSize: 20.sp, fontFamily: 'roboto');
  static TextStyle sf_w_W400_20 =TextStyle(color: white,fontWeight: FontWeight.w400,fontSize: 20.sp, fontFamily: 'roboto');
  static TextStyle roboto_w_W400_20 =TextStyle(color: white,fontWeight: FontWeight.w400,fontSize: 20.sp, fontFamily: 'roboto');
  static TextStyle roboto_w_W700_20 =TextStyle(color: white,fontWeight: FontWeight.w700,fontSize: 20.sp, fontFamily: 'roboto');
  static TextStyle sf_b_W400_2347 =TextStyle(color: primaryBold,fontWeight: FontWeight.w500,fontSize: 23.47.sp, fontFamily: 'roboto');
  static TextStyle sf_b_W600_2487 =TextStyle(color: primaryBold,fontWeight: FontWeight.w700,fontSize: 24.87.sp, fontFamily: 'roboto');
  static TextStyle sf_b_W500_26 =TextStyle(color: primaryBold,fontWeight: FontWeight.w500,fontSize: 26.sp, fontFamily: 'roboto');
  static TextStyle title_p_W500_21 =TextStyle(color: primaryButton,fontWeight: FontWeight.w500,fontSize: 21.sp, fontFamily: 'roboto');
  static TextStyle title_sf_W500_21 =TextStyle(color: primaryButton,fontWeight: FontWeight.w500,fontSize: 21.sp, fontFamily: 'roboto');

  static TextStyle popp_b_w400_1203 =TextStyle(color: primaryBold,fontWeight: FontWeight.w400,fontSize: 12.03.sp, fontFamily: 'roboto');
  static TextStyle b_W400_12 =TextStyle(color: colorAccentBlack,fontWeight: FontWeight.w400, fontFamily: 'roboto');
  static TextStyle roboto_l_W400_14 =TextStyle(color: primaryLine,fontWeight: FontWeight.w400,fontSize: 14.sp, fontFamily: 'roboto');
  static TextStyle roboto_l_W400_10 =TextStyle(color: primaryBold,fontWeight: FontWeight.w400,fontSize: 10.sp, fontFamily: 'roboto');
  static TextStyle roboto_w_W400_14 =TextStyle(color: white,fontWeight: FontWeight.w400,fontSize: 14.sp, fontFamily: 'roboto');
  static TextStyle roboto_w_W500_14 =TextStyle(color: white,fontWeight: FontWeight.w500,fontSize: 14.sp, fontFamily: 'roboto');
  static TextStyle roboto_w_W700_14 =TextStyle(color: white,fontWeight: FontWeight.w700,fontSize: 14.sp, fontFamily: 'roboto');
  static TextStyle roboto_p_W400_14 =TextStyle(color: primaryBold,fontWeight: FontWeight.w400,fontSize: 14.sp, fontFamily: 'roboto');

  static TextStyle roboto_w_W500_16 =TextStyle(color: primaryBold,fontWeight: FontWeight.w500,fontSize: 16.sp, fontFamily: 'roboto');
  static TextStyle roboto_w_W500_17 =TextStyle(color: colorAccentBlack,fontWeight: FontWeight.w500,fontSize: 17.sp, fontFamily: 'roboto');





}