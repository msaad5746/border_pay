import 'dart:convert';

import 'package:borderpay/Utils/sharedPrefKeys.dart';
import 'package:borderpay/Utils/sharedpref.dart';
import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/auth/local_auth_api.dart';
import 'package:borderpay/model/datamodels/user_model.dart';
import 'package:borderpay/repo/auth_repo/auth_repo.dart';
import 'package:borderpay/repo/auth_repo/auth_repo_impl.dart';
import 'package:borderpay/screens/host.dart';
import 'package:borderpay/screens/welcome_screen.dart';
import 'package:borderpay/widget/custom_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  MySharedPreferences storage = MySharedPreferences.instance;
  AuthRepo networkHandler = AuthRepoImpl();
  UserModel loginData = UserModel();
  bool isAuthenticated = false;
  bool isNotificationEnable = false;
  bool isLoading = false;

  @override
  void initState() {
    getUserData();
    isBioMetricEnable();
    isPushNotificationEnable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.w),
          child: Text("Settings", style: CustomizedTheme.title_sf_W500_21),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.36.w,
                    right: 20.36.w,
                    bottom: 12.h,
                  ),
                  child:
                      Text('General', style: CustomizedTheme.sf_bo_W400_1592),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.36.w),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          var isDataUpdate = await Navigator.pushNamed(
                              context, '/updateProfile',
                              arguments: loginData);
                          if (isDataUpdate as bool) {
                            getUserData();
                          }
                        },
                        child: Container(
                          height: 59.h,
                          width: 1.sw,
                          padding: EdgeInsets.symmetric(horizontal: 18.01.w),
                          decoration: BoxDecoration(
                              color: CustomizedTheme.white,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                  color: CustomizedTheme.primaryColor)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/svg/profile.svg',
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 31.7.w),
                                child: Text("Change Profile Information",
                                    style: CustomizedTheme.sf_bo_W400_1592),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 19.h),
                      GestureDetector(
                        onTap: () {
                          isNotificationEnable = !isNotificationEnable;
                          storage.setBoolValue(
                              SharedPrefKeys.isNotificationEnable,
                              isNotificationEnable);
                          setState(() {});
                        },
                        child: Container(
                          height: 59.h,
                          width: 1.sw,
                          padding: EdgeInsets.symmetric(horizontal: 18.01.w),
                          decoration: BoxDecoration(
                              color: CustomizedTheme.white,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                  color: CustomizedTheme.primaryColor)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/svg/ic_bell.svg',
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 31.7.w),
                                child: Text("Push Notifications",
                                    style: CustomizedTheme.sf_bo_W400_1592),
                              ),
                              const Spacer(),
                              Container(
                                height: 17.15,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: CustomizedTheme.primaryColor,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: FittedBox(
                                  child: CupertinoSwitch(
                                    thumbColor: CustomizedTheme.white,
                                    activeColor: CustomizedTheme.primaryColor,
                                    trackColor: CustomizedTheme.primaryBright,
                                    value: isNotificationEnable,
                                    onChanged: (value) {
                                      storage.setBoolValue(
                                          SharedPrefKeys.isNotificationEnable,
                                          value);
                                      setState(() {
                                        isNotificationEnable = value;
                                      });
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // End General

                // Security &  Privacy
                Padding(
                  padding: EdgeInsets.only(
                    top: 42.h,
                    left: 20.36.w,
                    right: 20.36.w,
                    bottom: 12.h,
                  ),
                  child: Text('Security & Privacy',
                      style: CustomizedTheme.sf_bo_W400_1592),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.36),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/changePassword',
                              arguments: loginData);
                        },
                        child: Container(
                          height: 59.h,
                          width: 1.sw,
                          padding: EdgeInsets.symmetric(horizontal: 18.01.w),
                          decoration: BoxDecoration(
                              color: CustomizedTheme.white,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                  color: CustomizedTheme.primaryColor)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/svg/ic_password.svg',
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 31.7.w),
                                child: Text("Change Password",
                                    style: CustomizedTheme.sf_bo_W400_1592),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 19.h),
                      GestureDetector(
                        onTap: () async {
                          if (!isAuthenticated) {
                            isAuthenticated =
                                await LocalAuthApi.authenticateWithBiometrics();
                          } else {
                            isAuthenticated = !isAuthenticated;
                          }
                          storage.setBoolValue(
                              SharedPrefKeys.isBioMatric, isAuthenticated);

                          setState(() {});
                        },
                        child: Container(
                          height: 59.h,
                          width: 1.sw,
                          padding: EdgeInsets.symmetric(horizontal: 18.01.w),
                          decoration: BoxDecoration(
                              color: CustomizedTheme.white,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                  color: CustomizedTheme.primaryColor)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/svg/ic_finger.svg',
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 31.7.w),
                                child: Text("Biometric Authentication",
                                    style: CustomizedTheme.sf_bo_W400_1592),
                              ),
                              const Spacer(),
                              Container(
                                height: 17.15,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: CustomizedTheme.primaryColor,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: FittedBox(
                                  child: CupertinoSwitch(
                                    thumbColor: CustomizedTheme.white,
                                    activeColor: CustomizedTheme.primaryColor,
                                    trackColor: CustomizedTheme.primaryBright,
                                    value: isAuthenticated,
                                    onChanged: (value) async {
                                      if (value) {
                                        isAuthenticated = await LocalAuthApi
                                            .authenticateWithBiometrics();
                                      } else {
                                        isAuthenticated = value;
                                      }
                                      storage.setBoolValue(
                                          SharedPrefKeys.isBioMatric,
                                          isAuthenticated);

                                      setState(() {});
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //End Security &  Privacy

                //Other Settings
                Padding(
                  padding: const EdgeInsets.only(
                    top: 42.55,
                    left: 20.36,
                    right: 20.36,
                    bottom: 12,
                  ),
                  child: Text('Other Settings',
                      style: CustomizedTheme.sf_bo_W400_1592),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.36),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          CustomAlertDialog.baseDialog(
                              context: context,
                              title: 'Delete Account!',
                              message: 'Are you sure to delete account?',
                              buttonAction: () {
                                deleteUser();
                              });
                        },
                        child: Container(
                          height: 59.h,
                          width: 1.sw,
                          padding: EdgeInsets.symmetric(horizontal: 18.01.w),
                          decoration: BoxDecoration(
                              color: CustomizedTheme.white,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                  color: CustomizedTheme.primaryColor)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/svg/ic_delete.svg',
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 31.7.w),
                                child: Text("Delete Account",
                                    style: CustomizedTheme.sf_bo_W400_1592),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 19.h),
                      GestureDetector(
                        onTap: () {
                          logOutUser();
                        },
                        child: Container(
                          height: 59.h,
                          width: 1.sw,
                          padding: EdgeInsets.symmetric(horizontal: 18.01.w),
                          decoration: BoxDecoration(
                              color: CustomizedTheme.white,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                  color: CustomizedTheme.primaryColor)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/svg/ic_exit.svg',
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 31.7.w),
                                child: Text("Logout",
                                    style: CustomizedTheme.sf_bo_W400_1592),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 14.58),
                                child: Container(
                                  height: 17.15,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: CustomizedTheme.primaryColor,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: FittedBox(
                                    child: CupertinoSwitch(
                                        thumbColor: CustomizedTheme.white,
                                        activeColor:
                                            CustomizedTheme.primaryColor,
                                        trackColor:
                                            CustomizedTheme.primaryBright,
                                        value: false,
                                        onChanged: (value) {
                                          logOutUser();
                                        }),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 35.h),
                    ],
                  ),
                ),
                //End Other Settings
              ],
            ),
          ),
          isLoading
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white.withOpacity(0.7),
                  child: const Center(child: CircularProgressIndicator()),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  getUserData() {
    bool isUserExist = storage.containsKey(SharedPrefKeys.user);
    if (isUserExist) {
      String user = storage.getStringValue(SharedPrefKeys.user);
      loginData = UserModel.fromJson(json.decode(user)['data']);
    }
  }

  isBioMetricEnable() {
    isAuthenticated = storage.getBoolValue(SharedPrefKeys.isBioMatric);
  }

  isPushNotificationEnable() {
    isNotificationEnable =
        storage.getBoolValue(SharedPrefKeys.isNotificationEnable);
  }

  deleteUser() async {
    setState(() {
      isLoading = true;
    });
    var res = await networkHandler.deleteUserAccount(
      loginData.userId,
    );
    if (res != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Account deleted successfully!"),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        backgroundColor: CustomizedTheme.voucherPaid,
      ));

      storage.setBoolValue(SharedPrefKeys.isLogin, false);
      storage.removeAll();

      setState(() {
        isLoading = false;
      });
      currentIndex = 0;

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const WelcomePage(),
        ),
        ModalRoute.withName('/'),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Something went wrong"),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        backgroundColor: CustomizedTheme.voucherUnpaid,
      ));
    }
  }

  logOutUser() {
    storage.setBoolValue(SharedPrefKeys.isLogin, false);
    storage.removeValue(SharedPrefKeys.user);

    currentIndex = 0;

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const WelcomePage()),
        ModalRoute.withName('/'));
  }
}
