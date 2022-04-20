import 'dart:io';

import 'package:borderpay/app_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_mail_app/open_mail_app.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: 50.0.h, left: 20.36.w, right: 20.36.w),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: 37.26.h,
                      width: 37.26.w,
                      // margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.11.r),
                          color: CustomizedTheme.colorAccent),
                      child:
                          Icon(Icons.arrow_back, color: CustomizedTheme.white)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.92.w),
                  child:
                      Text("Support", style: CustomizedTheme.title_sf_W500_21),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 20.36.w, right: 20.36.w, top: 29.92.h, bottom: 18.63.h),
            child: Text("Are you facing a difficulty?",
                style: CustomizedTheme.poppins_dark_W500_19),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 20.36.w, vertical: 29.92.h),
            child: Text(
                "If you are facing any difficulty or you have any question, you can contact us by the following ways.",
                style: CustomizedTheme.sf_b_W400_15),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              // width: 154.94,
              height: 60.77.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.97.r),
                border:
                    Border.all(color: CustomizedTheme.primaryBold, width: .5.w),
                color: CustomizedTheme.primaryBold,
              ),
              child: TextButton(
                  onPressed: () {
                    openWhatsapp();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 26.93.w, right: 32.w),
                        child: Image.asset(
                          'assets/icons/ic_chat.png',
                          color: CustomizedTheme.white,
                        ),
                      ),
                      Expanded(
                          child: Text("Live Chat with Customer Support",
                              style: CustomizedTheme.sf_w_W400_1592)),
                    ],
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 26.23.h),
            child: Container(
              // width: 154.94,
              height: 60.77.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.97.r),
                border:
                    Border.all(color: CustomizedTheme.primaryBold, width: .5.w),
                color: CustomizedTheme.primaryBold,
              ),
              child: TextButton(
                  onPressed: () {
                    openEmail();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 26.93.w, right: 32.93.w),
                        child: Image.asset(
                          'assets/icons/ic_email.png',
                          color: CustomizedTheme.white,
                        ),
                      ),
                      Text("Contact Us By Email",
                          style: CustomizedTheme.sf_w_W400_1592),
                    ],
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              // width: 154.94,
              height: 60.77.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.97.r),
                border:
                    Border.all(color: CustomizedTheme.primaryBold, width: .5.w),
                color: CustomizedTheme.primaryBold,
              ),
              child: TextButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/new_user');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 26.93.w, right: 32.93.w),
                        child: Image.asset(
                          'assets/icons/ic_faq.png',
                          color: CustomizedTheme.white,
                        ),
                      ),
                      Text("Check the FAQs",
                          style: CustomizedTheme.sf_w_W400_1592),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }

  openWhatsapp() async {
    var whatsapp = "+971526380400";
    var whatsappUrlAndroid =
        "whatsapp://send?phone=" + whatsapp + "&text=hello";
    var whatappUrlIOS = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappUrlIOS)) {
        await launch(whatappUrlIOS, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("whatsapp not installed")));
      }
    } else {
      // android , web
      if (await canLaunch(whatsappUrlAndroid)) {
        await launch(whatsappUrlAndroid);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("whatsapp not installed")));
      }
    }
  }

  openEmail() async {
    EmailContent email = EmailContent(
      to: [
        'shahid@paynest.ae',
      ],
      subject: 'border_pay query!',
      body: '',
      // cc: ['user2@domain.com', 'user3@domain.com'],
      // bcc: ['boss@domain.com'],
    );

    OpenMailAppResult result = await OpenMailApp.composeNewEmailInMailApp(
        nativePickerTitle: 'Select email app to compose', emailContent: email);
    if (!result.didOpen && !result.canOpen) {
      showNoMailAppsDialog(context);
    } else if (!result.didOpen && result.canOpen) {
      showDialog(
        context: context,
        builder: (_) => MailAppPickerDialog(
          mailApps: result.options,
          emailContent: email,
        ),
      );
    }
  }

  void showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Open Mail App"),
          content: const Text("No mail apps installed"),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
