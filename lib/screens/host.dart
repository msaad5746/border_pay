import 'package:borderpay/Route_Constants/route_constants.dart';
import 'package:borderpay/Utils/utils.dart';
import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/model/datamodels/bulk_vouchers_model.dart';
import 'package:borderpay/model/datamodels/location_model.dart';
import 'package:borderpay/model/arguments/traveler_details_arguments.dart';
import 'package:borderpay/model/datamodels/voucher_model.dart';
import 'package:borderpay/screens/pay/fee_details.dart';
import 'package:borderpay/screens/pay/number_people.dart';
import 'package:borderpay/screens/pay/payment_refund.dart';
import 'package:borderpay/screens/pay/payment_successful.dart';
import 'package:borderpay/screens/payment_summary/payment_summary.dart';
import 'package:borderpay/screens/payment_web_view.dart';
import 'package:borderpay/screens/setting/setting.dart';
import 'package:borderpay/screens/support/support.dart';
import 'package:borderpay/screens/topup/topup_details.dart';
import 'package:borderpay/screens/topup/topup_select.dart';
import 'package:borderpay/screens/topup/topup_successful.dart';
import 'package:borderpay/screens/travelercatagory/traveler_catagory.dart';
import 'package:borderpay/screens/vouchers/details_of_travelers.dart';
import 'package:borderpay/screens/vouchers/multi_voucher_successful.dart';
import 'package:borderpay/screens/vouchers/number_of_voucher.dart';
import 'package:borderpay/screens/vouchers/single_voucher.dart';
import 'package:borderpay/screens/vouchers/voucher_successful.dart';
import 'package:borderpay/screens/vouchers/voucher_type.dart';
import 'package:borderpay/screens/vouchers/vouchers_list.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import '../widget/custom_alert.dart';
import 'homepage.dart';
import 'vouchers/detailed_voucher.dart';

class HostPage extends StatefulWidget {
  @override
  _HostPageState createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  int _currentIndex = 0;
  late PageController _pageController;
  String selectedPage = RouteConstant.homePage;
  bool navSelected = false;
  List<String> pageKeys = [
    RouteConstant.homePage,
    RouteConstant.voucherPage,
    RouteConstant.settingPage,
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  selectedNavItem(int index) {
    setState(() {
      // _pageController.animateToPage(index,
      //     duration: Duration(milliseconds: 1), curve: Curves.linear);
      // navSelected = false;
      _currentIndex = index;
      selectedPage = pageKeys[index];
      Utils.dashboardKey.currentState!.pushNamed(selectedPage);
      // Navigator.pushNamed(context,selectedPage);
      print(selectedPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Utils.scaffoldKey,
      body: WillPopScope(
        onWillPop: () async => false,
        child: Navigator(
          initialRoute: RouteConstant.homePage,
          key: Utils.dashboardKey,
          onGenerateRoute: (settings) {
            Widget page = const HomePage();
            switch (settings.name) {
              // RouteConstant.homePage,
              // RouteConstant.voucherPage,
              // RouteConstant.settingPage,
              case RouteConstant.homePage:
                page = const HomePage();
                break;
              case '/people_selection':
                page = NumberPeoplePage();
                break;
              case '/fee_detail':
                page = FeeDetailPage();
                break;
              case '/payment_successful':
                page = PaymentSuccessfulPage();
                break;
              case '/payment_refund':
                page = PaymentRefundPage();
                break;
              case RouteConstant.voucherPage:
                page = const VouchersPage();
                break;
              case '/support':
                page = SupportPage();
                break;
              case '/topup':
                page = TopUpPage();
                break;
              case '/topup_detail':
                page = TopUpDetailPage();
                break;
              case '/topup_successful':
                page = TopUpSuccessfulPage();
                break;
              case RouteConstant.settingPage:
                page = SettingPage();
                break;

              //New 2 routing
              case '/TravelerCatagory':
                DetailsTravelersArg data =
                    settings.arguments as DetailsTravelersArg;
                page = TravelerCatagory(
                  type: data.type,
                  locationId: data.locationId,
                );
                break;
              case '/SingleVoucher':
                List<Vouchers> voucher = settings.arguments as List<Vouchers>;
                page = SingleVoucher(
                  voucher: voucher,
                );
                break;
              case '/PaymentSummary':
                List<Vouchers> arg = settings.arguments as List<Vouchers>;
                page = PaymentSummary(
                  data: arg,
                );
                break;
              case '/VoucherSuccessPage':
                Vouchers data = settings.arguments as Vouchers;
                page = VoucherSuccessPage(data: data);
                break;
              case '/VoucherTypePage':
                LocationModel data = settings.arguments as LocationModel;
                page = VoucherTypePage(
                  location: data,
                );
                break;
              case '/NumberofVoucherPage':
                DetailsTravelersArg data =
                    settings.arguments as DetailsTravelersArg;
                page = NumberofVoucherPage(
                  type: data.type,
                  locationId: data.locationId,
                );
                break;
              case '/DetailsTravelersPage':
                DetailsTravelersArg data =
                    settings.arguments as DetailsTravelersArg;
                page = DetailsTravelersPage(
                  travelerCount: data.travelerCount,
                  type: data.type,
                  locationId: data.locationId,
                );
                break;
              case '/MultiVoucherSuccessPage':
                List<Vouchers> data = settings.arguments as List<Vouchers>;
                page = MultiVoucherSuccessPage(
                  vouchersData: data,
                );
                break;
              case '/DetailedVoucher':
                VoucherDataModel data = settings.arguments as VoucherDataModel;
                page = DetailedVoucher(
                  voucherDetails: data,
                );
                break;
              case '/paymentGateway':
                {
                  page = PaymentGateway();

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
                }
            }
            return PageRouteBuilder(
                settings: settings, pageBuilder: (_, __, ___) => page);
          },
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        // top: -30,
        curve: Curves.linear,
        curveSize: 70,
        // cornerRadius: 20,
        backgroundColor: CustomizedTheme.primaryBold,
        initialActiveIndex: _currentIndex,
        style: TabStyle.textIn,
        // height: 65,
        onTap: (index) => selectedNavItem(index),
        items: [
          TabItem(
            activeIcon: CircleAvatar(
                backgroundColor: CustomizedTheme.white,
                child: Image.asset('assets/icons/ic_home_active.png')),
            icon: Image.asset('assets/icons/ic_home.png'),
            title: 'Home',
          ),
          TabItem(
              activeIcon: CircleAvatar(
                  backgroundColor: CustomizedTheme.white,
                  child: Image.asset('assets/icons/ic_voucher_active.png')),
              icon: Image.asset('assets/icons/ic_voucher.png'),
              title: 'Vouchers'),
          TabItem(
              activeIcon: CircleAvatar(
                  backgroundColor: CustomizedTheme.white,
                  child: Image.asset('assets/icons/ic_setting_active.png')),
              icon: Image.asset('assets/icons/ic_setting.png'),
              title: 'Settings'),
        ],
      ),
    );
  }
}
