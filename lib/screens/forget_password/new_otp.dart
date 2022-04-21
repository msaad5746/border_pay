import 'package:borderpay/Route_Constants/route_constants.dart';
import 'package:borderpay/Utils/sharedpref.dart';
import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/model/datamodels/login_user_model.dart';
import 'package:borderpay/model/datamodels/verify_user_model.dart';
import 'package:borderpay/repo/auth_repo/auth_repo.dart';
import 'package:borderpay/repo/auth_repo/auth_repo_impl.dart';
import 'package:borderpay/widget/custom_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgetOtpPage extends StatefulWidget {
  String phone;

  ForgetOtpPage({
    Key? key,
    required this.phone,
  }) : super(key: key);

  @override
  _ForgetOtpPageState createState() => _ForgetOtpPageState();
}

class _ForgetOtpPageState extends State<ForgetOtpPage> {
  MySharedPreferences storage = MySharedPreferences.instance;
  AuthRepo networkHandler = AuthRepoImpl();
  int _firstDigit = 010;
  int _secondDigit = 010;
  int _thirdDigit = 010;
  int _fourthDigit = 010;
  int _fifthDigit = 010;
  int _sixthDigit = 010;
  int checker = 010;

  var OtpCode = "no";
  bool isLoading = false;

  //Buttons
  Widget buildButton(int buttonText) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_firstDigit == checker) {
            _firstDigit = buttonText;
          } else if (_secondDigit == checker) {
            _secondDigit = buttonText;
          } else if (_thirdDigit == checker) {
            _thirdDigit = buttonText;
          } else if (_fourthDigit == checker) {
            _fourthDigit = buttonText;
          } else if (_fifthDigit == checker) {
            _fifthDigit = buttonText;
          } else if (_sixthDigit == checker) {
            _sixthDigit = buttonText;

            var otp = _firstDigit.toString() +
                _secondDigit.toString() +
                _thirdDigit.toString() +
                _fourthDigit.toString() +
                _fifthDigit.toString() +
                _sixthDigit.toString();
            setState(() {
              OtpCode = otp;
            });
          }
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 5.h),
        child: Container(
          height: 44.86.h,
          // width: 92.96.w,
          decoration: BoxDecoration(
              color: CustomizedTheme.primaryBold,
              borderRadius: BorderRadius.circular(6.93.r),
              border: Border.all(color: CustomizedTheme.white)),
          child: Center(
              child: Text(
            buttonText.toString(),
            style: CustomizedTheme.sf_w_W500_23,
          )),
        ),
      ),
    );
  }

  //
  //Fields
  Widget _otpTextField(int digit) {
    return Container(
      width: 35.0.w,
      height: 45.0.h,
      alignment: Alignment.center,
      child: digit != checker
          ? Text(
              digit != checker ? digit.toString() : "",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0.sp,
                color: CustomizedTheme.primaryColor,
              ),
            )
          : ClipOval(
              child: Container(
                width: 13.w,
                height: 13.h,
                color: CustomizedTheme.primaryColor,
              ),
            ),
      decoration: BoxDecoration(
//            color: Colors.grey.withOpacity(0.4),
        border: Border(
          bottom: BorderSide(
            width: 2.0.w,
            color: CustomizedTheme.primaryColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leadingWidth: 33.73,
        leading: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                height: 33.73.h,
                width: 33.73.w,
                // margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.16.r),
                    color: CustomizedTheme.colorAccent),
                child: Icon(Icons.arrow_back, color: CustomizedTheme.white)),
          ),
        ),
        title: Text("Confirm OTP", style: CustomizedTheme.title_p_W500_21),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 29.92.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.36.w),
            child:
                Text("Enter OTP", style: CustomizedTheme.poppins_dark_W500_19),
          ),
          const SizedBox(height: 7.76),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.36.w),
            child: Text(
              "A 6 digit code has been sent to your mobile number ${widget.phone}",
              style: CustomizedTheme.sf_b_W400_15,
            ),
          ),
          SizedBox(height: 112.6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _otpTextField(_firstDigit),
              _otpTextField(_secondDigit),
              _otpTextField(_thirdDigit),
              _otpTextField(_fourthDigit),
              _otpTextField(_fifthDigit),
              _otpTextField(_sixthDigit),
            ],
          ),
          const Spacer(),
          Container(
            height: 351.87.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: CustomizedTheme.primaryBold,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                  50.0.r,
                ),
              ),
            ),
            child: Stack(
              children: [
                otpPage(),
                isLoading
                    ? Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          )
        ],
      ),
    );
  }

  otpPage() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 19.36.w,
        vertical: 76.57.h,
      ),
      child: Table(
        // defaultColumnWidth: IntrinsicColumnWidth(),
        columnWidths: {
          0: FlexColumnWidth(92.96.w),
          1: FlexColumnWidth(92.96.w),
          2: FlexColumnWidth(92.96.w),
        },
        children: [
          TableRow(children: [
            buildButton(1),
            buildButton(2),
            buildButton(3),
          ]),
          TableRow(children: [
            buildButton(4),
            buildButton(5),
            buildButton(6),
          ]),
          TableRow(children: [
            buildButton(7),
            buildButton(8),
            buildButton(9),
          ]),
          TableRow(children: [
            GestureDetector(
              onTap: () {
                setState(
                  () {
                    if (_sixthDigit != checker) {
                      _sixthDigit = checker;
                    } else if (_fifthDigit != checker) {
                      _fifthDigit = checker;
                    } else if (_fourthDigit != checker) {
                      _fourthDigit = checker;
                    } else if (_thirdDigit != checker) {
                      _thirdDigit = checker;
                    } else if (_secondDigit != checker) {
                      _secondDigit = checker;
                    } else if (_firstDigit != checker) {
                      _firstDigit = checker;
                    }
                    OtpCode = "no";
                  },
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.0.w,
                  vertical: 5.h,
                ),
                child: Container(
                  height: 44.86.h,
                  // width: 92.96,
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  decoration: BoxDecoration(
                    color: CustomizedTheme.white,
                    borderRadius: BorderRadius.circular(6.93.r),
                    border: Border.all(
                      color: CustomizedTheme.white,
                    ),
                  ),
                  child: SvgPicture.asset(
                    'assets/svg/ic_backspace.svg',
                  ),
                ),
              ),
            ),
            buildButton(0),
            OtpCode == "no"
                ? Container()
                : GestureDetector(
                    onTap: () async {
                      if (widget.phone.isNotEmpty) {
                        Navigator.pushNamed(
                          context,
                          RouteConstant.forgetNewPassword,
                          arguments: [widget.phone, OtpCode],
                        );
                        // setState(() {
                        //   isLoading = true;
                        // });
                        // Map<String, String> loginData = {
                        //   "mobileNumber": widget.phone,
                        //   "otp": OtpCode,
                        // };
                        // var res = await networkHandler.verifyOtp(loginData);
                        // if (res != null && res['data']['acknowledged']) {
                        //   setState(() {
                        //     isLoading = false;
                        //   });
                        //   Navigator.pushNamed(
                        //     context,
                        //     RouteConstant.forgetNewPassword,
                        //     arguments: [widget.phone, OtpCode],
                        //   );
                        // } else {
                        //   setState(() {
                        //     isLoading = false;
                        //   });
                        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //     content: const Text("Invalid OTP!"),
                        //     behavior: SnackBarBehavior.floating,
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(24),
                        //     ),
                        //     backgroundColor: CustomizedTheme.voucherUnpaid,
                        //   ));
                        // }
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.0.w, vertical: 5.h),
                      child: Container(
                        height: 44.86.h,
                        // width: 92.96,
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                        decoration: BoxDecoration(
                          color: CustomizedTheme.white,
                          borderRadius: BorderRadius.circular(6.93.r),
                          border: Border.all(color: CustomizedTheme.white),
                        ),
                        child: SvgPicture.asset('assets/svg/ic_polygon.svg'),
                      ),
                    ),
                  ),
          ]),
        ],
      ),
    );
  }
}
