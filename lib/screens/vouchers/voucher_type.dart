import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/model/datamodels/location_model.dart';
import 'package:borderpay/model/arguments/traveler_details_arguments.dart';
import 'package:borderpay/widget/blue_backbutton.dart';
import 'package:borderpay/widget/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../localization/app_localization.dart';
import '../../localization/translation_keys.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacer(56),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 37.26.h,
                  width: 37.26.w,
                  // margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10.11.r,
                    ),
                    color: CustomizedTheme.colorAccent,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: CustomizedTheme.white,
                  ),
                ),
              ),
              verticalSpacer(26),
              Text(
                AppLocalizations.of(context)!.translate(
                  TranslationKeys.selectTheVoucherType,
                ),
                style: CustomizedTheme.sf_b_W500_17,
              ),
              verticalSpacer(16),
              Center(
                child: Column(
                  children: [
                    widget.location.id == 1
                        ? GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  selection = 1;
                                },
                              );
                            },
                            child: SizedBox(
                              height: 150.h,
                              // width: 150.w,
                              child: selection == 1
                                  ? SvgPicture.asset(
                                      AppLocalizations.of(context)!.translate(
                                        TranslationKeys.ic_entry_active,
                                      ),
                                      fit: BoxFit.fill,
                                    )
                                  : SvgPicture.asset(
                                      AppLocalizations.of(context)!.translate(
                                        TranslationKeys.ic_entry_inactive,
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          )
                        : SizedBox(
                            height: 150.h,
                            child: selection == 1
                                ? SvgPicture.asset(
                                    AppLocalizations.of(context)!.translate(
                                      TranslationKeys.ic_entry_active,
                                    ),
                                    /* 'assets/svg/ic_entry_active.svg',*/
                                    fit: BoxFit.fill,
                                  )
                                : SvgPicture.asset(
                                    AppLocalizations.of(context)!.translate(
                                      TranslationKeys.ic_entry_disable,
                                    ),
                                    /*'assets/svg/ic_entry_disabled.svg',*/
                                    fit: BoxFit.fill,
                                  ),
                          ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Text(
                          AppLocalizations.of(context)!.translate(
                            TranslationKeys.entry,
                          ),
                          style: CustomizedTheme.sf_b_W500_17),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            selection = 2;
                          },
                        );
                      },
                      child: SizedBox(
                        height: 150.h,
                        // width: 150.w,
                        child: selection == 2
                            ? SvgPicture.asset(
                                AppLocalizations.of(context)!.translate(
                                  TranslationKeys.ic_exit_active,
                                ),
                                /*'assets/svg/ic_exit_active.svg',*/
                                fit: BoxFit.fill,
                              )
                            : SvgPicture.asset(
                                AppLocalizations.of(context)!.translate(
                                  TranslationKeys.ic_exit_inactive,
                                ),
                                /*'assets/svg/ic_exit_with_circle.svg',*/
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.h,
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.translate(
                          TranslationKeys.exit,
                        ),
                        style: CustomizedTheme.sf_b_W500_17,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 50.h,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              // width: 154.94,
                              height: 56.8.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  11.72.r,
                                ),
                                // border: Border.all(color: CustomizedTheme.primaryColor,width: .5),
                                color: CustomizedTheme.colorAccent,
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: CustomizedTheme.colorAccent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      10.r,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  // Navigator.pushNamed(context, '/NumberofVoucherPage');
                                  if (selection != 0) {
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
                                child: Text(
                                  AppLocalizations.of(context)!.translate(
                                    TranslationKeys.next,
                                  ),
                                  style: CustomizedTheme.sf_w_W500_19,
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
            ],
          ),
        ),
      ),
    );
  }
}
