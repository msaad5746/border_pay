import 'dart:async';

import 'package:borderpay/Utils/utils.dart';
import 'package:borderpay/localization/locale_constants.dart';
import 'package:borderpay/model/arguments/payment_arguments.dart';
import 'package:borderpay/model/arguments/register_datatoserver.dart';
import 'package:borderpay/model/arguments/register_first.dart';
import 'package:borderpay/model/arguments/register_two.dart';
import 'package:borderpay/screens/change_password/change_password.dart';
import 'package:borderpay/screens/forget_password/new_otp.dart';
import 'package:borderpay/screens/forget_password/new_password.dart';
import 'package:borderpay/screens/home_page/homepage.dart';
import 'package:borderpay/screens/host.dart';
import 'package:borderpay/screens/login.dart';
import 'package:borderpay/screens/otp.dart';
import 'package:borderpay/screens/phone.dart';
import 'package:borderpay/screens/register_page.dart';
import 'package:borderpay/screens/resident.dart';
import 'package:borderpay/screens/scan_id.dart';
import 'package:borderpay/screens/update_profile/update_profile.dart';
import 'package:borderpay/screens/vouchers/detailed_voucher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:borderpay/Route_Constants/route_constants.dart';
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
import 'di/di.dart';
import 'model/datamodels/user_model.dart';
import 'screens/forget_password/mobile_number.dart';
import 'screens/welcome_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static void restartApp(BuildContext context) {
    final _MyAppState state =
        context.findAncestorStateOfType<State<MyApp>>() as _MyAppState;
    state.restartApp();
  }

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return ScreenUtilInit(
      builder: () => MaterialApp(
        key: key,
        localizationsDelegates: localizationDelegates,
        localeResolutionCallback: getSelectedLang,
        supportedLocales: supportedLocale,
        debugShowCheckedModeBanner: false,
        navigatorKey: Utils.mainKey,
        title: 'BorderPay',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        // home: const ,
        onGenerateRoute: (settings) {
          Widget page = WelcomePage();
          switch (settings.name) {
            case '/':
              page = WelcomePage();
              break;
            case '/ResidentPage':
              page = ResidentPage();
              break;
            case '/RegisterPage':
              page = RegisterPage();
              break;

            case '/updateProfile':
              UserModel data = settings.arguments as UserModel;
              page = UpdateProfilePage(
                userData: data,
              );
              break;
            case '/ScanIDPage':
              RegisterFirst data = settings.arguments as RegisterFirst;
              page = ScanIDPage(
                firstName: data.firstName,
                lastName: data.lastName,
                areaCode: data.areaCode,
                phone: data.phone,
                password: data.password,
                email: data.email,
                nationality: data.nationality,
                nationalityId: data.nationalityId,
              );
              break;
            case '/PhonePage':
              RegisterTwo data = settings.arguments as RegisterTwo;
              page = PhonePage(
                firstName: data.firstName,
                lastName: data.lastName,
                areaCode: data.areaCode,
                phone: data.phone,
                email: data.email,
                nationality: data.nationality,
                password: data.password,
                nationalityId: data.nationalityId,
                eid: data.eid,
                image: data.image,
              );
              break;
            case '/otp':
              RegisterDataServer data =
                  settings.arguments as RegisterDataServer;
              page = OTPPage(
                firstName: data.firstName,
                lastName: data.lastName,
                areaCode: data.areaCode,
                phone: data.phone,
                password: data.password,
                email: data.email,
                nationality: data.nationality,
                emiratedpassport: data.emiratedpassport,
                image: data.image,
              );
              break;
            case '/changePassword':
              UserModel data = settings.arguments as UserModel;
              page = ChangePasswordPage(
                userData: data,
              );
              break;
            case '/login':
              page = LoginPage();
              break;
            case RouteConstant.hostPage:
              page = HostPage();
              break;
            case RouteConstant.forgetPhone:
              page = PhoneNumberPage();
              break;
            case RouteConstant.forgetOtp:
              String data = settings.arguments as String;
              page = ForgetOtpPage(
                phone: data,
              );
              break;
            case RouteConstant.forgetNewPassword:
              List<String> data = settings.arguments as List<String>;
              page = NewPasswordPage(
                phone: data[0],
                otpCode: data[1],
              );
              break;
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
              page = TravelerCategory(
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
                PaymentArgument arg = settings.arguments as PaymentArgument;
                page = PaymentGateway(
                  argument: arg,
                );

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
      designSize: const Size(375, 812),
    );
    // : const MaterialApp(
    //     home: Text(''),
    //     debugShowCheckedModeBanner: false,
    //   );
  }
}
