import 'package:borderpay/Utils/utils.dart';
import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/auth/local_auth_api.dart';
import 'package:borderpay/model/datamodels/login_user_model.dart';
import 'package:borderpay/model/datamodels/user_model.dart';
import 'package:borderpay/repo/auth_repo/auth_repo.dart';
import 'package:borderpay/repo/auth_repo/auth_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordPage extends StatefulWidget {
  final UserModel userData;

  const ChangePasswordPage({Key? key, required this.userData})
      : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  AuthRepo networkHandler = AuthRepoImpl();

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

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
        title: Text("Change password", style: CustomizedTheme.title_p_W500_21),
      ),
      body: SafeArea(
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
                  controller: oldPasswordController,
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
                        borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                        borderSide:
                            BorderSide(color: Colors.black, width: 1.0.w)),
                    labelText: "Old password",
                    labelStyle: CustomizedTheme.b_W400_12,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                  // controller: passwordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Please enter old password';
                    }
                    // Check if the entered email has the right format
                    if (value.trim().length < 6) {
                      return 'Enter correct password';
                    }
                    // Return null if the entered email is valid
                    return null;
                  },
                ),
                SizedBox(
                  height: 35.53.h,
                ),
                TextFormField(
                  controller: newPasswordController,
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
                        borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                        borderSide:
                            BorderSide(color: Colors.black, width: 1.0.w)),
                    labelText: "New password",
                    labelStyle: CustomizedTheme.b_W400_12,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                  // controller: passwordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Please enter new password';
                    }
                    // Check if the entered email has the right format
                    if (value.trim().length < 6) {
                      return 'Enter correct password';
                    }
                    // Return null if the entered email is valid
                    return null;
                  },
                ),
                const Spacer(),
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
                              if (oldPasswordController.text.isNotEmpty &&
                                  newPasswordController.text.isNotEmpty) {
                                setState(() {
                                  isLoading = true;
                                });
                                Map<String, String> loginData = {
                                  "mobileNumber": widget.userData.phoneNumber,
                                  "oldPassword": oldPasswordController.text,
                                  "newPassword": newPasswordController.text,
                                };
                                var res = await networkHandler.changePassword(
                                  loginData,
                                  widget.userData.userId,
                                );
                                if (res != null) {
                                  oldPasswordController.clear();
                                  newPasswordController.clear();
                                  setState(() {
                                    isLoading = false;
                                  });
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: const Text(
                                        "Password successfully updated!"),
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    backgroundColor:
                                        CustomizedTheme.voucherPaid,
                                  ));
                                  Navigator.pop(context);
                                } else {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: const Text("Something went wrong"),
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
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text("Update password",
                                    style: CustomizedTheme.w_W500_19)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35.53.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
