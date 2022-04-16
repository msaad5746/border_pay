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
import 'package:pull_to_refresh/pull_to_refresh.dart';

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

  int pageNumber = 1;
  bool isLoading = true;
  bool isError = false;

  @override
  void initState() {
    getHomeData(1);
    if (loginData.firstName.isEmpty) {
      getUserData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: Platform.isIOS ? false : true,
        child: isLoading
            ? getLoadingScreen()
            : isError
                ? getErrorScreen()
                : Column(
                    children: [
                      SizedBox(
                        height: 380.h,
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
                                            // margin: EdgeInsets.symmetric(horizontal: 10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10.11.r,
                                              ),
                                              color: CustomizedTheme.white,
                                            ),
                                            child: Image.asset(
                                              'assets/icons/ic_help.png',
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
                                        top: 19.5.h, left: 20.w),
                                    child: Text(
                                      "Hello ${loginData.firstName},",
                                      style: CustomizedTheme.sf_w_W500_23,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 20.h,
                                      bottom: 10.h,
                                      left: 20.w,
                                    ),
                                    child: Text(
                                      "Choose location",
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
                                            title: 'hatta',
                                          );
                                          Navigator.pushNamed(
                                            context,
                                            '/VoucherTypePage',
                                            arguments: location,
                                          );
                                        });
                                      },
                                      child: SizedBox(
                                        height: 182.h,
                                        // decoration: BoxDecoration(
                                        //   borderRadius: BorderRadius.circular(10.r),
                                        //   border: selection == 'hatta' ? Border.all(width: 4.w,color: CustomizedTheme.colorAccent):null,
                                        //   // image: const DecorationImage(
                                        //   //     image: AssetImage('assets/welcome/hatta-bg.png'),
                                        //   //     fit: BoxFit.fill
                                        //   // ),
                                        // ),
                                        child: Image.asset(
                                          'assets/welcome/hatta-bg.png',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 11.w,
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          location = LocationModel(
                                            id: 1,
                                            title: 'Port Rashid 1',
                                          );
                                          Navigator.pushNamed(
                                            context,
                                            '/VoucherTypePage',
                                            arguments: location,
                                          );
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(0),
                                        // width: MediaQuery.of(context).size.width*5,
                                        height: 182.h,
                                        // decoration: BoxDecoration(
                                        //     // borderRadius: BorderRadius.circular(10.r),
                                        //     border: selection == 'port' ? Border.all(width: 4.w,color: CustomizedTheme.colorAccent):null,
                                        //     // image: const DecorationImage(
                                        //     //     image: AssetImage('assets/welcome/portrashid-bg.png'),
                                        //     //     fit: BoxFit.fill
                                        //     // )
                                        // ),
                                        child: Image.asset(
                                            'assets/welcome/portrashid-bg.png',
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Image.asset('assets/icons/ic_card.png',fit: BoxFit.fill,height: 220,)
                            ),
                          ],
                        ),
                      ),
                      verticalSpacer(32),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                          horizontal: horizontalValue(16),
                        ),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "My Vouchers",
                          style: CustomizedTheme.sf_b_W500_19,
                        ),
                      ),
                      verticalSpacer(16),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: horizontalValue(16),
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
                                'Voucher No',
                                style: CustomizedTheme.roboto_w_W500_14,
                              ),
                            ),
                            SizedBox(
                              width: 100.w,
                              child: Text(
                                'Location',
                                style: CustomizedTheme.roboto_w_W500_14,
                              ),
                            ),
                            Text(
                              'Status',
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
                                    'No transaction yet',
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
                            }else{
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

  Future<void> getHomeData(int id) async {
    VoucherRepo repo = VoucherRepoImpl();
    var response = await repo.getVoucherList(
      id: id,
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
      id: id,
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
    return const Center(
      child: Text(
        'No data found',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
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
