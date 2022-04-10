import 'package:borderpay/Utils/sharedPrefKeys.dart';
import 'package:borderpay/Utils/sharedpref.dart';
import 'package:borderpay/Utils/utils.dart';
import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/auth/local_auth_api.dart';
import 'package:borderpay/model/datamodels/login_model.dart';
import 'package:borderpay/model/datamodels/login_user_model.dart';
import 'package:borderpay/model/datamodels/register_model.dart';
import 'package:borderpay/repo/auth_repo/auth_repo.dart';
import 'package:borderpay/repo/auth_repo/auth_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final UserDataController userDataController = Get.put(UserDataController());
  AuthRepo networkHandler = AuthRepoImpl();

  // NetworkHandlerCashier _networkHandlerCashier = NetworkHandlerCashier();
  TextEditingController emailController = TextEditingController();
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
        title: Text("Sign in", style: CustomizedTheme.title_p_W500_21),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.36.w),
            child: Form(
              key: Utils.loginPageFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 68.54.h,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 24.44.w,
                          right: 34.47.w,
                          bottom: 12.3.h,
                          top: 15.03.h),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0.r)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0.w)),
                      labelText: "Email",
                      labelStyle: CustomizedTheme.b_W400_12,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    // controller: passwordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Please enter email.';
                      }
                      // Check if the entered email has the right format
                      // if (value.trim().length < 6) {
                      //   return 'Enter correct number';
                      // }
                      // Return null if the entered email is valid
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 35.53.h,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 24.44.w,
                          right: 34.47.w,
                          bottom: 12.3.h,
                          top: 15.03.h),
                      suffixIcon: IconButton(
                        icon: Image.asset(
                          'assets/icons/obscure.png',
                          color: _obscureText
                              ? Colors.black
                              : Colors.black.withOpacity(.3),
                        ),
                        onPressed: () {
                          _toggle();
                        },
                      ),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0.r)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0.w)),
                      labelText: "Password",
                      labelStyle: CustomizedTheme.b_W400_12,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    // controller: passwordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Please enter password';
                      }
                      // Check if the entered email has the right format
                      if (value.trim().length < 6) {
                        return 'Enter correct password';
                      }
                      // Return null if the entered email is valid
                      return null;
                    },
                  ),

                  SizedBox(height: 100.16.h),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 28.52.h),
                      child: GestureDetector(
                          onTap: () async {
                            LocalAuthApi.authenticateWithBiometrics();
                            print("asdasdas");
                          },
                          child: Image.asset('assets/icons/ic_touchid.png')),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 40.87.h),
                      child: GestureDetector(
                          onTap: () async {
                            LocalAuthApi.authenticateWithBiometrics();
                            print("asdasdas");
                          },
                          child: Image.asset('assets/icons/ic_faceid.png')),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 61.07.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.r),
                              color: CustomizedTheme.colorAccent),
                          child: TextButton(
                              onPressed: () async {
                                if (emailController.text.isNotEmpty &&
                                    passwordController.text.isNotEmpty) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  Map<String, String> loginData = {
                                    "email": emailController.text,
                                    "password": passwordController.text,
                                  };
                                  var res =
                                      await networkHandler.loginUser(loginData);
                                  if (res != null) {
                                    LoginUserModel loginModel =
                                        LoginUserModel.fromJson(res);
                                    if (loginModel.status) {
                                      emailController.clear();
                                      passwordController.clear();
                                    }
                                    setState(() {
                                      isLoading = false;
                                    });

                                    Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        '/hostpage',
                                        (Route<dynamic> route) => false);
                                  } else {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: const Text("Login Failed"),
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      backgroundColor:
                                          CustomizedTheme.voucherUnpaid,
                                    ));
                                  }
                                }
                              },
                              child: isLoading
                                  ? const CircularProgressIndicator()
                                  : Text("Sign in",
                                      style: CustomizedTheme.w_W500_19)),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: 26.08.h),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Container(
                  //         height:1,width: MediaQuery.of(context).size.width,
                  //         color: CustomizedTheme.primaryLine,
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsets.symmetric(horizontal:12.6.w),
                  //       child: Text("OR",style: CustomizedTheme.roboto_l_W400_14),
                  //     ),
                  //     Expanded(
                  //       child: Container(
                  //         height:1,width: MediaQuery.of(context).size.width,
                  //         color: CustomizedTheme.primaryLine,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: 24.75.h),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Container(
                  //         height: 61.07.h,
                  //         decoration: BoxDecoration(
                  //           border: Border.all(color: CustomizedTheme.colorAccent,width: .5.w),
                  //           borderRadius: BorderRadius.circular(7),
                  //         ),
                  //         child: TextButton(onPressed: () {  },
                  //             child: Row(
                  //               crossAxisAlignment: CrossAxisAlignment.center,
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Image.asset('assets/icons/ic_google.png'),
                  //                 SizedBox(width: 16.25.w,),
                  //                 Text("Continue with Google",style: CustomizedTheme.b_W400_16),
                  //               ],
                  //             )),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: 18.58,),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Container(
                  //         height: 61.07,
                  //         decoration: BoxDecoration(
                  //           border: Border.all(color: CustomizedTheme.colorAccent,width: .5),
                  //           borderRadius: BorderRadius.circular(7),
                  //         ),
                  //         child: TextButton(onPressed: () {  },
                  //             child: Row(
                  //               crossAxisAlignment: CrossAxisAlignment.center,
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Image.asset('assets/icons/ic_facebook.png'),
                  //                 SizedBox(width: 16.25,),
                  //                 Text("Continue with Facebook",style: CustomizedTheme.b_W400_16),
                  //               ],
                  //             )),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
