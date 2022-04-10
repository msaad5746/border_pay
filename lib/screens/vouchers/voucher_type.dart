import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/model/datamodels/location_model.dart';
import 'package:borderpay/model/arguments/traveler_details_arguments.dart';
import 'package:borderpay/widget/blue_backbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VoucherTypePage extends StatefulWidget {
  LocationModel location;

  VoucherTypePage({Key? key, required this.location}) : super(key: key);

  @override
  _VoucherTypePageState createState() => _VoucherTypePageState();
}

class _VoucherTypePageState extends State<VoucherTypePage> {
  int selection = 0;

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
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20.w),
                child: Text("Select the voucher type:",
                    style: CustomizedTheme.sf_b_W500_17),
              ),
              Center(
                child: Column(
                  children: [
                    widget.location.id == 1
                        ? GestureDetector(
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
                                        'assets/icons/ic_entry_active.png',
                                        fit: BoxFit.fill,
                                      )
                                    : Image.asset(
                                        'assets/icons/ic_entry.png',
                                        fit: BoxFit.fill,
                                      )),
                          )
                        : SizedBox(
                            height: 150.h,
                            // width: 150.w,
                            child: selection == 1
                                ? Image.asset(
                                    'assets/icons/ic_entry_active.png',
                                    fit: BoxFit.fill,
                                  )
                                : Image.asset(
                                    'assets/icons/ic_entry_disabled.png',
                                    fit: BoxFit.fill,
                                  )),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Text("Entry", style: CustomizedTheme.sf_b_W500_17),
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
                                  'assets/icons/ic_exit_active.png',
                                  fit: BoxFit.fill,
                                )
                              : Image.asset(
                                  'assets/icons/ic_exit.png',
                                  fit: BoxFit.fill,
                                )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Text("Exit", style: CustomizedTheme.sf_b_W500_17),
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
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                ),
                                onPressed: () {
                                  // Navigator.pushNamed(context, '/NumberofVoucherPage');
                                  if(selection!=0) {
                                    Navigator.pushNamed(
                                    context,
                                    '/TravelerCatagory',
                                    arguments: DetailsTravelersArg(
                                      type: selection == 1 ? 'ENTRY' : 'EXIT',
                                      locationId: widget.location.id,
                                    ),
                                  );
                                  }
                                },
                                child: Text("Next",
                                    style: CustomizedTheme.sf_w_W500_19),
                              ),
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
}
