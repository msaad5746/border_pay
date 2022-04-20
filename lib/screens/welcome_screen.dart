import 'dart:async';

import 'package:borderpay/Route_Constants/route_constants.dart';
import 'package:borderpay/Utils/sharedPrefKeys.dart';
import 'package:borderpay/Utils/sharedpref.dart';
import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/controllers/countries_controller.dart';
import 'package:borderpay/localization/app_localization.dart';
import 'package:borderpay/localization/translation_keys.dart';
import 'package:borderpay/res/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool showButtons = false;
  MySharedPreferences storage = MySharedPreferences.instance;
  CountriesController countriesController = Get.put(
    CountriesController(),
    permanent: true,
  );

  @override
  void initState() {
    getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);
    return Scaffold(
      backgroundColor: CustomizedTheme.primaryColor,
      body: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/welcome/bg-welcome.png'),
                fit: BoxFit.fill)),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 70.51.h,
                        width: 65.04.w,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/welcome/ic_eagle.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(width: 13.21.w),
                      Container(
                        height: 80.27.h,
                        width: 1.w,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/welcome/ic_Line.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.08.w),
                      Container(
                        height: 59.57.h,
                        width: 59.57.w,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/welcome/ic_Icon.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 8.53.h),
                      Text(
                          AppLocalizations.of(context)!.translate(
                            TranslationKeys.borderPay,
                          ),
                          style: CustomizedTheme.w_W500_2622),
                      SizedBox(height: 3.19.h),
                      Text(
                          AppLocalizations.of(context)!.translate(
                            TranslationKeys.poweredByCBD,
                          ),
                          style: CustomizedTheme.w_W300_12),
                      SizedBox(height: 64.55.h),
                      Text(
                          AppLocalizations.of(context)!.translate(
                            TranslationKeys.paymentsAnywhereAnytime,
                          ),
                          style: CustomizedTheme.w_W500_15),
                    ],
                  ),
                ],
              ),
            ),
            // const SizedBox(
            //     height: 118.71
            // ),
            showButtons
                ? Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.r),
                                    color: CustomizedTheme.whiteButton),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/login');
                                    },
                                    child: Text(
                                        AppLocalizations.of(context)!.translate(
                                          TranslationKeys.existingUser,
                                        ),
                                        style: CustomizedTheme.p_W500_19)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.24.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.r),
                                    border: Border.all(
                                        color: CustomizedTheme.white,
                                        width: .5.w),
                                    color: CustomizedTheme.primaryLight),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/RegisterPage');
                                    },
                                    child: Text(
                                        AppLocalizations.of(context)!.translate(
                                          TranslationKeys.newUser,
                                        ),
                                        style: CustomizedTheme.w_W500_19)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 39.88.h,
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Future<void> getCountries() async {
    await countriesController.fetchCountries();
    try {
      bool isLogin = storage.getBoolValue(SharedPrefKeys.isLogin);
      if (isLogin) {
        Navigator.popAndPushNamed(context, RouteConstant.hostPage);
      } else {
        setState(() {
          showButtons = true;
        });
      }
    } catch (e) {
      setState(() {
        showButtons = true;
      });
    }
  }
}
