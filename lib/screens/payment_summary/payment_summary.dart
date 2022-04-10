import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/model/datamodels/bulk_vouchers_model.dart';
import 'package:borderpay/screens/payment_web_view.dart';
import 'package:borderpay/widget/blue_backbutton.dart';
import 'package:borderpay/widget/custom_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentSummary extends StatefulWidget {
  final List<Vouchers> data;

  const PaymentSummary({Key? key, required this.data}) : super(key: key);

  @override
  _PaymentSummaryState createState() => _PaymentSummaryState();
}

class _PaymentSummaryState extends State<PaymentSummary> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.36.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Payment Summary', style: CustomizedTheme.sf_b_W500_26),
              ...List.generate(
                widget.data.length,
                (index) => Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 33.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Voucher Number: ",
                              style: CustomizedTheme.sf_b_W700_17),
                          Spacer(),
                          Container(
                            width: 150.w,
                            child: Text(widget.data[index].voucherNo,
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                                style: CustomizedTheme.sf_b_W700_17),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildText(
                            "Traveller Name", CustomizedTheme.sf_b_W400_17),
                        buildText(
                            widget.data[index].user.firstName +
                                ' ' +
                                widget.data[index].user.lastName,
                            CustomizedTheme.sf_b_W500_17),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildText(
                              "Voucher Amount", CustomizedTheme.sf_b_W400_17),
                          buildText(
                              "AED " + widget.data[index].amount.toString(),
                              CustomizedTheme.sf_b_W500_17),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 1.h,
                width: 1.sw,
                color: CustomizedTheme.primaryBold,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildText("Total Amount", CustomizedTheme.sf_b_W700_17),
                    buildText("AED " + getTotalAmount(),
                        CustomizedTheme.sf_b_W500_17),
                  ],
                ),
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
                            borderRadius: BorderRadius.circular(11.72.r),
                            // border: Border.all(color: CustomizedTheme.primaryColor,width: .5),
                            color: CustomizedTheme.colorAccent),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: CustomizedTheme.colorAccent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: () async {
                              Navigator.pushNamed(context, PaymentGateway.route);

                              // if(isSuccessful as bool){
                              //   CustomAlertDialog.baseDialog(
                              //       context: context,
                              //       title: 'Successfully Purchased',
                              //       message: 'Voucher successfully purchased',
                              //       buttonAction: () {
                              //         Navigator.pushNamed(
                              //           context,
                              //           widget.data.length > 1
                              //               ? '/MultiVoucherSuccessPage'
                              //               : '/VoucherSuccessPage',
                              //           arguments: widget.data.length > 1
                              //               ? widget.data
                              //               : widget.data[0],
                              //         );
                              //       });
                              // }

                            },
                            child: Text("Pay",
                                style: CustomizedTheme.sf_w_W500_19)),
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

  Text buildText(String title, TextStyle textStyle) =>
      Text(title, style: textStyle);

  String getTotalAmount() {
    double totalAmount = 0.0;

    widget.data.forEach((element) {
      totalAmount += double.parse(element.amount);
    });
    return totalAmount.toString();
  }
}
