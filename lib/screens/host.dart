import 'package:borderpay/Route_Constants/route_constants.dart';
import 'package:borderpay/Utils/utils.dart';
import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/screens/setting/setting.dart';
import 'package:borderpay/screens/vouchers/vouchers_list.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'home_page/homepage.dart';

int currentIndex = 0;

class HostPage extends StatefulWidget {
  @override
  _HostPageState createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  late PageController _pageController;

  // String selectedPage = RouteConstant.homePage;
  List<String> pageKeys = [
    RouteConstant.homePage,
    RouteConstant.voucherPage,
    RouteConstant.settingPage,
  ];

  final List<Widget> tabs = [
    HomePage(),
    VouchersPage(),
    SettingPage(),
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
      currentIndex = index;
      // selectedPage = pageKeys[index];
      // Utils.dashboardKey.currentState!.pushNamed(selectedPage);
      // Navigator.pushNamed(context,selectedPage);
      // print(selectedPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Utils.scaffoldKey,
      body: tabs[currentIndex],
      bottomNavigationBar:
          // _bottomNavigationBar(
          //   (pageIndex) => (pageIndex) => setState(
          //         () => currentIndex = pageIndex,
          //       ),
          //   selectedIndex: currentIndex,
          // ),
          ConvexAppBar(
        // top: -30,
        curve: Curves.linear,
        curveSize: 70,
        // cornerRadius: 20,
        backgroundColor: CustomizedTheme.primaryBold,
        initialActiveIndex: currentIndex,
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
