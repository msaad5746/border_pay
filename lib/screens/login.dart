import 'package:borderpay/Route_Constants/route_constants.dart';
import 'package:borderpay/Utils/sharedPrefKeys.dart';
import 'package:borderpay/Utils/sharedpref.dart';
import 'package:borderpay/Utils/utils.dart';
import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/auth/local_auth_api.dart';
import 'package:borderpay/model/datamodels/login_user_model.dart';
import 'package:borderpay/repo/auth_repo/auth_repo.dart';
import 'package:borderpay/repo/auth_repo/auth_repo_impl.dart';
import 'package:borderpay/widget/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'custom_intl_phone_field.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final UserDataController userDataController = Get.put(UserDataController());
  AuthRepo networkHandler = AuthRepoImpl();
  MySharedPreferences storage = MySharedPreferences.instance;

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;
  bool isLoading = false;
  bool isBioMatric = false;
  String cuntryCode = '+1';
  bool isPhoneNumberFilled = true;
  bool isPasswordFilled = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    isPasswordFilled = true;
    isPhoneNumberFilled = true;
    isBioMatricEnable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 1.sh,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.36.w,
              ),
              child: Form(
                key: Utils.loginPageFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpacer(30),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 37.26.h,
                            width: 37.26.w,
                            // margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10.11.r,
                              ),
                              color: CustomizedTheme.colorAccent,
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              color: CustomizedTheme.white,
                            ),
                          ),
                        ),
                        horizontalSpacer(16),
                        Text(
                          "Sign in",
                          style: CustomizedTheme.title_p_W500_21,
                        ),
                      ],
                    ),
                    verticalSpacer(16),
                    SizedBox(
                      height: 68.54.h,
                    ),
                    CustomIntlPhoneField(
                      flagDecoration: BoxDecoration(
                        color: CustomizedTheme.primaryBold,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      initialCountryCode: 'US',
                      controller: phoneController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              10.0.r,
                            ),
                          ),
                          borderSide: BorderSide(
                            color: CustomizedTheme.colorAccent,
                            width: .01.w,
                          ),
                        ),
                        label: const Text("Phone Number"),
                        labelStyle: TextStyle(
                          color: CustomizedTheme.colorAccent,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              10.0.r,
                            ),
                          ),
                          borderSide: BorderSide(
                            color: Colors.lightBlue,
                            width: 1.w,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              10.0.r,
                            ),
                          ),
                          borderSide: BorderSide(
                            color: Colors.lightBlue,
                            width: 1.w,
                          ),
                        ),
                      ),
                      onChanged: (phone) {},
                      onCountryChanged: (country) {
                        setState(
                          () {
                            cuntryCode = "+" + country.dialCode;
                          },
                        );
                      },
                      dropdownIconPosition: IconPosition.trailing,
                      flagsButtonPadding:
                          const EdgeInsets.symmetric(vertical: 6),
                    ),

                    SizedBox(
                      height: 15.53.h,
                    ),
                    isPhoneNumberFilled
                        ? const SizedBox.shrink()
                        : Text(
                            'Phone number field is empty',
                            style: CustomizedTheme.b_W400_12.copyWith(
                              fontWeight: FontWeight.w400,
                              color: CustomizedTheme.voucherUnpaid,
                            ),
                          ),
                    verticalSpacer(16),
                    TextFormField(
                      controller: passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 24.44.w,
                          right: 34.47.w,
                          bottom: 12.3.h,
                          top: 15.03.h,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              10.0.r,
                            ),
                          ),
                          borderSide: BorderSide(
                            color: CustomizedTheme.colorAccent,
                            width: .01.w,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              10.0.r,
                            ),
                          ),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.w,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              10.0.r,
                            ),
                          ),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.w,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: SvgPicture.asset(
                            'assets/svg/eye.svg',
                            color: _obscureText
                                ? Colors.black
                                : Colors.black.withOpacity(
                                    .3,
                                  ),
                          ),
                          onPressed: () {
                            _toggle();
                          },
                        ),
                        labelText: "Password",
                        labelStyle: CustomizedTheme.b_W400_12,
                      ),
                      // controller: passwordController,
                      onEditingComplete: () {
                        isPasswordFilled = true;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return null;
                      },
                    ),
                    verticalSpacer(12),
                    isPasswordFilled
                        ? const SizedBox.shrink()
                        : Text(
                            'Password field is empty',
                            style: CustomizedTheme.b_W400_12.copyWith(
                              fontWeight: FontWeight.w400,
                              color: CustomizedTheme.voucherUnpaid,
                            ),
                          ),
                    verticalSpacer(12),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteConstant.forgetPhone);
                      },
                      child: Text(
                        'Forgot password?',
                        style: CustomizedTheme.sf_b_W400_1137.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 100.16.h),
                    isBioMatric
                        ? Center(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 28.52.h),
                              child: GestureDetector(
                                onTap: () async {
                                  if (!isLoading) {
                                    bool isAuthenticated = await LocalAuthApi
                                        .authenticateWithBiometrics();
                                    if (isAuthenticated) {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      String phone = storage.getStringValue(
                                          SharedPrefKeys.userPhone);
                                      String password = storage.getStringValue(
                                          SharedPrefKeys.userPassword);
                                      await userLogin(
                                        phone,
                                        password,
                                      );
                                    }
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 46.h,
                                      width: 46.h,
                                      decoration: BoxDecoration(
                                        color: CustomizedTheme.colorAccent,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: SvgPicture.asset(
                                          'assets/svg/ic_touchid.svg',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    SizedBox(
                                      width: 150.w,
                                      child: Text(
                                        'Login with Touch ID',
                                        style: CustomizedTheme.roboto_w_W500_17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    // isBioMatric
                    //     ? Center(
                    //         child: Padding(
                    //           padding: EdgeInsets.only(bottom: 40.87.h),
                    //           child: GestureDetector(
                    //             onTap: () async {
                    //               if (!isLoading) {
                    //                 bool isAuthenticated = await LocalAuthApi
                    //                     .authenticateWithBiometrics();
                    //                 if (isAuthenticated) {
                    //                   setState(() {
                    //                     isLoading = true;
                    //                   });
                    //                   String email = storage.getStringValue(
                    //                       SharedPrefKeys.userEmail);
                    //                   String password = storage.getStringValue(
                    //                       SharedPrefKeys.userPassword);
                    //                   await userLogin(
                    //                     email,
                    //                     password,
                    //                   );
                    //                 }
                    //               }
                    //             },
                    //             child: Row(
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               crossAxisAlignment: CrossAxisAlignment.center,
                    //               children: [
                    //                 Container(
                    //                   height: 46.h,
                    //                   width: 46.h,
                    //                   decoration: BoxDecoration(
                    //                     color: CustomizedTheme.colorAccent,
                    //                     borderRadius: BorderRadius.circular(10),
                    //                   ),
                    //                   child: Padding(
                    //                     padding: const EdgeInsets.all(6.0),
                    //                     child: SvgPicture.asset(
                    //                      'assets/svg/ic_faceid.svg',
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 SizedBox(
                    //                   width: 12.w,
                    //                 ),
                    //                 SizedBox(
                    //                   width: 150.w,
                    //                   child: Text(
                    //                     'Login with Face ID',
                    //                     style: CustomizedTheme.roboto_w_W500_17,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       )
                    //     : const SizedBox.shrink(),
                    SizedBox(height: 50.16.h),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 61.07.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.r),
                              color: CustomizedTheme.colorAccent,
                            ),
                            child: TextButton(
                              onPressed: () async {
                                if (!isLoading) {
                                  if (phoneController.text.isNotEmpty) {
                                    if (passwordController.text.isNotEmpty) {
                                      isPhoneNumberFilled = true;
                                      isPasswordFilled = true;
                                      setState(() {
                                        isLoading = true;
                                      });
                                      await userLogin(
                                        cuntryCode + phoneController.text,
                                        passwordController.text,
                                      );
                                    } else {
                                      isPhoneNumberFilled = true;
                                      isPasswordFilled = false;
                                    }
                                  } else {
                                    isPhoneNumberFilled = false;
                                  }
                                }
                                setState(() {});
                              },
                              child: isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      "Sign in",
                                      style: CustomizedTheme.w_W500_19,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  isBioMatricEnable() {
    isBioMatric = storage.getBoolValue(SharedPrefKeys.isBioMatric);
  }

  Future<void> userLogin(String phone, String password) async {
    Map<String, String> loginData = {
      "mobileNumber": phone,
      "password": password,
    };
    var res = await networkHandler.loginUser(loginData);
    if (res != null) {
      LoginUserModel loginModel = LoginUserModel.fromJson(res);
      if (loginModel.status) {
        phoneController.clear();
        passwordController.clear();
      }
      setState(() {
        isLoading = false;
      });
      storage.setStringValue(SharedPrefKeys.userPhone, phone);
      storage.setStringValue(SharedPrefKeys.userPassword, password);
      storage.setStringValue(
        SharedPrefKeys.userId,
        loginModel.data.userId.toString(),
      );
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteConstant.hostPage,
        (Route<dynamic> route) => false,
      );
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Login Failed"),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        backgroundColor: CustomizedTheme.voucherUnpaid,
      ));
    }
  }
}
