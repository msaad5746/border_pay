import 'dart:convert';
import 'dart:io';

import 'package:borderpay/Utils/sharedPrefKeys.dart';
import 'package:borderpay/Utils/sharedpref.dart';
import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/model/datamodels/location_model.dart';
import 'package:borderpay/model/datamodels/user_model.dart';
import 'package:borderpay/model/datamodels/voucher_model.dart';
import 'package:borderpay/repo/voucher_repo/voucher_repo.dart';
import 'package:borderpay/repo/voucher_repo/voucher_repo_impl.dart';
import 'package:borderpay/screens/home_page/my_vouchers.dart';
import 'package:borderpay/widget/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../localization/app_localization.dart';
import '../../localization/translation_keys.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel loginData = UserModel();
  MySharedPreferences storage = MySharedPreferences.instance;
  LocationModel? location;
  VoucherModel voucherList = VoucherModel();
  final RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int pageNumber = 1;
  bool isLoading = true;
  bool isError = false;

  @override
  void initState() {
    if (loginData.firstName.isEmpty) {
      getUserData();
    }
    getHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        top: Platform.isIOS ? false : true,
        child: isLoading
            ? getLoadingScreen()
            : isError
                ? getErrorScreen()
                : Column(
                    children: [
                      SizedBox(
                        height: 400.h,
                        width: 1.sw,
                        child: Stack(
                          children: [
                            Container(
                              height: 292.83.h,
                              decoration: BoxDecoration(
                                color: CustomizedTheme.primaryBold,
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(
                                    30.0.r,
                                  ),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 50.0.h,
                                      left: 20.36.w,
                                      right: 20.36.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              '/support',
                                            );
                                          },
                                          child: Container(
                                            height: 37.26.h,
                                            width: 37.26.w,
                                             padding: const EdgeInsets.symmetric(horizontal: 6.8),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10.11.r,
                                              ),
                                              color: CustomizedTheme.white,
                                            ),
                                            child: SvgPicture.asset(
                                              AppLocalizations.of(context)!
                                                  .translate(TranslationKeys
                                                      .ic_support),
                                              color:
                                                  CustomizedTheme.colorAccent,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 19.5.h,
                                      left: 20.w,
                                      right: 20.w,
                                    ),
                                    child: Text(
                                      AppLocalizations.of(context)!.translate(
                                            TranslationKeys.hello,
                                          ) +
                                          " ${loginData.firstName}" +
                                          AppLocalizations.of(context)!
                                              .translate(
                                            TranslationKeys.qoma,
                                          ),
                                      style: CustomizedTheme.sf_w_W500_23,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 20.h,
                                      bottom: 10.h,
                                      left: 20.w,
                                      right: 20.w,
                                    ),
                                    child: Text(
                                      AppLocalizations.of(context)!.translate(
                                        TranslationKeys.chooseLocation,
                                      ),
                                      style: CustomizedTheme.sf_w_W400_20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 200.h,
                              left: 20.w,
                              right: 20.w,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          location = LocationModel(
                                            id: 2,
                                            title: AppLocalizations.of(context)!
                                                .translate(
                                              TranslationKeys.hatta,
                                            ),
                                          );
                                          Navigator.pushNamed(
                                            context,
                                            '/VoucherTypePage',
                                            arguments: location,
                                          );
                                        });
                                      },
                                      child: SizedBox(
                                        width: 160,
                                        height: 180,
                                        child: Stack(
                                          children: [
                                            Image.asset(
                                              'assets/icons/hatta-bg.png',
                                              fit: BoxFit.fill,
                                            ),
                                            Container(
                                              width: 148,
                                              height: 164,
                                              margin: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Colors.transparent,
                                                    Colors.black
                                                        .withOpacity(0.5),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20.0),
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Text(
                                                  AppLocalizations.of(context)!
                                                      .translate(
                                                    TranslationKeys.hatta,
                                                  ),
                                                  style: CustomizedTheme
                                                      .sf_b_W700_18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  horizontalSpacer(4),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(
                                          () {
                                            location = LocationModel(
                                              id: 1,
                                              title:
                                                  AppLocalizations.of(context)!
                                                      .translate(
                                                TranslationKeys.portRashid1,
                                              ),
                                            );
                                            Navigator.pushNamed(
                                              context,
                                              '/VoucherTypePage',
                                              arguments: location,
                                            );
                                          },
                                        );
                                      },
                                      child: SizedBox(
                                        width: 160,
                                        height: 180,
                                        child: Stack(
                                          children: [
                                            Image.asset(
                                              'assets/icons/portrashid-bg.png',
                                              fit: BoxFit.fill,
                                            ),
                                            Container(
                                              width: 148,
                                              height: 164,
                                              margin: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Colors.transparent,
                                                    Colors.black
                                                        .withOpacity(0.5),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20.0),
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Text(
                                                  AppLocalizations.of(context)!
                                                      .translate(
                                                    TranslationKeys.portRashid1,
                                                  ),
                                                  style: CustomizedTheme
                                                      .sf_b_W700_18,
                                                ),
                                              ),
                                            ),
                                          ],
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
                      verticalSpacer(32),
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              AppLocalizations.of(context)!.translate(
                                TranslationKeys.myVouchers,
                              ),
                              style: CustomizedTheme.sf_b_W500_19,
                            ),
                          ),
                        ],
                      ),
                      verticalSpacer(16),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: horizontalValue(20),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 7.w,
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                          color: CustomizedTheme.colorAccent,
                          borderRadius: BorderRadius.circular(
                            6.r,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 80.w,
                              child: Text(
                                AppLocalizations.of(context)!.translate(
                                  TranslationKeys.voucherNo,
                                ),
                                style: CustomizedTheme.roboto_w_W500_14,
                              ),
                            ),
                            SizedBox(
                              width: 100.w,
                              child: Text(
                                AppLocalizations.of(context)!.translate(
                                  TranslationKeys.location,
                                ),
                                style: CustomizedTheme.roboto_w_W500_14,
                              ),
                            ),
                            Text(
                              AppLocalizations.of(context)!.translate(
                                TranslationKeys.status,
                              ),
                              style: CustomizedTheme.roboto_w_W500_14,
                            ),
                          ],
                        ),
                      ),
                      verticalSpacer(16),
                      voucherList.data.isEmpty
                          ? Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: .5.h,
                                    color: CustomizedTheme.colorAccent,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5.56.w,
                                  ),
                                  child: Text(
                                    AppLocalizations.of(context)!.translate(
                                      TranslationKeys.noTransactionYet,
                                    ),
                                    style: CustomizedTheme.sf_b_W300_14,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: .5.h,
                                    color: CustomizedTheme.colorAccent,
                                  ),
                                )
                              ],
                            )
                          : const SizedBox.shrink(),
                      Expanded(
                        child: MyVouchers(
                          voucherList: voucherList,
                          loadMoreData: () {
                            if (voucherList.lastPage) {
                            } else {
                              loadMoreData(1);
                            }
                          },
                          lastPage: voucherList.lastPage,
                        ),
                      ),
                      verticalSpacer(32),
                    ],
                  ),
      ),
    );
  }

  Future<void> getHomeData() async {
    VoucherRepo repo = VoucherRepoImpl();
    var response = await repo.getVoucherList(
      id: loginData.userId,
      page: pageNumber,
    );
    if (response != null) {
      voucherList = response;
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
        isError = true;
      });
    }
  }

  Future<void> loadMoreData(int id) async {
    VoucherRepo repo = VoucherRepoImpl();
    var response = await repo.getVoucherList(
      id: loginData.userId,
      page: voucherList.page,
    );
    if (response != null) {
      VoucherModel model = response;
      voucherList.lastPage = model.lastPage;
      for (int i = 0; i < model.data.length; i++) {
        voucherList.data.add(model.data[i]);
      }
      setState(() {});
    } else {
      setState(() {
        isLoading = false;
        isError = true;
      });
    }
  }

  Widget getLoadingScreen() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget getErrorScreen() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.translate(
              TranslationKeys.noDataFound,
            ),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(100.w, 20.h),
              primary: CustomizedTheme.colorAccent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              setState(() {
                isLoading = true;
                isError = false;
              });
              getHomeData();
              if (loginData.firstName.isEmpty) {
                getUserData();
              }
            },
            child: Text(
              AppLocalizations.of(context)!.translate(
                TranslationKeys.retry,
              ),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getUserData() {
    bool isUserExist = storage.containsKey(SharedPrefKeys.user);
    if (isUserExist) {
      String user = storage.getStringValue(SharedPrefKeys.user);
      loginData = UserModel.fromJson(json.decode(user)['data']);
    }
  }
}
