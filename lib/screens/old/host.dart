// import 'dart:io';
//
// import 'package:borderpay/Route_Constants/route_constants.dart';
// import 'package:borderpay/Utils/utils.dart';
// import 'package:borderpay/app_theme/theme.dart';
// import 'package:borderpay/screens/pay/fee_details.dart';
// import 'package:borderpay/screens/pay/number_people.dart';
// import 'package:borderpay/screens/pay/payment_refund.dart';
// import 'package:borderpay/screens/pay/payment_successful.dart';
// import 'package:borderpay/screens/setting/setting.dart';
// import 'package:borderpay/screens/support/support.dart';
// import 'package:borderpay/screens/topup/topup_details.dart';
// import 'package:borderpay/screens/topup/topup_select.dart';
// import 'package:borderpay/screens/topup/topup_successful.dart';
// import 'package:borderpay/screens/vouchers/vouchers_list.dart';
// import 'package:flutter/material.dart';
// import 'package:bottom_navy_bar/bottom_navy_bar.dart';
//
//
// import 'homepage.dart';
//
// class HostPage extends StatefulWidget {
//
//   @override
//   _HostPageState createState() => _HostPageState();
// }
//
// class _HostPageState extends State<HostPage> {
//   int _currentIndex = 0;
//   late PageController _pageController;
//   String selectedPage = RouteConstant.homePage;
//   bool navSelected = false;
//   List<String> pageKeys = [
//     RouteConstant.homePage,
//     RouteConstant.voucherPage,
//     RouteConstant.settingPage,
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   selectedNavItem(int index) {
//     setState(() {
//       // _pageController.animateToPage(index,
//       //     duration: Duration(milliseconds: 1), curve: Curves.linear);
//       // navSelected = false;
//       _currentIndex = index;
//       selectedPage = pageKeys[index];
//       Utils.dashboardKey.currentState!.pushNamed(selectedPage);
//       // Navigator.pushNamed(context,selectedPage);
//       print(selectedPage);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: Utils.scaffoldKey,
//       body: WillPopScope(
//         onWillPop: () async => false,
//         child: Navigator(
//           initialRoute: RouteConstant.homePage,
//           key: Utils.dashboardKey,
//           onGenerateRoute: (settings) {
//             Widget page = HomePage();
//             switch(settings.name){
//             // RouteConstant.homePage,
//             // RouteConstant.voucherPage,
//             // RouteConstant.settingPage,
//               case RouteConstant.homePage:
//                 page = HomePage();
//                 break;
//               case '/people_selection':
//                 page = NumberPeoplePage();
//                 break;
//               case '/fee_detail':
//                 page = FeeDetailPage();
//                 break;
//               case '/payment_successful':
//                 page = PaymentSuccessfulPage();
//                 break;
//               case '/payment_refund':
//                 page = PaymentRefundPage();
//                 break;
//               case RouteConstant.voucherPage:
//                 page = VouchersPage();
//                 break;
//               case '/support':
//                 page = SupportPage();
//                 break;
//               case '/topup':
//                 page = TopUpPage();
//                 break;
//               case '/topup_detail':
//                 page = TopUpDetailPage();
//                 break;
//               case '/topup_successful':
//                 page = TopUpSuccessfulPage();
//                 break;
//               case RouteConstant.settingPage:
//                 page = SettingPage();
//                 break;
//             }
//             return PageRouteBuilder(
//                 settings: settings,
//                 pageBuilder: (_, __, ___) => page
//             );
//           },
//         ),
//       ),
//       bottomNavigationBar: SafeArea(
//         child: Container(
//           height: Platform.isIOS ? 65 : 65,
//           padding: EdgeInsets.symmetric(horizontal: 28,vertical: 12),
//           decoration: BoxDecoration(
//               color: CustomizedTheme.primaryBold,
//               borderRadius: BorderRadius.vertical(top: Radius.circular(20))
//           ),
//           child: BottomNavyBar(
//             itemCornerRadius: 10,
//             // containerHeight: 95,
//             curve: Curves.bounceIn,
//             backgroundColor: CustomizedTheme.primaryBold,
//             selectedIndex: _currentIndex,
//             showElevation: false, // use this to remove appBar's elevation
//             onItemSelected: (index) => selectedNavItem(index),
//             //     setState(() {
//             //   selectedNavItem(index);
//             //   _currentIndex = index;
//             // }),
//             items: [
//               BottomNavyBarItem(
//                   inactiveColor: CustomizedTheme.white,
//                   icon: Icon(Icons.home_outlined),
//                   title: Text('Home',style: CustomizedTheme.sf_w_W300_14),
//                   activeColor: CustomizedTheme.white.withOpacity(.2)
//               ),
//               BottomNavyBarItem(
//                   inactiveColor: CustomizedTheme.white,
//                   icon: Image.asset('assets/icons/ic_voucher.png'),
//                   title: FittedBox(child: Text('My Vouchers',style: CustomizedTheme.sf_w_W300_14)),
//                   activeColor: CustomizedTheme.white.withOpacity(.2)
//               ),
//               BottomNavyBarItem(
//                   inactiveColor: CustomizedTheme.white,
//                   icon: Image.asset('assets/icons/ic_setting.png'),
//                   title: Text('Settings',style: CustomizedTheme.sf_w_W300_14),
//                   activeColor: CustomizedTheme.white.withOpacity(.2)
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
