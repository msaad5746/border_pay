import 'package:borderpay/Route_Constants/route_constants.dart';
import 'package:borderpay/Utils/sharedPrefKeys.dart';
import 'package:borderpay/Utils/sharedpref.dart';
import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/localization/app_localization.dart';
import 'package:borderpay/localization/translation_keys.dart';
import 'package:borderpay/model/datamodels/login_user_model.dart';
import 'package:borderpay/repo/auth_repo/auth_repo.dart';
import 'package:borderpay/repo/auth_repo/auth_repo_impl.dart';
import 'package:borderpay/widget/custom_alert.dart';
import 'package:borderpay/widget/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewPasswordPage extends StatefulWidget {
  final String phone;
  final String otpCode;

  const NewPasswordPage({Key? key, required this.phone, required this.otpCode})
      : super(key: key);

  @override
  _NewPasswordPageState createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  // final UserDataController userDataController = Get.put(UserDataController());
  AuthRepo networkHandler = AuthRepoImpl();
  MySharedPreferences storage = MySharedPreferences.instance;

  TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;
  bool isLoading = false;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
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
                        AppLocalizations.of(context)!.translate(
                          TranslationKeys.newPassword,
                        ),
                        style: CustomizedTheme.title_p_W500_21,
                      ),
                    ],
                  ),
                  verticalSpacer(16),
                  SizedBox(
                    height: 68.54.h,
                  ),
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
                      labelText: AppLocalizations.of(context)!.translate(
                        TranslationKeys.newPassword,
                      ),
                      labelStyle: CustomizedTheme.b_W400_12,
                    ),
                    // controller: passwordController,
                    onEditingComplete: () {},
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return AppLocalizations.of(context)!.translate(
                          TranslationKeys.pleaseEnterNewPassword,
                        );
                      }
                      // Check if the entered email has the right format
                      if (value.trim().length < 10) {
                        return AppLocalizations.of(context)!.translate(
                          TranslationKeys.passwordShouldContain10Characters,
                        );
                      }
                      // Return null if the entered email is valid
                      return null;
                    },
                  ),
                  verticalSpacer(12),
                  SizedBox(height: 100.16.h),
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
                                setState(() {
                                  isLoading = true;
                                });
                                Map<String, String> loginData = {
                                  "mobileNumber": widget.phone,
                                  "password": passwordController.text,
                                };
                                Map<String, String> resetData = {
                                  "mobileNumber": widget.phone,
                                  "code": widget.otpCode,
                                  "newPassword": passwordController.text,
                                };
                                var res1 = await networkHandler
                                    .resetPassword(resetData);
                                if (res1 != null) {
                                  var res =
                                      await networkHandler.loginUser(loginData);
                                  if (res != null) {
                                    storage.setStringValue(
                                        SharedPrefKeys.userPhone, widget.phone);
                                    storage.setStringValue(
                                        SharedPrefKeys.userPassword,
                                        passwordController.text);
                                    setState(() {
                                      isLoading = false;
                                    });
                                    CustomAlertDialog.baseDialog(
                                        context: context,
                                        title: AppLocalizations.of(context)!
                                            .translate(
                                          TranslationKeys.successfullyRestored,
                                        ),
                                        message: AppLocalizations.of(context)!
                                            .translate(
                                          TranslationKeys
                                              .yourPasswordHasBeenSuccessfullyRestored,
                                        ),
                                        buttonAction: () {
                                          Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              RouteConstant.hostPage,
                                              (Route<dynamic> route) => false);
                                        });
                                  }
                                } else {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      AppLocalizations.of(context)!.translate(
                                        TranslationKeys.somethingWentWrong,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    backgroundColor:
                                        CustomizedTheme.voucherUnpaid,
                                  ));
                                }
                              }
                              setState(() {});
                            },
                            child: isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    AppLocalizations.of(context)!.translate(
                                      TranslationKeys.continueButton,
                                    ),
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
    );
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
        content: Text(
          AppLocalizations.of(context)!.translate(
            TranslationKeys.loginFailed,
          ),
          textAlign: TextAlign.center,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        backgroundColor: CustomizedTheme.voucherUnpaid,
      ));
    }
  }
}
