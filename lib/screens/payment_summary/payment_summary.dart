import 'dart:convert';
import 'dart:math';

import 'package:borderpay/Utils/sharedPrefKeys.dart';
import 'package:borderpay/Utils/sharedpref.dart';
import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/model/arguments/payment_arguments.dart';
import 'package:borderpay/model/datamodels/bulk_vouchers_model.dart';
import 'package:borderpay/model/datamodels/paid_voucher_model.dart';
import 'package:borderpay/model/datamodels/user_model.dart';
import 'package:borderpay/model/datamodels/voucher_transaction_model.dart';
import 'package:borderpay/repo/voucher_repo/voucher_repo.dart';
import 'package:borderpay/repo/voucher_repo/voucher_repo_impl.dart';
import 'package:borderpay/res/res.dart';
import 'package:borderpay/screens/payment_web_view.dart';
import 'package:borderpay/widget/blue_backbutton.dart';
import 'package:borderpay/widget/custom_alert.dart';
import 'package:borderpay/widget/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentSummary extends StatefulWidget {
  final List<Vouchers> data;

  const PaymentSummary({Key? key, required this.data}) : super(key: key);

  @override
  _PaymentSummaryState createState() => _PaymentSummaryState();
}

class _PaymentSummaryState extends State<PaymentSummary> {
  UserModel loginData = UserModel();
  MySharedPreferences storage = MySharedPreferences.instance;
  VoucherRepo networkHandler = VoucherRepoImpl();
  bool isLoading = false;
  List<dynamic> failedTransactions = List.empty(growable: true);

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
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: horizontalValue(16),
              ),
              alignment: Alignment.topLeft,
              child: Text(
                'Payment Summary',
                style: CustomizedTheme.sf_b_W500_26,
              ),
            ),
            // verticalSpacer(60),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: horizontalValue(16),
                vertical: verticalValue(50),
              ),
              decoration: BoxDecoration(
                color: CustomizedTheme.primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.symmetric(
                vertical: verticalValue(16),
                horizontal: horizontalValue(16),
              ),
              child: Column(
                children: [
                  ...List.generate(
                    widget.data.length,
                    (index) => Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Voucher Number: ",
                              style: CustomizedTheme.w_W500_17.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              width: 150.w,
                              child: Text(
                                'L${widget.data[index].id.toString()}',
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                                style: CustomizedTheme.w_W500_17,
                              ),
                            ),
                          ],
                        ),
                        verticalSpacer(16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildText(
                              "Traveller Name",
                              CustomizedTheme.w_W500_17.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: sizes.fontRatio!*17,
                              ),
                            ),
                            buildText(
                              widget.data[index].user.firstName +
                                  ' ' +
                                  widget.data[index].user.lastName,
                              CustomizedTheme.w_W500_17.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: sizes.fontRatio!*17,
                              ),
                            ),
                          ],
                        ),
                        verticalSpacer(16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildText(
                              "Voucher Amount",
                              CustomizedTheme.w_W500_17.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: sizes.fontRatio!*17,
                              ),
                            ),
                            buildText(
                              "AED " + widget.data[index].amount.toString(),
                              CustomizedTheme.w_W500_17.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: sizes.fontRatio!*17,
                              ),
                            ),
                          ],
                        ),
                        verticalSpacer(44),
                      ],
                    ),
                  ),
                  verticalSpacer(20),
                  Container(
                    height: 1.h,
                    width: 1.sw,
                    color: CustomizedTheme.white,
                  ),
                  verticalSpacer(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildText(
                        "Total Amount",
                        CustomizedTheme.w_W500_17,
                      ),
                      buildText(
                        "AED " + getTotalAmount().toString(),
                        CustomizedTheme.w_W500_17.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // const Spacer(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: horizontalValue(16),
                    ),
                    height: 56.8.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.72.r),
                      // border: Border.all(color: CustomizedTheme.primaryColor,width: .5),
                      color: CustomizedTheme.colorAccent,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: CustomizedTheme.colorAccent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        if (!isLoading) {
                          setState(() {
                            isLoading = true;
                          });
                          var res = await networkHandler.createVoucherTransaction(
                            getVoucherIds(),
                            loginData.userId,
                          );
                          if (res != null) {
                            final response = await Navigator.pushNamed(
                              context,
                              PaymentGateway.route,
                              arguments: PaymentArgument(
                                payment: getTotalAmount(),
                                orderId: res.orderId,
                              ),
                            );

                            if (response != null) {
                              var res = await networkHandler
                                  .payVoucherTransaction(response);
                              if (res != null) {
                                PaidVoucherModel data =
                                    PaidVoucherModel.fromJson(res);
                                setState(() {
                                  isLoading = false;
                                });
                                CustomAlertDialog.baseDialog(
                                    context: context,
                                    title: 'Successfully Purchased',
                                    message: 'Voucher successfully purchased',
                                    showCrossIcon: false,
                                    buttonAction: () {
                                      Navigator.pushNamed(
                                        context,
                                        widget.data.length > 1
                                            ? '/MultiVoucherSuccessPage'
                                            : '/VoucherSuccessPage',
                                        arguments: widget.data.length > 1
                                            ? data.data.vouchers
                                            : data.data.vouchers[0],
                                      );
                                    });
                              } else {
                                setState(() {
                                  isLoading = false;
                                });
                                failedTransactions.add(response);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: const Text(
                                      "Unable to complete your request!"),
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  backgroundColor: CustomizedTheme.voucherUnpaid,
                                ));
                              }
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: const Text(
                                    "Unable to complete your request!"),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                backgroundColor: CustomizedTheme.voucherUnpaid,
                              ));
                            }
                          } else {
                            setState(
                              () {
                                isLoading = false;
                              },
                            );
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
                      },
                      child: isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Pay",
                              style: CustomizedTheme.sf_w_W500_19,
                            ),
                    ),
                  ),
                ),
              ],
            ),
            verticalSpacer(60),
          ],
        ),
      ),
    );
  }

  Text buildText(String title, TextStyle textStyle) =>
      Text(title, style: textStyle);

  int getTotalAmount() {
    int totalAmount = 0;

    widget.data.forEach((element) {
      totalAmount += element.amount;
    });
    return totalAmount;
  }

  VoucherTransactionRequest getVoucherIds() {
    List<int> ids = List.empty(growable: true);
    widget.data.forEach((element) {
      ids.add(element.id);
    });
    return VoucherTransactionRequest(ids);
  }

  void getUserData() {
    bool isUserExist = storage.containsKey(SharedPrefKeys.user);
    if (isUserExist) {
      String user = storage.getStringValue(SharedPrefKeys.user);
      loginData = UserModel.fromJson(json.decode(user)['data']);
    }
  }
}
