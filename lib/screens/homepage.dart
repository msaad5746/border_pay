import 'dart:io';

import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/controllers/login_controller.dart';
import 'package:borderpay/model/datamodels/location_model.dart';
import 'package:borderpay/model/datamodels/voucher_model.dart';
import 'package:borderpay/repo/voucher_repo/voucher_repo.dart';
import 'package:borderpay/repo/voucher_repo/voucher_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LoginController userController = Get.find<LoginController>();
  LocationModel? location;
  VoucherModel voucherList = VoucherModel();

  bool isLoading = true;
  bool isError = false;

  @override
  void initState() {
    getHomeData(1);
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
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
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
                                      bottom: Radius.circular(30.0.r)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 50.0.h,
                                          left: 20.36.w,
                                          right: 20.36.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(),
                                          // Container(
                                          //     height: 37.26.h,
                                          //     width: 37.26.w,
                                          //     // margin: EdgeInsets.symmetric(horizontal: 10),
                                          //     decoration: BoxDecoration(
                                          //         borderRadius: BorderRadius.circular(10.11.r),
                                          //         color: CustomizedTheme.white),
                                          //     child: Icon(Icons.arrow_back,color: CustomizedTheme.colorAccent)),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, '/support');
                                            },
                                            child: Container(
                                                height: 37.26.h,
                                                width: 37.26.w,
                                                // margin: EdgeInsets.symmetric(horizontal: 10),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.11.r),
                                                    color:
                                                        CustomizedTheme.white),
                                                child: Image.asset(
                                                  'assets/icons/ic_help.png',
                                                  color: CustomizedTheme
                                                      .colorAccent,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 19.5.h, left: 20.w),
                                      child: Text(
                                        "Hello ${userController.loginData.firstName},",
                                        style: CustomizedTheme.sf_w_W500_23,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 20.h, bottom: 10.h, left: 20.w),
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
                                                  context, '/VoucherTypePage',
                                                  arguments: location);
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
                                                fit: BoxFit.fill),
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
                                  )
                                  // Image.asset('assets/icons/ic_card.png',fit: BoxFit.fill,height: 220,)
                                  ),
                            ],
                          ),
                        ),
                        ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Padding(
                            //   padding: EdgeInsets.only(top: 20.h,left: 20.w,right: 20.w),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //     children: [
                            //       Expanded(
                            //         child: Container(
                            //           // width: 154.94,
                            //           height: 48.h,
                            //           decoration: BoxDecoration(
                            //               borderRadius: BorderRadius.circular(7.r),
                            //               // border: Border.all(color: CustomizedTheme.primaryColor,width: .5),
                            //               color: CustomizedTheme.colorAccent
                            //           ),
                            //           child: ElevatedButton(
                            //               style: ElevatedButton.styleFrom(
                            //                 primary: CustomizedTheme.colorAccent,
                            //                 elevation: 0,
                            //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                            //               ),
                            //               onPressed: () {
                            //                 Navigator.pushNamed(context, '/TravelerCatagory');
                            //                 },
                            //               child: Text("Buy Voucher",style: CustomizedTheme.sf_w_W500_17)),
                            //         ),
                            //       ),
                            //       SizedBox(width: 11.w),
                            //       Expanded(
                            //         child: Container(
                            //           // width: 154.94,
                            //           height: 48.h,
                            //           decoration: BoxDecoration(
                            //               borderRadius: BorderRadius.circular(7.r),
                            //               border: Border.all(color: CustomizedTheme.primaryColor,width: .5.w),
                            //               color: CustomizedTheme.white
                            //           ),
                            //           child: ElevatedButton(
                            //               style: ElevatedButton.styleFrom(
                            //                 primary: CustomizedTheme.colorAccent,
                            //                 elevation: 0,
                            //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                            //               ),
                            //               onPressed: () {
                            //                 Navigator.pushNamed(context, '/VoucherTypePage');
                            //                 },
                            //               child: Text("Buy Voucher",style: CustomizedTheme.sf_w_W500_17)),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.h, left: 20.w),
                              child: Text(
                                "My Vouchers",
                                style: CustomizedTheme.sf_b_W500_19,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 20.h, left: 20.w, right: 20.w),
                              child: Container(
                                height: 41.h,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 7.w, vertical: 12.h),
                                decoration: BoxDecoration(
                                    color: CustomizedTheme.colorAccent,
                                    borderRadius: BorderRadius.circular(6.r)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      child: Text('Location',
                                          style:
                                              CustomizedTheme.roboto_w_W500_14),
                                    ),
                                    Text('Status',
                                        style:
                                            CustomizedTheme.roboto_w_W500_14),
                                  ],
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15.h, horizontal: 26.53.w),
                              child: voucherList.data.isEmpty
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
                                              horizontal: 5.56.w),
                                          child: Text('No transaction yet',
                                              style:
                                                  CustomizedTheme.sf_b_W300_14),
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
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(horizontal: 22.8.w),
                              shrinkWrap: true,
                              itemCount: voucherList.data.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/DetailedVoucher',
                                      arguments: voucherList.data[index],
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 22.53.h,
                                        left: 10,
                                        right: 10,
                                        bottom: 12),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color:
                                                    CustomizedTheme.colorAccent,
                                                width: 0.5))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 80.w,
                                          child: Text(
                                              voucherList.data[index].id
                                                  .toString(),
                                              style: CustomizedTheme
                                                  .sf_pb_W700_13),
                                        ),
                                        SizedBox(
                                          width: 80.w,
                                          child: Text(
                                              voucherList
                                                  .data[index].location.title,
                                              style: CustomizedTheme
                                                  .sf_pb_W300_13),
                                        ),
                                        SizedBox(
                                          width: 80.w,
                                          child: Text(
                                              voucherList.data[index].status,
                                              textAlign: TextAlign.end,
                                              style: CustomizedTheme
                                                  .sf_b_W300_13Paid),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
      ),
    );
  }

  Future<void> getHomeData(int id) async {
    VoucherRepo repo = VoucherRepoImpl();
    var response = await repo.getVoucherList(id);
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

  Widget getLoadingScreen() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget getErrorScreen() {
    return const Center(
      child: Text('No data found',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          )),
    );
  }
}
