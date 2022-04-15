import 'dart:convert';

import 'package:borderpay/Utils/sharedPrefKeys.dart';
import 'package:borderpay/Utils/sharedpref.dart';
import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/model/arguments/traveler_details_arguments.dart';
import 'package:borderpay/model/datamodels/bulk_vouchers_model.dart';
import 'package:borderpay/model/datamodels/create_bulk_voucher_model.dart';
import 'package:borderpay/model/datamodels/user_model.dart';
import 'package:borderpay/repo/voucher_repo/voucher_repo.dart';
import 'package:borderpay/repo/voucher_repo/voucher_repo_impl.dart';
import 'package:borderpay/widget/blue_backbutton.dart';
import 'package:borderpay/widget/custom_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TravelerCategory extends StatefulWidget {
  final String type;
  final int locationId;

  const TravelerCategory({
    Key? key,
    required this.type,
    required this.locationId,
  }) : super(key: key);

  @override
  _TravelerCategoryState createState() => _TravelerCategoryState();
}

class _TravelerCategoryState extends State<TravelerCategory> {
  VoucherRepo networkHandler = VoucherRepoImpl();
  UserModel loginData = UserModel();
  MySharedPreferences storage = MySharedPreferences.instance;
  bool isLoading = false;
  int selection = 0;

  @override
  void initState() {
    if (loginData.firstName.isEmpty) {
      getUserData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Center(
            child: BlueBackButton(
          context: context,
        )),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.36.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 30.h),
                      child: Text("Select the traveller category:",
                          style: CustomizedTheme.sf_b_W500_17),
                    ),
                    Center(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selection = 1;
                              });
                            },
                            child: SizedBox(
                                height: 150.h,
                                // width: 150.w,
                                child: selection == 1
                                    ? Image.asset(
                                        'assets/icons/ic_single_active.png',
                                        fit: BoxFit.fill,
                                      )
                                    : Image.asset(
                                        'assets/icons/ic_single.png',
                                        fit: BoxFit.fill,
                                      )),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            child: Text("Single",
                                style: CustomizedTheme.sf_b_W500_17),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selection = 2;
                              });
                            },
                            child: SizedBox(
                                height: 150.h,
                                // width: 150.w,
                                child: selection == 2
                                    ? Image.asset(
                                        'assets/icons/ic_group_active.png',
                                        fit: BoxFit.fill,
                                      )
                                    : Image.asset(
                                        'assets/icons/ic_group.png',
                                        fit: BoxFit.fill,
                                      )),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            child: Text("Group",
                                style: CustomizedTheme.sf_b_W500_17),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 50.h),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    // width: 154.94,
                                    height: 56.8.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(11.72.r),
                                        // border: Border.all(color: CustomizedTheme.primaryColor,width: .5),
                                        color: CustomizedTheme.colorAccent),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: CustomizedTheme.colorAccent,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.r)),
                                        ),
                                        onPressed: () {
                                          if (selection == 2) {
                                            Navigator.pushNamed(
                                                context, '/NumberofVoucherPage',
                                                arguments: DetailsTravelersArg(
                                                  type: widget.type,
                                                  locationId: widget.locationId,
                                                ));
                                          } else if (selection == 1) {
                                            CustomAlertDialog.twoActionDialog(
                                              context: context,
                                              buttonAction1: () {
                                                createVoucher();
                                              },
                                              buttonAction2: () {
                                                Navigator.pushNamed(context,
                                                    '/DetailsTravelersPage',
                                                    arguments:
                                                        DetailsTravelersArg(
                                                      travelerCount: 1,
                                                      type: widget.type,
                                                      locationId:
                                                          widget.locationId,
                                                    ));
                                              },
                                            );
                                          }
                                        },
                                        child: Text("Next",
                                            style:
                                                CustomizedTheme.sf_w_W500_19)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  createVoucher() async {
    setState(() {
      isLoading = true;
    });
    List<BulkTraveler> travelersData = [
      BulkTraveler(
        firstName: loginData.firstName,
        lastName: loginData.lastName,
        email: loginData.email,
        emirateId: loginData.emirateId,
        mobileNumber: loginData.phoneNumber,
        nationalityId: loginData.nationality?.id ?? 1,
      ),
    ];

    CreateBulkVoucherModel body = CreateBulkVoucherModel(
      widget.type,
      widget.locationId,
      travelersData,
    );

    var res = await networkHandler.createBulkVoucher(body, loginData.userId);
    if (res != null) {
      setState(() {
        isLoading = false;
      });
      BulkVouchersModel voucher = BulkVouchersModel(
        res.status,
        res.statusMsg,
        res.data,
      );

      Navigator.pushNamed(
        context,
        '/SingleVoucher',
        arguments: voucher.data.vouchers,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Something went wrong"),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        backgroundColor: CustomizedTheme.voucherUnpaid,
      ));
    }
    setState(() {
      isLoading = false;
    });
  }

  getCurrentUserDetails() {
    Vouchers(
      locationId: widget.locationId,
      type: widget.type,
      amount: 0,
      voucherNo: '',
      user: BulkVoucherUser(
        id: loginData.userId,
        firstName: loginData.firstName,
        lastName: loginData.lastName,
        email: loginData.email,
        emirateId: loginData.emirateId,
        mobileNumber: loginData.phoneNumber,
        nationalityId: loginData.nationality?.id ?? -1,
      ),
      location: Location(),
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
